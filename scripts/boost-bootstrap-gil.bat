@echo off

if not exist boost-build.jam (
    @echo "Run inside Boost root"
    exit /b 1
)

call .\bootstrap.bat
.\b2 headers

rem .\b2 toolset=msvc-14.1 variant=debug,release address-model=64 --layout=versioned --with-filesystem stage
.\b2 toolset=msvc-14.2 variant=debug,release address-model=64 --layout=versioned --with-filesystem stage

rmdir /s /q .\bin.v2
