@echo off
setlocal EnableDelayedExpansion

echo.
echo ############################################################
echo #        YouTube to MP3 Converter - FFmpeg Auto-Setup       #
echo ############################################################
echo.
echo This script will:
echo   1. Search for your FFmpeg installation automatically
echo   2. Add it to system PATH so yt2mp3.exe can use it
echo.
echo Please run this script as Administrator.
echo.

REM Check if running as Administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: This script must be run as Administrator!
    echo Right-click the file and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

REM Get script directory
set "SCRIPT_DIR=%~dp0"

REM Check if yt2mp3.exe exists
if not exist "%SCRIPT_DIR%yt2mp3.exe" (
    echo ERROR: yt2mp3.exe not found in the current directory!
    echo Please place this setup script in the same folder as your executable.
    echo.
    pause
    exit /b 1
)

REM Search for FFmpeg folder pattern
echo Searching for FFmpeg installation...
set "FFMPEG_PATH="

REM Search in common locations for the git-essentials pattern
for /f "tokens=*" %%i in ('dir /ad /b "C:\ffmpeg*" 2^>nul') do (
    if exist "C:\%%i\bin\ffmpeg.exe" (
        set "FFMPEG_PATH=C:\%%i\bin"
        goto :found_ffmpeg
    )
)

REM Search in Program Files
for /f "tokens=*" %%i in ('dir /ad /b "C:\Program Files\ffmpeg*" 2^>nul') do (
    if exist "C:\Program Files\%%i\bin\ffmpeg.exe" (
        set "FFMPEG_PATH=C:\Program Files\%%i\bin"
        goto :found_ffmpeg
    )
)

REM Search in Program Files (x86)
for /f "tokens=*" %%i in ('dir /ad /b "C:\Program Files (x86)\ffmpeg*" 2^>nul') do (
    if exist "C:\Program Files (x86)\%%i\bin\ffmpeg.exe" (
        set "FFMPEG_PATH=C:\Program Files (x86)\%%i\bin"
        goto :found_ffmpeg
    )
)

REM Search in user's Desktop, Downloads, Documents
for /f "tokens=*" %%i in ('dir /ad /b "%USERPROFILE%\Desktop\ffmpeg*" 2^>nul') do (
    if exist "%USERPROFILE%\Desktop\%%i\bin\ffmpeg.exe" (
        set "FFMPEG_PATH=%USERPROFILE%\Desktop\%%i\bin"
        goto :found_ffmpeg
    )
)

for /f "tokens=*" %%i in ('dir /ad /b "%USERPROFILE%\Downloads\ffmpeg*" 2^>nul') do (
    if exist "%USERPROFILE%\Downloads\%%i\bin\ffmpeg.exe" (
        set "FFMPEG_PATH=%USERPROFILE%\Downloads\%%i\bin"
        goto :found_ffmpeg
    )
)

for /f "tokens=*" %%i in ('dir /ad /b "%USERPROFILE%\Documents\ffmpeg*" 2^>nul') do (
    if exist "%USERPROFILE%\Documents\%%i\bin\ffmpeg.exe" (
        set "FFMPEG_PATH=%USERPROFILE%\Documents\%%i\bin"
        goto :found_ffmpeg
    )
)

echo.
echo ERROR: FFmpeg installation not found automatically.
echo Please ensure you have FFmpeg installed with a name like:
echo   ffmpeg-YYYY-MM-DD-git-XXXXXXXX-essentials_build
echo.
pause
exit /b 1

:found_ffmpeg
echo Found FFmpeg at: !FFMPEG_PATH!

REM Add FFmpeg to system PATH
echo Adding FFmpeg to system PATH...
setx PATH "%PATH%;!FFMPEG_PATH!" /M >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Failed to add FFmpeg to system PATH
    pause
    exit /b 1
)

echo FFmpeg added to system PATH successfully!
echo.
echo yt2mp3.exe should now be able to use FFmpeg.
echo.
pause
exit /b 0