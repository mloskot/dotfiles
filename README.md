# wsl-config

Configuration files for development environments on
Windows Subsystem for Linux (Ubuntu, Debian, etc.).

# Content

No fancy all-in-one installer script.

## Git

```console
cd git
install.bat
```

## Windows

- Install `DejaVuSansMono Nerd Font` from https://www.nerdfonts.com

- `ConEmu.xml` with custom tasks to [Cmder](http://cmder.net/) config directory

  ```shell
  mv C:\apps\cmder_mini\vendor\conemu-maximus5\ConEmu.xml C:\apps\cmder_mini\vendor\conemu-maximus5\ConEmu.xml.original
  mklink C:\apps\cmder_mini\vendor\conemu-maximus5\ConEmu.xml %CD%\win\cmder_mini\vendor\conemu-maximus5\ConEmu.xml
  ```

- `clink.lua` with [slow git status workaround](https://github.com/cmderdev/cmder/issues/447#issuecomment-379992066) to Cmder vendor directory
  ```shell
  mv C:\apps\cmder_mini\vendor\clink.lua C:\apps\cmder_mini\vendor\clink.lua.original
  mklink C:\apps\cmder_mini\vendor\clink.lua %CD%\win\cmder_mini\vendor\clink.lua
  ```

- `clink-completions\git_prompt.lua`

  ```shell
  mklink C:\apps\cmder_mini\vendor\clink-completions\git_prompt.lua %CD%\win\cmder_mini\vendor\clink-completions\git_prompt.lua
  ```
- `code.cmd` for [Code Insiders](https://code.visualstudio.com/insiders/)

  ```shell
  mklink "C:\Program Files\Microsoft VS Code Insiders\bin\code.cmd" %CD%\win\vscode\code.cmd
  ```

- `.gitconfig` works for both

- `git-prompt.sh` for preferred Bash prompt

  ```shell
  mklink %USERPROFILE%\.config\git\git-prompt.sh %CD%\win\home\.config\git\git-prompt.sh
  ```

  or

  ```shell
  del /S /Q "c:\Program Files\Git\etc\profile.d\git-prompt.sh"
  mklink "c:\Program Files\Git\etc\profile.d\git-prompt.sh" %CD%\win\git\etc\profile.d\git-prompt.sh
  ```

## WSL

```console
sudo -i bash -c 'echo "mloskot ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers'
```

```console
sudo sed -i '/bell-style none/s/^# //g' /etc/inputrc
```

### Bash

```console
cp ~/.bashrc ~/.bashrc.orig
```

```console
sed -i 's/\@\\h/\@bionic/g' ~/.bashrc
sed -i 's/\\w\\/\\W\\/g' ~/.bashrc
```

### Cron

Optionally, to enable OfflineIMAP as cron job:

```console
echo 'sudo -i service cron start' >> ~/.bashrc
```

### Vim

```console
ln -s /mnt/d/wsl-config/vim/.vimrc ~/.vimrc
```

### Mail

* https://wiki.archlinux.org/index.php/Mutt#Passwords_management

```console
mkdir ~/.mail
chmod 0700 ~/.mail
```

#### OfflineIMAP

```console
sudo apt -y -q install python-pip
sudo pip install --system offlineimap
```

```console
ln -s /mnt/d/wsl-config/mail/.offlineimaprc ~/.offlineimaprc
ln -s /mnt/d/wsl-config/mail/offlineimap_secret.py ~/.mail/offlineimap_secret.py
```

```console
echo "<<CLIENT_ID>>" | gpg -e -r "mateusz@loskot.net" -o ~/.mail/oauth2_client_id.gpg
echo "<<CLIENT_SECRET>>" | gpg -e -r "mateusz@loskot.net" -o ~/.mail/oauth2_client_secret.gpg
echo "<<REFRESH_TOKEN>>" | gpg -e -r "mateusz@loskot.net" -o ~/.mail/oauth2_refresh_token.gpg
```

```console
# workstation
ln -s /mnt/d/wsl-config/mail/mailrun.sh ~/bin/
# laptop
ln -s /mnt/d/wsl-config/mail/mailsync.sh ~/bin/
```

Optionally, to run OfflineIMAP, if the customMutt shortcuts,
`CTRL+a` and `CTRL+i` are not enough:

```console
$ crontab -e
*/5 * * * * /home/mloskot/bin/mailrun.sh
```

### Mutt

```console
sudo apt -y -q install neomutt
```

```console
which mutt || which neomutt && sudo ln -s `which neomutt` /usr/local/bin/mutt
```

```console
echo -e 'set smtp_url="<<URL>"\nset smtp_pass="<<PASSWORD>"' | gpg -e -r "mateusz@loskot.net" -o ~/.mail/smtp_token.gpg
```

```console
ln -s /mnt/d/wsl-config/mail/.muttrc ~/.muttrc
ln -s /mnt/d/wsl-config/mail/signature ~/.mail/signature
ln -s /mnt/d/wsl-config/mail/vombatidae.mutt ~/.mail/vombatidae.mutt
```
