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
code \
htop \
gcc \
ufw \
vim \
unzip \
unrar \
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
easyeffects \
inkscape \
gimp \
obs-studio \
discord \
telegram-desktop \
steam

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install google chrome
yay -S google-chrome

# Install apps only available on flathub
flatpak install -y flathub io.bassi.Amberol
flatpak install -y flathub com.spotify.Client

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
gnome-music

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

# Change dock favourites
gsettings set org.gnome.shell favorite-apps "[]"

# Reorder apps
gsettings set org.gnome.shell app-picker-layout "[{'google-chrome.desktop': <{'position': <0>}>, 'org.gnome.Console.desktop': <{'position': <1>}>, 'org.gnome.Nautilus.desktop': <{'position': <2>}>, 'code-oss.desktop': <{'position': <3>}>, 'org.telegram.desktop.desktop': <{'position': <4>}>, 'discord.desktop': <{'position': <5>}>, 'htop.desktop': <{'position': <6>}>, 'mpv.desktop': <{'position': <7>}>, 'com.github.wwmm.easyeffects.desktop': <{'position': <8>}>, 'pavucontrol.desktop': <{'position': <9>}>, 'org.inkscape.Inkscape.desktop': <{'position': <10>}>, 'gimp.desktop': <{'position': <11>}>, 'Utilities': <{'position': <12>}>, 'com.obsproject.Studio.desktop': <{'position': <13>}>, 'gnome-system-monitor.desktop': <{'position': <14>}>, 'org.gnome.Extensions.desktop': <{'position': <15>}>, 'org.gnome.TextEditor.desktop': <{'position': <16>}>, 'steam.desktop': <{'position': <17>}>, 'org.gnome.SoundRecorder.desktop': <{'position': <18>}>, 'simple-scan.desktop': <{'position': <19>}>, 'org.gnome.Software.desktop': <{'position': <20>}>, 'vim.desktop': <{'position': <21>}>, 'org.gnome.Settings.desktop': <{'position': <22>}>, 'yelp.desktop': <{'position': <23>}>}, {'org.gnome.Epiphany.desktop': <{'position': <0>}>, 'chrome-kajebgjangihfbkjfejcanhanjmmbcfd-Default.desktop': <{'position': <1>}>, 'lstopo.desktop': <{'position': <2>}>, 'electron22.desktop': <{'position': <3>}>, 'ardour7.desktop': <{'position': <4>}>, 'qvidcap.desktop': <{'position': <5>}>, 'qv4l2.desktop': <{'position': <6>}>, 'f8380a75-537c-4ed5-a48e-814f8215de9f': <{'position': <7>}>}]"

# Show window buttons
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"


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
ln -sf /home/sami/.files/rc/code /home/sami/.config/Code\ -\ OSS/User/settings.json
sudo ln -sf /home/sami/.files/rc/pacman /etc/pacman.conf

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
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'detailed_type', 'size', 'date_modified']"

# Disable lock screen notifications that turn on the screen
gsettings set org.gnome.desktop.notifications show-in-lock-screen false

# Show Gnome bar settings
gsettings set org.gnome.desktop.calendar show-weekdate true
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


###############
# FINAL STEPS #
###############

clear
echo ""
echo "  The script has finished running."
echo ""
