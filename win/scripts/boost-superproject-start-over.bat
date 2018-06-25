REM Boost development utility
REM https://github.com/boostorg/gil/blob/develop/CONTRIBUTING.md
REM If something goes wrong, you end up with incomplete or accidentally
REM modified files in your clone of the Boost super-project repository,
REM or you simply wish to start fresh, then you can clean and
REM reset the whole repository and its modules:
git clean -xfd
git submodule foreach --recursive git clean -xfd
git reset --hard
git submodule foreach --recursive git reset --hard
git submodule update --init --recursive --jobs 8
