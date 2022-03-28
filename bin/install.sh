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

# Install extra repositories
sudo dnf -y install fedora-workstation-repositories
sudo dnf config-manager -y --set-enabled google-chrome
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf -y upgrade

# Install additional Gnome packages with apt
sudo dnf -y install \
htop \
git \
gcc \
ufw \
vim \
unzip \
curl \
wget \
traceroute \
rsync \
entr \
nmap \
whois \
ncdu \
mlocate \
the_silver_searcher \
moreutils \
google-noto-emoji-fonts \
neofetch \
python3 \
python3-pip \
python-flake8 \
nodejs \
npm \
docker \
docker-compose \
gimp \
gnome-tweak-tool \
gnome-sound-recorder \
pavucontrol \
inkscape \
dia \
poedit \
rhythmbox \
google-chrome-stable \
codium \
telegram-desktop \
discord \
steam \
obs-studio

# Remove unnecessary preinstalled things
sudo dnf -y remove \
firefox \
cheese \
gedit \
gnome-weather \
gnome-clocks \
gnome-contacts \
gnome-connections \
gnome-maps

# Install vscode extensions
codium --install-extension olifink.fedora-gnome-light-dark
codium --install-extension ms-python.python
codium --install-extension bmewburn.vscode-intelephense-client
codium --install-extension ms-vscode.cpptools
codium --install-extension ms-vscode.vscode-typescript-next
codium --install-extension ecmel.vscode-html-css
codium --install-extension ms-azuretools.vscode-docker


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

# Edit Gnome terminal profile
profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1}
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-columns 125
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-rows 36
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scrollbar-policy "never"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cursor-shape "underline"

# Remove favourites from dock
gsettings set org.gnome.shell favorite-apps "[]"


################################
# CONFIGURE KEYBOARD SHORTCUTS #
################################

# Set a keyboard hotkey for closing a window
gsettings set org.gnome.desktop.wm.keybindings close "['<Super><Shift>q']"

# Configure custom hotkeys
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command '/usr/bin/gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>Return'
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['<Alt>Page_Up']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['<Alt>Page_Down']"


###################################
# CONFIGURE DIRECTORIES AND FILES #
###################################

# Remove unused home directories
rm -rf /home/sami/Templates
rm -rf /home/sami/Public
rm -rf /home/sami/.mozilla

# Setup directories
mkdir -p /home/sami/.config/VSCodium/User/
mkdir /home/sami/.ssh
chown sami /home/sami/.ssh
chmod 700 /home/sami/.ssh

# Fetch and link global dotfiles and configs
ln -sf /home/sami/.files/rc/bashrc /home/sami/.bashrc
ln -sf /home/sami/.files/rc/nanorc /home/sami/.nanorc
ln -sf /home/sami/.files/rc/gitconfig /home/sami/.gitconfig
ln -sf /home/sami/.files/rc/code /home/sami/.config/VSCodium/User/settings.json

# Link the bare minimum dotfiles for the root user
sudo ln -sf /home/sami/.files/rc/bashrc /root/.bashrc
sudo ln -sf /home/sami/.files/rc/nanorc /root/.nanorc

# Fetch and link Gnome specific dotfiles and configs
ln -sf /home/sami/.files/pic/avatar.jpg /home/sami/.face
ln -sf /home/sami/.files/rc/hidden /home/sami/.hidden


###############################
# DO ADDITIONAL CONFIGURATION #
###############################

# Set Nautilus settings
gsettings set org.gnome.nautilus.preferences default-folder-viewer "list-view"
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.nautilus.preferences sort-directories-first true
gsettings set org.gnome.nautilus.list-view default-visible-columns ['name', 'detailed_type', 'size', 'date_modified']

# Show Gnome bar settings
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Enable sound over-amplification
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true

# Set timezone
sudo timedatectl set-timezone Europe/Helsinki

# Add user to docker group
sudo usermod -aG docker sami


###############
# FINAL STEPS #
###############

# Clear unnecessary dependencies
sudo dnf -y autoremove

clear
echo ""
echo "  The script has finished running."
echo ""
