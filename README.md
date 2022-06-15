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

## Installing Nvidia drivers and fixing some configurations

1. Install the drivers `sudo dnf update && sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda` (needs RPM Fusion repos)
2. Blacklist nouveau drivers `echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf`
3. Append `rd.driver.blacklist=nouveau nvidia-drm.modeset=1` to `GRUB_CMDLINE_LINUX` in `/etc/default/grub` (Fixes GDM crashing)
4. Uncomment `WaylandEnable=false` in `/etc/gdm/custom.conf` (Wayland is very buggy on Nvidia still)
5. Change systemd target with `sudo systemctl set-default graphical.target` (if system boots to tty)
6. Remake Grub2 configs with `sudo grub2-mkconfig -o /etc/grub2-efi.cfg` and `sudo grub2-mkconfig -o /etc/grub2.cfg`
7. Do a `reboot`

## List of good Gnome extensions
[Audio Output Switcher](https://extensions.gnome.org/extension/751/audio-output-switcher/)  
[Blur my Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/)  
[Bluetooth Quick Connect](https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/)
[Night Theme Switcher](https://extensions.gnome.org/extension/2236/night-theme-switcher/)
[Tactile](https://extensions.gnome.org/extension/4548/tactile/)
[Coverflow Alt-Tab](https://extensions.gnome.org/extension/97/coverflow-alt-tab/)

## Cleanup
The `~/.bashrc` file defines the alias `daily` that runs some essential Linux maintenance commands. However, at times the following system cleanup could/should be done.

**Clean Docker**
Warning: this removes everything, excluding components that are being used.
```
$ docker system prune -a
```

**Clean SSH**
Notice: this will cause SSH to warn about unknown servers.
```
rm ~/.ssh/known_hosts
```

**Clean Bash**
After this you'll need to remember your commands and `Ctrl+R` won't help...
```
cat /dev/null > ~/.bash_history && history -c && exit
```
