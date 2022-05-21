@echo Delete current contents of thoughts
@echo off
cd ".\content\notes"
for /d %%i in ("*") do rmdir "%%i" /s/q
for /F "delims=" %%i in ('dir /b') do if not "%%i"=="notes.11tydata.js" del "%%i" /s/q
@echo Copy from thoughts repo excluding stuff in .noncontent within that repo
cd ".\..\..\"
xcopy ".\..\thoughts" ".\content\notes" /Y /E /Exclude:.\..\thoughts\.noncontent
@echo Delete old content
cd _site
for /d %%i in ("*") do rmdir "%%i" /s/q
for /F "delims=" %%i in ('dir /b') do del "%%i" /s/q
cd ..
call npm run compile
cd ".\..\static-site-content"
for /d %%i in ("*") do rmdir "%%i" /s/q
for /F "delims=" %%i in ('dir /b') do if not "%%i"=="LICENSE.md" del "%%i" /s/q
xcopy ".\..\personal-site\_site" . /Y /E
