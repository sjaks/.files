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

# Install additional Gnome packages with apt
sudo apt -y -q install \
neofetch \
unzip \
htop \
catimg \
ccze \
colordiff \
vim \
curl \
wget \
mlocate \
silversearcher-ag \
git \
net-tools \
traceroute \
nmap \
whois \
idn \
speedtest-cli \
influxdb-client \
gcc \
build-essential \
python3 \
python3-pip \
nodejs \
npm \
rsync \
entr \
ncdu \
cowsay \
ufw \
gimp \
obs-studio \
shotcut \
fonts-noto-color-emoji \
pavucontrol \
qt5-style-plugins \
arc-theme \
papirus-icon-theme \
mesa-utils \
scrot \
texlive-latex-recommended \
texlive-lang-european \
poedit \
flake8 \
php-codesniffer \
ruby-dev \
ruby-bundler \
qt5-default \
qtcreator \
moreutils \
docker \
docker-compose \
inkscape \
dia \
audacity \
hardinfo \
steam \
gnome-tweak-tool \
rhythmbox \
gitg \
gedit-plugins \
gnome-shell-extensions \
dconf-cli

# Remove unneeded preinstalled things
sudo apt -y remove \
firefox \
firefox-locale-en \
thunderbird \
aisleriot \
gnome-mahjongg \
gnome-mines \
gnome-sudoku

# Install snaps
sudo snap install spotify
sudo snap install telegram-desktop
sudo snap install discord
sudo snap install code --classic
sudo snap install slack --classic
sudo snap install zoom-client

# Install Google Chrome
wget -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/chrome.deb
sudo apt -y install -f

# Install vscode extensions
code --install-extension ph-hawkins.arc-plus
code --install-extension ms-python.python
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension ecmel.vscode-html-css
code --install-extension ms-azuretools.vscode-docker


############################
# CONFIGURE POWER BEHAVIOR #
############################

# Set screen power settings
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend true

# Disable autodim
gsettings set org.gnome.settings-daemon.plugins.power idle-dim true

# Disable inactivity suspending
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

# Set power button action
gsettings set org.gnome.settings-daemon.plugins.power power-button-action suspend

###########################
# SET APPEARANCE SETTINGS #
###########################

# Set themes
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
gsettings set org.gnome.shell.extensions.user-theme name 'Arc-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
dconf write /org/gnome/terminal/legacy/theme-variant "'dark'"

# Set dock settings
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 36
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
gsettings set org.gnome.shell favorite-apps []

# Hide Gnome 3 desktop icons (Ubuntu specific)
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

# Edit Gnome terminal profile
profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1}
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-columns 150
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-rows 45
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color "'#2f343f'"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" foreground-color "'#f3f4f5'"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" palette "['#262b36', '#9c3528', '#61bc3b', '#f3b43a', '#0d68a8', '#744560', '#288e9c', '#a2a2a2', '#2f343f', '#d64937', '#86df5d', '#fdd75a', '#0f75bd', '#9e5e83', '#37c3d6', '#f9f9f9']"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scrollbar-policy "never"

# Change shell theme
killall -3 gnome-shell
gsettings set org.gnome.shell enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.github.com']"
killall -3 gnome-shell
gsettings set org.gnome.shell.extensions.user-theme name ''

################################
# CONFIGURE KEYBOARD SHORTCUTS #
################################

# Set a keyboard hotkey for closing a window
gsettings set org.gnome.desktop.wm.keybindings close "['<Super><Shift>q']"

# Configure terminal hotkey
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '[]'
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
mkdir -p /home/sami/.config/Code/User/
mkdir /home/sami/.ssh
chown sami /home/sami/.ssh
chmod 700 /home/sami/.ssh

# Fetch and link global dotfiles and configs
ln -sf /home/sami/.files/rc/bashrc /home/sami/.bashrc
ln -sf /home/sami/.files/rc/bash_logout /home/sami/.bash_logout
ln -sf /home/sami/.files/rc/nanorc /home/sami/.nanorc
ln -sf /home/sami/.files/rc/profile /home/sami/.profile
ln -sf /home/sami/.files/rc/gitconfig /home/sami/.gitconfig
ln -sf /home/sami/.files/rc/gitconfig-work /home/sami/.gitconfig-work
ln -sf /home/sami/.files/rc/code /home/sami/.config/Code/User/settings.json

# Link the bare minimum dotfiles for the root user
sudo ln -sf /home/sami/.files/rc/bashrc /root/.bashrc
sudo ln -sf /home/sami/.files/rc/nanorc /root/.nanorc

# Fetch and link Gnome specific dotfiles and configs
ln -sf /home/sami/.files/pic/avatar.jpg /home/sami/.face
ln -sf /home/sami/.files/rc/hidden /home/sami/.hidden


###############################
# DO ADDITIONAL CONFIGURATION #
###############################

# Enable nightlight at night
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

# Set Nautilus settings
gsettings set org.gnome.nautilus.preferences default-folder-viewer "list-view"
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.nautilus.preferences sort-directories-first true
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gnome.nautilus.list-view default-visible-columns ['name', 'detailed_type', 'size', 'date_modified']

# Show Gnome bar settings
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Enable sound over-amplification
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true

# Add user to docker group
sudo usermod -aG docker sami


###############
# FINAL STEPS #
###############

# Clear apt cache
sudo apt -y autoclean
sudo apt -y autoremove

clear
echo ""
echo "  The script has finished running."
echo ""
