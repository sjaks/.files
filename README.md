# My Linux dotfiles and install scripts
These work on my machine but might not work on yours without major modifications. Use them only as inspiration. Run the script `bin/install.sh` to installing these dotfiles for Ubuntu 20.04 with Gnome DE.

## Ubuntu with Gnome DE

### Installing packages and configuring the system

1. Install latest Ubuntu (full install) with LVM and LUKS.
2. Import SSH keys.
```
mkdir /home/sami/.ssh
cp /media/sami/key/sshkeyfile /home/sami/.ssh/id_ed25519
chown sami /home/sami/.ssh
chmod -R 700 /home/sami/.ssh
chmod 600 /home/sami/.ssh/id_ed25519
```
3. Install git: `sudo apt install git`.
4. Clone this repo: `git clone git@github.com/sjaks/.files.git`.
5. Run `./bin/install.sh`.
