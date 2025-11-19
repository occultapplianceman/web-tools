@echo off
setlocal EnableDelayedExpansion

echo.
echo ############################################################
echo #        YouTube to MP3 Converter - FFmpeg Path Setup       #
echo ############################################################
echo.
echo This script will:
echo   1. Locate your FFmpeg installation (from your screenshot)
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

REM Set the exact FFmpeg bin path from your screenshot
set "FFMPEG_BIN_PATH=C:\path\to\ffmpeg-2025-11-17-git-e94439e49b-essentials_build\bin"

REM Verify ffmpeg.exe exists at that location
if not exist "%FFMPEG_BIN_PATH%\ffmpeg.exe" (
    echo ERROR: FFmpeg not found at expected location:
    echo   %FFMPEG_BIN_PATH%
    echo.
    echo Please edit this script and update the FFMPEG_BIN_PATH variable
    echo to point to your actual FFmpeg bin folder.
    echo.
    pause
    exit /b 1
)

REM Add FFmpeg to system PATH
echo Adding FFmpeg to system PATH...
setx PATH "%PATH%;%FFMPEG_BIN_PATH%" /M >nul 2>&1
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