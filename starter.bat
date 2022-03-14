start D:\paperServer1_16_4\init.bat
start TaskMgr.exe

echo Backing-up to F and C:

set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)

set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%

set SUBFILENAME=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%
mkdir F:\paperBackups\paperServer1_16_4_%SUBFILENAME%

xcopy /B /s D:\backups F:\paperBackups\paperServer1_16_4_%SUBFILENAME%

pause

for /d /r "D:\backups" %%i in (*) do if exist "C:\Users\wowar\Desktop\old-bkups\%%~ni" (dir "%%i" | find "0 File(s)" > NUL & if errorlevel 1 move /y "%%i\*.*" "C:\Users\wowar\Desktop\old-bkups\%%~ni") else (move /y "%%i" "C:\Users\wowar\Desktop\old-bkups")
move /y D:\backups\*.* C:\Users\wowar\Desktop\old-bkups


pause
