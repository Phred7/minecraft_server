@echo off

:loop

java -server -Xmx5G -Xms1024M -jar paper1_16_4.jar nogui

echo Backing-up

set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)

set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%

set SUBFILENAME=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%
mkdir D:\backups\paperServer1_16_4_%SUBFILENAME%

xcopy /s D:\paperServer1_16_4 D:\backups\paperServer1_16_4_%SUBFILENAME%\

echo Press control+C to exit the server

timeout 10

echo (%time%) Restarting

goto loop