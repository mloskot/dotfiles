@echo off

if not exist boost-build.jam (
    @echo "Run inside Boost root"
    exit /b 1
)

call .\bootstrap.bat
.\b2 -j8 headers

rem .\b2 -j8 --with-test --with-filesystem variant=debug stage
rem .\b2 -j8 --with-test --with-filesystem variant=release stage
.\b2 -j8 variant=debug,release address-model=64 --layout=versioned --with-test --with-filesystem stage
