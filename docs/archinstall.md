First things first, disable Secure Boot and boot onto an Arch install medium.
On a laptop, enable WiFi with `iwctl` and connect to a network `station wlan0 connect <SSID>`.

Now, run `archinstall` and use the following settings.

- Archinstall language: `English`
- Keyboard layout: `fi`
- Mirror region: `Finland`
- Locale language: `en_US`
- Locale encoding: `utf-8`
- Drive(s)
  - Select *main drive*
  - Select *wipe all*
- Disk encryption
  - Encryption password: `*****`
  - Partitions: `primary`
- Bootloader: `systemd-boot`
- Swap: `True`
- Hostname: `hostname`
- Root password: `*****`
- User account
  - Set some *username* and *password*
  - Enable `sudo`
- Profile
  - desktop: `gnome`
  - Drivers: `nvidia`
- Audio: `pipewire`
- Kernel: `linux`
- Additional packages: `git`
- Network configuration: `NetworkManager`
- Timezone: `Europe/Helsinki`
- Automatic time sync: `True`
- Optional repositories: `multilib`

Then proceed to install Arch. When the computer reboots, clone this repository and run the install script.
