# My Linux dotfiles and install scripts
These work on my machine but might not work on yours without major modifications. Use them only as inspiration.

There's a script under `bin/` for installing these dotfiles for Ubuntu with Gnome DE (20.04).

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

### Additional theming

#### Colors for Slack
Use this theme string for Slack:
`#2F343F,#2C3849,#5294E2,#FFFFFF,#494D58,#FFFFFF,#94E864,#78AF8F,#2F343F,#FFFFFF`
