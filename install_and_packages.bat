@echo off
setlocal EnableDelayedExpansion

echo.
echo ############################################################
echo #        YouTube to MP3 Converter - FFmpeg Setup           #
echo ############################################################
echo.
echo This script will:
echo   1. Locate FFmpeg installation on this machine
echo   2. Configure the PATH for yt2mp3.exe to use it
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

REM Check if FFmpeg is already in system PATH
where ffmpeg >nul 2>&1
if %errorlevel% == 0 (
    echo FFmpeg is already accessible system-wide.
    echo No additional setup needed.
    echo.
    echo yt2mp3.exe should work correctly.
    echo.
    pause
    exit /b 0
)

REM Try to find FFmpeg installation
echo Searching for FFmpeg installation...
set "FFMPEG_PATH="

REM Common installation locations
for %%d in (
    "C:\ffmpeg",
    "C:\Program Files\ffmpeg",
    "C:\Program Files (x86)\ffmpeg",
    "C:\FFmpeg",
    "D:\ffmpeg",
    "C:\Program Files\Git\usr\bin",
    "C:\Program Files\VideoLAN\VLC"
) do (
    if exist "%%d\bin\ffmpeg.exe" (
        set "FFMPEG_PATH=%%d\bin"
        goto :found_ffmpeg
    )
    if exist "%%d\ffmpeg.exe" (
        set "FFMPEG_PATH=%%d"
        goto :found_ffmpeg
    )
)

echo.
echo ERROR: FFmpeg installation not found automatically.
echo Please locate your FFmpeg installation folder (where ffmpeg.exe is located)
echo and ensure it's added to your system PATH.
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