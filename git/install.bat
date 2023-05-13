@echo off

for /f tokens^=* %%i in ('where .:.gitconfig*') do (
    if exist %USERPROFILE%\%%~nxi (
        @echo Deleting %USERPROFILE%\%%~nxi
        del %USERPROFILE%\%%~nxi
    )
    mklink %USERPROFILE%\%%~nxi %CD%\%%~nxi
)