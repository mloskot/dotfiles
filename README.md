# wsl-config

Configuration files for development environments on
Windows Subsystem for Linux (Ubuntu, Debian, etc.).

# Content

No fancy all-in-one installer script.

## Windows

- `ConEmu.xml` with custom tasks to [Cmder](http://cmder.net/) config directory
  ```shell
  mv C:\apps\cmder_mini\vendor\conemu-maximus5\ConEmu.xml C:\apps\cmder_mini\vendor\conemu-maximus5\ConEmu.xml.original
  mklink C:\apps\cmder_mini\vendor\conemu-maximus5\ConEmu.xml D:\wsl-config\cmder_mini\vendor\conemu-maximus5\ConEmu.xml
  ```

- `clink.lua` with [slow git status workaround](https://github.com/cmderdev/cmder/issues/447#issuecomment-379992066) to Cmder vendor directory
  ```shell
  mv C:\apps\cmder_mini\vendor\clink.lua C:\apps\cmder_mini\vendor\clink.lua.original
  mklink C:\apps\cmder_mini\vendor\clink.lua D:\wsl-config\cmder_mini\vendor\clink.lua
  ```

## WSL

- symlink files from `home` in WSL `$HOME`
- run any of `scripts`
