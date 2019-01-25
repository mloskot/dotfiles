# wsl-config

Configuration files for development environments on
Windows Subsystem for Linux (Ubuntu, Debian, etc.).

# Content

No fancy all-in-one installer script.

## Windows

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

  ```shell
  cmd <<< "%USERPROFILE%\.gitconfig %CD%\wsl\home\.gitconfig"
  cmd <<< "%USERPROFILE%\message.gitconfig %CD%\wsl\home\message.gitconfig"
  cmd <<< "mklink %USERPROFILE%\alias_basic.gitconfig %CD%\wsl\home\alias_basic.gitconfig"
  cmd <<< "mklink %USERPROFILE%\alias_ignore.gitconfig %CD%\wsl\home\alias_ignore.gitconfig"
  cmd <<< "mklink %USERPROFILE%\alias_log.gitconfig %CD%\wsl\home\alias_log.gitconfig"
  cmd <<< "mklink %USERPROFILE%\alias_tree.gitconfig %CD%\wsl\home\alias_tree.gitconfig"
  cmd <<< "mklink %USERPROFILE%\alias_misc.gitconfig %CD%\wsl\home\alias_misc.gitconfig"
  ```

- `git-prompt.sh` for preferred Bash prompt

  ```shell
  mklink %CD%\win\home\.config\git\git-prompt.sh %USERPROFILE%\.config\git\git-prompt.sh
  ```

  or

  ```shell
  del /S /Q "c:\Program Files\Git\etc\profile.d\git-prompt.sh"
  mklink "c:\Program Files\Git\etc\profile.d\git-prompt.sh" %CD%\win\git\etc\profile.d\git-prompt.sh
  ```

## WSL

- symlink files from `wsl/home` in `$HOME`
- run any of `scripts`
