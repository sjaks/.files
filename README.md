# My Linux dotfiles and install scripts
These work on my machine but might not work on yours without major modifications. Use them only as inspiration. Run the script `bin/install.sh` to installing these dotfiles for Fedora 35 with the Gnome DE.


## Installing packages and configuring the system

1. Install latest Fedora (full install) with LVM and LUKS.
2. Import SSH keys.
```
mkdir /home/sami/.ssh
cp /media/sami/key/sshkeyfile /home/sami/.ssh/id_ed25519
chown sami /home/sami/.ssh
chmod -R 700 /home/sami/.ssh
chmod 600 /home/sami/.ssh/id_ed25519
```
3. Install git: `sudo dnf install git`.
4. Clone this repo: `git clone git@github.com/sjaks/.files.git`.
5. Run `./bin/install.sh`.

## List of good Gnome extensions
[Audio Output Switcher](https://extensions.gnome.org/extension/751/audio-output-switcher/)  
[Blur my Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/)  
[Bluetooth Quick Connect](https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/)  
[Dock from Dash](https://extensions.gnome.org/extension/4703/dock-from-dash/)  
[Coverflow Alt-Tab](https://extensions.gnome.org/extension/97/coverflow-alt-tab/)

## Installing Nvidia drivers and fixing some configurations

1. Install the drivers `sudo dnf update && sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda` (needs RPM Fusion repos)
2. Blacklist nouveau drivers `echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf`
3. Append `rd.driver.blacklist=nouveau nvidia-drm.modeset=1` to `GRUB_CMDLINE_LINUX` in `/etc/default/grub` (Fixes GDM crashing)
4. Uncomment `WaylandEnable=false` in `/etc/gdm/custom.conf` (Wayland is very buggy on Nvidia still)
5. Change systemd target with `sudo systemctl set-default graphical.target` (if system boots to tty)
6. Remake Grub2 configs with `sudo grub2-mkconfig -o /etc/grub2-efi.cfg` and `sudo grub2-mkconfig -o /etc/grub2.cfg`
7. Do a `reboot`

## Fixing laptop battery drainage issues

Add `mem_sleep_default=deep` to `/etc/default/grub` and run `grub2-mkconfig -o /etc/grub2.cfg grub2-mkconfig -o /etc/grub2-efi.cfg`.
