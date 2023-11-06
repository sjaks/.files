# .files
# sjaks@github.com

###########################
# INITIALIZE INSTALLATION #
###########################

# Reload all dconf settings
dconf reset -f /

# Set the keyboard layout
setxkbmap fi
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'fi')]"

# Set timezone
sudo timedatectl set-timezone Europe/Helsinki

# Pacman init
sudo pacman -Syu --noconfirm


######################
# CONFIGURE PACKAGES #
######################

# Install pacman packages
sudo pacman -S --noconfirm --needed $(< ${HOME}/.files/pkg/pacman)

# Install apps better available on Flathub
while IFS= read -r package; do flatpak install -y flathub "$package"; done < ${HOME}/.files/pkg/flathub

# Install code extensions
while IFS= read -r extension; do code --install-extension "$extension"; done < ${HOME}/.files/pkg/vscode

# Remove bloatware
sudo pacman -R --noconfirm $(< ${HOME}/.files/pkg/blacklist)


###########################
# SET APPEARANCE SETTINGS #
###########################

# Download wappaper
wget -O ${HOME}/.wallpaper.jpg https://i.imgur.com/B81oLyw.jpg

# Set GDM icon theme
sudo machinectl shell gdm@ /bin/bash -c "gsettings set org.gnome.desktop.interface icon-theme 'Papirus'"

# Reset avatar
sudo rm /var/lib/AccountsService/icons/${USER}

# Load dconf dump
dconf load / < ${HOME}/.files/rc/dconf


###################################
# CONFIGURE DIRECTORIES AND FILES #
###################################

# Setup ssh directory
mkdir ${HOME}/.ssh
chown $USER ${HOME}/.ssh
chmod 700 ${HOME}/.ssh

# Generate a new key
if [ -f "${HOME}/.ssh/id_ed25519" ]; then
    echo "-> SSH key already exists, won't overwrite."
else
    echo "-> Generating new SSH key."
    ssh-keygen -q -t ed25519 -f ~/.ssh/id_ed25519 -N ''
fi

# Fetch and link global dotfiles and configs
ln -sf ${HOME}/.files/rc/bashrc ${HOME}/.bashrc
ln -sf ${HOME}/.files/rc/nanorc ${HOME}/.nanorc
ln -sf ${HOME}/.files/rc/gitconfig ${HOME}/.gitconfig
ln -sf ${HOME}/.files/rc/code ${HOME}/.var/app/com.visualstudio.code/config/Code/User/settings.json
ln -sf ${HOME}/.files/rc/hidden ${HOME}/.hidden

# Link the bare minimum dotfiles for the root user
sudo ln -sf ${HOME}/.files/rc/bashrc /root/.bashrc
sudo ln -sf ${HOME}/.files/rc/nanorc /root/.nanorc
sudo ln -sf ${HOME}/.files/rc/pacman /etc/pacman.conf


###############################
# DO ADDITIONAL CONFIGURATION #
###############################

# Configure Docker
sudo gpasswd -a ${USER} docker
sudo usermod -aG docker ${USER}
sudo systemctl restart docker
sudo systemctl enable docker

# Enable firewall
sudo ufw enable
sudo systemctl enable ufw

# Hide unwanted clutter from the app grid
APPLICATION_PATH="/usr/share/applications"
USER_APPLICATION_PATH="${HOME}/.local/share/applications"
for FILE in `cat ${HOME}/.files/pkg/grid`; do
    if [ -e "${APPLICATION_PATH}/${FILE}" ]; then
        echo "NoDisplay=true" > "${USER_APPLICATION_PATH}/${FILE}"
    elif [ ! -e "${APPLICATION_PATH}/${FILE}" ] && [ -e "${USER_APPLICATION_PATH}/${FILE}" ]; then
        rm "${USER_APPLICATION_PATH}/${FILE}"
    fi
done
gsettings set org.gnome.desktop.app-folders folder-children ['']
gsettings reset org.gnome.shell app-picker-layout


###############
# FINAL STEPS #
###############

echo "-> The script has finished running."
echo "-> Use the following public key:"
cat ${HOME}/.ssh/id_ed25519.pub
