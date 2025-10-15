# dotfiles

This is Okontu (Okonomi Ubuntu) with opinionated collection of dotfiles
and installers for Ubuntu Linux.
Inspired by [Omakub](https://omakub.org) project.

## Using

```bash
gh repo clone mloskot/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

Successfully tested on fresh installations of Ubuntu 25.04 and 25.10.

Successfully tested on upgraded installation from from 25.04 to 25.10 with `sudo do-release-upgrade -d`.

> [!WARNING]
> The upgrade to Ubuntu 25.10 removes Firefox installed from `.deb` package
> and replaces it with Firefox installed with `snap`.
> If you, like me, prefer the `.deb`-s, then after post-upgrade reboot don't run
> Firefox but go to the App Center and uninstall Firefox there.
> Finally, run `./install/desktop/app-firefox.sh` to install Firefox from `.deb`.

Enjoy!

## Contributing

```bash
pipx install pre-commit
pre-commit install
```
