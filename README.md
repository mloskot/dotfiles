# wsl-config

Configuration files for development environments on
Windows Subsystem for Linux (Ubuntu, Debian, etc.).

# Content

No fancy all-in-one installer script.

## Windows

- `ConEmu.xml` with custom tasks to [Cmder](http://cmder.net/) config directory
  ```shell
  mklink C:\apps\cmder_mini\vendor\conemu-maximus5\ConEmu.xml D:\wsl-config\cmder_mini\vendor\conemu-maximus5\ConEmu.xml
  ```

- `clink.lua` with [slow git status workaround](https://github.com/cmderdev/cmder/issues/447#issuecomment-379992066) to Cmder vendor directory
  ```shell
  mklink C:\apps\cmder_mini\vendor\clink.lua D:\wsl-config\cmder_mini\vendor\clink.lua
  ```

## WSL

- symlink files from `home/mloskot` in WSL `/home/mloskot`
- run any of `scripts`
