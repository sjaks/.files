First things first, disable Secure Boot and boot onto an Arch install medium.
On a laptop, enable WiFi with `iwctl` and connect to a network `station wlan0 connect <SSID>`.

Now, run `archinstall` and use the following settings.

| **Option** | **Value** |
| --- | --- |
| **Archinstall language** | English |
| **Keyboard layout** | fi |
| **Mirror region** | Finland |
| **Locale language** | en_US |
| **Locale encoding** | utf-8 |
| **Drive(s)** |  |
| Drive | main drive |
| Wipe  | wipe all |
| **Disk encryption** |  |
| Encryption password | ********** |
| Partitions | primary |
| **Bootloader** | systemd-boot |
| **Swap** | true |
| **Hostname** | hostname |
| **Root password** | ********** |
| **User account** |  |
| Username | myusername |
| Password | ********** |
| Sudo     | true |
| **Profile** |  |
| Desktop | gnome |
| Drivers | nvidia |
| **Audio** | pipewire |
| **Kernel** | linux |
| **Additional packages** | git |
| **Network configuration** | NetworkManager |
| **Timezone** | Europe/Helsinki |
| **Automatic time sync** | true |
| **Optional repositories** | multilib |

Then proceed to install Arch. When the computer reboots, clone this repository and run the install script.
