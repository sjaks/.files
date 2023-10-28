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


######################
# CONFIGURE PACKAGES #
######################

# Pacman init
sudo pacman -Syu --noconfirm

# Install additional Gnome packages with pacman
sudo pacman -S \
base-devel \
htop \
gcc \
ufw \
vim \
unzip \
unrar \
curl \
wget \
ufw \
traceroute \
rsync \
entr \
nmap \
whois \
ncdu \
mlocate \
the_silver_searcher \
moreutils \
papirus-icon-theme \
neofetch \
python3 \
python-pip \
flake8 \
docker \
docker-compose \
noto-fonts-emoji \
gnome-tweak-tool \
gnome-browser-connector \
gnome-sound-recorder \
pavucontrol \
mpv \
inkscape \
gimp \
obs-studio \
discord \
telegram-desktop \
steam \
fragments \
firefox

# Install apps only available on flathub
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub com.visualstudio.code

# Remove unnecessary preinstalled things
sudo pacman -R --noconfirm \
cheese \
gnome-weather \
gnome-clocks \
gnome-contacts \
gnome-connections \
gnome-maps \
gnome-characters \
gnome-font-viewer \
gnome-tour \
gnome-photos \
gnome-calendar \
totem \
gnome-music \
gnome-user-docs \
simple-scan \
baobab\
yelp \
epiphany \


# Install vscode extensions
code --install-extension piousdeer.adwaita-theme
code --install-extension ms-python.python
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension ecmel.vscode-html-css
code --install-extension esbenp.prettier-vscode
code --install-extension ms-azuretools.vscode-docker
code --install-extension bradlc.vscode-tailwindcss
code --install-extension PKief.material-icon-theme
code --install-extension shardulm94.trailing-spaces
code --install-extension eamodio.gitlens


############################
# CONFIGURE POWER BEHAVIOR #
############################

# Set screen power settings
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.lockdown disable-lock-screen false
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.settings-daemon.plugins.power idle-dim true

# Disable inactivity suspending
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

# Set power button action
gsettings set org.gnome.settings-daemon.plugins.power power-button-action suspend


###########################
# SET APPEARANCE SETTINGS #
###########################

# Enable Gnome animations
gsettings set org.gnome.desktop.interface enable-animations true

# Set wallpaper
gsettings set org.gnome.desktop.background picture-uri 'https://i.imgur.com/B81oLyw.jpg'

# Set themes
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
sudo machinectl shell gdm@ /bin/bash -c "gsettings set org.gnome.desktop.interface icon-theme 'Papirus'"

# Change dock favourites
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Console.desktop', 'org.gnome.TextEditor.desktop']"

# Show window buttons
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

# Reset avatar
sudo rm /var/lib/AccountsService/icons/sami

# Hide unwanted clutter from the app grid
for FILE in `cat /home/sami/.files/rc/grid`; do
    if [ -e "$/usr/share/applications/${FILE}" ]; then
        echo "NoDisplay=true" > "/home/sami/.local/share/applications/${FILE}"
    fi
done
gsettings set org.gnome.desktop.app-folders folder-children ['']
gsettings reset org.gnome.shell app-picker-layout


################################
# CONFIGURE KEYBOARD SHORTCUTS #
################################

# Set a keyboard hotkey for closing a window
gsettings set org.gnome.desktop.wm.keybindings close "['<Super><Shift>q']"

# Configure custom hotkeys
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/','/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'gnome-console'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command '/usr/bin/kgx'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>Return'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'gnome-files'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command '/usr/bin/nautilus'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Super><Shift>Return'
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['<Alt>Page_Up']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['<Alt>Page_Down']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute "['<Alt>Insert']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Control><Super>Return']"

# Better alt+tab
dconf write /org/gnome/desktop/wm/keybindings/switch-applications "['<Super>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications-backward "['<Shift><Super>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-windows "['<Alt>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-windows-backward "['<Shift><Alt>Tab']"

# Hide all active windows hotkey
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"


###################################
# CONFIGURE DIRECTORIES AND FILES #
###################################

# Setup directories
mkdir /home/sami/.ssh
chown sami /home/sami/.ssh
chmod 700 /home/sami/.ssh

# Fetch and link global dotfiles and configs
ln -sf /home/sami/.files/rc/bashrc /home/sami/.bashrc
ln -sf /home/sami/.files/rc/nanorc /home/sami/.nanorc
ln -sf /home/sami/.files/rc/gitconfig /home/sami/.gitconfig
ln -sf /home/sami/.files/rc/code /home/sami/.var/app/com.visualstudio.code/config/Code/User/settings.json
ln -sf /home/sami/.files/rc/hidden /home/sami/.hidden

# Link the bare minimum dotfiles for the root user
sudo ln -sf /home/sami/.files/rc/bashrc /root/.bashrc
sudo ln -sf /home/sami/.files/rc/nanorc /root/.nanorc
sudo ln -sf /home/sami/.files/rc/pacman /etc/pacman.conf


###############################
# DO ADDITIONAL CONFIGURATION #
###############################

# Set Nautilus settings
gsettings set org.gnome.nautilus.preferences default-folder-viewer "list-view"
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'detailed_type', 'size', 'date_modified']"

# Disable lock screen notifications that turn on the screen
gsettings set org.gnome.desktop.notifications show-in-lock-screen false

# Show Gnome bar settings
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Enable sound over-amplification
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true

# Set timezone
sudo timedatectl set-timezone Europe/Helsinki

# Config docker service
sudo gpasswd -a sami docker
sudo usermod -aG docker sami
sudo systemctl restart docker
sudo systemctl enable docker

# Enable firewall
sudo ufw enable


###############
# FINAL STEPS #
###############

clear
echo ""
echo "  The script has finished running."
echo ""
