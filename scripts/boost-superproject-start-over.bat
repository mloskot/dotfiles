@echo off
REM Boost development utility
REM https://github.com/boostorg/gil/blob/develop/CONTRIBUTING.md
REM If something goes wrong, you end up with incomplete or accidentally
REM modified files in your clone of the Boost super-project repository,
REM or you simply wish to start fresh, then you can clean and
REM reset the whole repository and its modules:
setlocal
set BRANCH="master"
if NOT "%~1"=="" set BRANCH="%1"
REM git rev-parse --verify --quiet %BRANCH% > nul 2>&1
git show-branch remotes/origin/%BRANCH% > nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    @echo Boost super-project branch %BRANCH% not found, aborting.
    goto :EOF
)

git clean -xffd
git submodule foreach --recursive git clean -xffd

git reset --hard
git submodule foreach --recursive git reset --hard

git checkout %BRANCH%
git pull
git submodule update --init --recursive --jobs 8

git branch
