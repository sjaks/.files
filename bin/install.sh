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
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y upgrade

# Install additional Gnome packages with apt
sudo dnf -y install \
htop \
git \
gcc \
ufw \
vim \
unzip \
unar \
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
papirus-icon-theme \
neofetch \
python3 \
python3-pip \
python-flake8 \
fedmod \
flatpak-module-tools \
docker-ce \
docker-ce-cli \
containerd.io \
docker-compose \
gnome-tweak-tool \
gnome-sound-recorder \
pavucontrol \
rhythmbox

# Install flatpak repos
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org

# Install GUI apps asx flatpaks
flatpak install -y flathub org.gimp.GIMP
flatpak install -y flathub org.inkscape.Inkscape
flatpak install -y flathub org.telegram.desktop
flatpak install -y flathub com.obsproject.Studio
flatpak install -y flathub com.visualstudio.code
flatpak install -y flathub com.getpostman.Postman
flatpak install -y flathub com.valvesoftware.Steam
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub com.google.Chrome

# Remove unnecessary preinstalled things
sudo dnf -y remove \
firefox \
cheese \
gedit \
gnome-weather \
gnome-clocks \
gnome-contacts \
gnome-connections \
gnome-maps \
gnome-characters \
gnome-font-viewer \
gnome-tour \
gnome-photos \
libreoffice-*

# Install vscode extensions
code --install-extension piousdeer.adwaita-theme
code --install-extension ms-python.python
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension ecmel.vscode-html-css
code --install-extension esbenp.prettier-vscode
code --install-extension github.copilot
code --install-extension ms-azuretools.vscode-docker
code --install-extension visualstudioexptteam.vscodeintellicode
code --install-extension bradlc.vscode-tailwindcss
code --install-extension PKief.material-icon-theme
code --install-extension shardulm94.trailing-spaces


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
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/gnome/drool-l.svg'

# Set themes
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

# Edit Gnome terminal profile
profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1}
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-columns 125
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" default-size-rows 36
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" scrollbar-policy "never"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cursor-shape "underline"

# Change dock favourites
gsettings set org.gnome.shell favorite-apps "['com.google.Chrome.desktop', 'org.gnome.Terminal.desktop', 'com.visualstudio.code.desktop', 'org.gnome.Nautilus.desktop', 'org.telegram.desktop.desktop']"

# Reorder apps
gsettings reset org.gnome.shell app-picker-layout
gsettings set org.gnome.desktop.app-folders folder-children ['']


################################
# CONFIGURE KEYBOARD SHORTCUTS #
################################

# Set a keyboard hotkey for closing a window
gsettings set org.gnome.desktop.wm.keybindings close "['<Super><Shift>q']"

# Configure custom hotkeys
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/','/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command '/usr/bin/gnome-terminal'
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


###################################
# CONFIGURE DIRECTORIES AND FILES #
###################################

# Remove unused home directories
rm -rf /home/sami/Templates
rm -rf /home/sami/Public
rm -rf /home/sami/.mozilla

# Setup directories
mkdir -p /home/sami/.var/app/com.visualstudio.code/config/Code/User/
mkdir /home/sami/.ssh
chown sami /home/sami/.ssh
chmod 700 /home/sami/.ssh

# Fetch and link global dotfiles and configs
ln -sf /home/sami/.files/rc/bashrc /home/sami/.bashrc
ln -sf /home/sami/.files/rc/nanorc /home/sami/.nanorc
ln -sf /home/sami/.files/rc/gitconfig /home/sami/.gitconfig
ln -sf /home/sami/.files/rc/code /home/sami/.var/app/com.visualstudio.code/config/Code/User/settings.json

# Link the bare minimum dotfiles for the root user
sudo ln -sf /home/sami/.files/rc/bashrc /root/.bashrc
sudo ln -sf /home/sami/.files/rc/nanorc /root/.nanorc

# Fetch and link Gnome specific dotfiles and configs
sudo ln -sf /home/sami/.files/pic/avatar.jpg /var/lib/AccountsService/icons/sami
ln -sf /home/sami/.files/rc/hidden /home/sami/.hidden


###############################
# DO ADDITIONAL CONFIGURATION #
###############################

# Set Nautilus settings
gsettings set org.gnome.nautilus.preferences default-folder-viewer "list-view"
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.nautilus.preferences sort-directories-first true
gsettings set org.gnome.nautilus.list-view default-visible-columns ['name', 'detailed_type', 'size', 'date_modified']

# Disable lock screen notifications that turn on the screen
gsettings set org.gnome.desktop.notifications show-in-lock-screen false

# Show Gnome bar settings
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Enable sound over-amplification
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true

# Set timezone
sudo timedatectl set-timezone Europe/Helsinki

# Add user to docker group
sudo groupadd docker
sudo gpasswd -a sami docker
sudo usermod -aG docker sami
sudo systemctl restart docker


###############
# FINAL STEPS #
###############

# Clear unnecessary dependencies
sudo dnf -y autoremove

clear
echo ""
echo "  The script has finished running."
echo ""
