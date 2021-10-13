@echo Delete current contents of thoughts
@echo off
cd ".\content\notes"
for /d %%i in ("*") do rmdir "%%i" /s/q
for /F "delims=" %%i in ('dir /b') do if not "%%i"=="notes.11tydata.js" del "%%i" /s/q
@echo Copy from thoughts repo excluding stuff in .noncontent within that repo
cd ".\..\..\"
@echo on
xcopy ".\..\thoughts" ".\content\notes" /Y /E /Exclude:.\..\thoughts\.noncontent
