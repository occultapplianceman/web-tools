🎵 YouTube to MP3 Converter — Standalone Windows Executable
No installation. No Python. No dependencies. Just download and run. 

This is a standalone Windows executable (yt2mp3.exe) that converts YouTube videos to MP3 audio files using yt-dlp and ffmpeg.
It is fully self-contained — no need to install Python, pip, or any libraries.

⚠️ Important: You Need a .7z Extractor
The included ffmpeg-2025-11-17-git-e94439e49b-essentials_build.7z file requires a program that can open .7z archives.

✅ Recommended Tools (Free & Safe):
7-Zip
(Open Source)
👉
https://www.7-zip.org/
WinRAR
(Trial / Paid)
👉
https://www.win-rar.com/

💡 Tip: After installing 7-Zip, right-click the .7z file → “7-Zip → Extract Here” → then copy ffmpeg.exe and ffprobe.exe from the bin folder. 

✅ How to Use
Download this entire repo as a ZIP from the Releases page.
Extract the ZIP using 7-Zip or WinRAR.
Install 7-Zip or WinRAR if you don’t already have it (see above).
Extract the included ffmpeg-2025-11-17-git-e94439e49b-essentials_build.7z file:
Right-click → “7-Zip → Extract Here”
Go into the bin folder
Copy ffmpeg.exe and ffprobe.exe
Add FFmpeg to your system PATH:
Create a folder like C:\ffmpeg\bin
Paste the two .exe files there
Run setup_ffmpeg_path.bat (included) as Administrator — it will auto-add this path.
Double-click yt2mp3.exe and start converting!
⚙️ Optional: Auto-Setup Script
Included in this repo:
👉 setup_ffmpeg_path.bat

Run this as Administrator to automatically detect your FFmpeg folder and add it to your system PATH.
Works best if you’ve extracted FFmpeg to your Downloads folder (as shown in the screenshot).
📜 Licenses
🔸 FFmpeg
This tool uses FFmpeg, licensed under the GNU Lesser General Public License v2.1 (LGPL-2.1).
You are free to use, modify, and distribute FFmpeg under its terms.

Full license text: https://ffmpeg.org/legal.html
Source code: https://github.com/FFmpeg/FFmpeg 

You must:

Include this license notice if you redistribute FFmpeg.
Provide attribution: “This software uses FFmpeg licensed under LGPL v2.1.”
🔸 This Project — by Occult
This project — including the yt2mp3.exe executable, batch files, and source code — is released under the MIT License.

You are free to:

✅ Use it for any purpose (personal, commercial, educational)
✅ Modify, adapt, or improve it
✅ Redistribute it, even as part of your own software
The only requirement is that you include the original copyright notice. 
