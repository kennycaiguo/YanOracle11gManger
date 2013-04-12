@echo off
setlocal enabledelayedexpansion


title 颜海镜Oracle 11g Manger2.0beta版

:main
rem 错误提示变量初始化
set varError=
mode con cols=50 lines=18

color 4a
echo        ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆ 
echo        ☆     颜海镜Oracle 11g Manger    ☆
echo        ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
echo.
echo     颜海镜是一种理念
echo.
echo     我们每天都在努力，只为更好为您服务
echo  ----------------------------------------------  
echo   开启Oracle服务 打开sqlplus一键式服务...
echo.   
echo   确认请按【回车】，否则请直接关闭此窗口...
echo  ------------------------------------------------
pause>nul
cls
echo.&echo.&echo.
echo		1打开服务 
echo.
echo		2关闭服务 
echo.
echo		直接按回车连接到sqlplus
echo.
set /p choice=	请输入功能号: 
if "%choice%"=="" call :change&goto :sqlplus
if %choice%==1 goto :opSer
if %choice%==2 goto :clsSer 
goto :eof


:clsSer
call :change

net stop OracleDBConsole%TS%

net stop OracleService%name%

net stop OracleOraDb11g_home1TNSListener

mode con cols=50 lines=12
color 2f
echo       ╬╬╬╬╬╬╬╬╬╬╬╬╬
echo       ╬        颜海镜        ╬
echo       ╬     QQ:776771343     ╬
echo       ╬╬╬╬╬╬╬╬╬╬╬╬╬
echo.
echo   停止Oracle 11g服务完成，请确认有没有错误发生。
echo.
echo   衷心感谢您的使用  按任意键退出程序...
echo  ----------------------------------------
echo                           颜海镜
echo     时间：%time:~0,5%
pause>nul
goto :eof

:opSer 
call :change
net start OracleOraDb11g_home1TNSListener
if errorlevel 1 set varError=未能启动OracleOraDb11g_home1TNSListener服务&goto :sorry

net start OracleService%name%
if errorlevel 1 set varError=未能启动OracleService%name%服务&goto :sorry

net start OracleDBConsole%TS%

mode con cols=50 lines=12
color 2f
cls
echo.&echo.&echo.&echo.
echo	启动Oracle 11g服务完成，下面将连接数据库。
goto :sqlplus
goto :eof

rem ===错误提示===
:sorry
color f5
cls
echo.&echo.&echo.&echo.
echo      ！！！失败 ！！！     
echo.
echo      很遗憾-_-。sorry！ 未能帮您解决问题
echo.
echo      错误：%varError%
echo.
echo      请放心，我们的工程师已经着手解决此问题
echo.
echo  --------------------------------------------
echo.
echo          若要退出请直接关闭此窗口...
echo.
echo                              颜海镜
echo      时间：%time:~0,5%
pause>nul
goto :eof

rem ===打开sqlpus===
:sqlplus
cls
echo.
set /p userName=<user\user.yan
set /P userName=    默认帐号%userName%：
echo %userName%>user\user.yan
echo.
set /p password=<user\password.yan
set /P password=    默认帐号密码%password%：
echo %password%>user\password.yan
set oracle_sid=%name%
mode con cols=120 lines=10000
color 2f
cls
sqlplus %userName%/%password%@%name%
cls
goto :eof

rem ===改变字母大小写===
:change
cls
echo.&echo.
set /p name=<user\sid.yan
set /P name=    请输入SID默认为%name%：
cls
echo.&echo.
echo	耐心等待...

if "%name%"=="" set name=ORCL
echo %name%>user\sid.yan
set TS=%name%
set str=aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ
for %%i in (%str%) do set "var=%%i" & set !var:~0,1!=%%i

for /l %%i in (0 1 100) do (
        set "T3=!TS:~%%i,1!"
        if "!T3!"=="" goto :Res
        if defined !T3! (
                call set T2=%%!T3!:~0,1%%
                if "!T3!"=="!T2!" call set T2=%%!T3!:~1,1%%) else set "T2=!T3!"
        set Res=!Res!!T2!
)
:Res
goto :eof

exit
