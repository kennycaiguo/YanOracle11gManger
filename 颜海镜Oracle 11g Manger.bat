@echo off
setlocal enabledelayedexpansion


title �պ���Oracle 11g Manger2.0beta��

:main
rem ������ʾ������ʼ��
set varError=
mode con cols=50 lines=18

color 4a
echo        ������������������� 
echo        ��     �պ���Oracle 11g Manger    ��
echo        �������������������
echo.
echo     �պ�����һ������
echo.
echo     ����ÿ�춼��Ŭ����ֻΪ����Ϊ������
echo  ----------------------------------------------  
echo   ����Oracle���� ��sqlplusһ��ʽ����...
echo.   
echo   ȷ���밴���س�����������ֱ�ӹرմ˴���...
echo  ------------------------------------------------
pause>nul
cls
echo.&echo.&echo.
echo		1�򿪷��� 
echo.
echo		2�رշ��� 
echo.
echo		ֱ�Ӱ��س����ӵ�sqlplus
echo.
set /p choice=	�����빦�ܺ�: 
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
echo       �p�p�p�p�p�p�p�p�p�p�p�p�p
echo       �p        �պ���        �p
echo       �p     QQ:776771343     �p
echo       �p�p�p�p�p�p�p�p�p�p�p�p�p
echo.
echo   ֹͣOracle 11g������ɣ���ȷ����û�д�������
echo.
echo   ���ĸ�л����ʹ��  ��������˳�����...
echo  ----------------------------------------
echo                           �պ���
echo     ʱ�䣺%time:~0,5%
pause>nul
goto :eof

:opSer 
call :change
net start OracleOraDb11g_home1TNSListener
if errorlevel 1 set varError=δ������OracleOraDb11g_home1TNSListener����&goto :sorry

net start OracleService%name%
if errorlevel 1 set varError=δ������OracleService%name%����&goto :sorry

net start OracleDBConsole%TS%

mode con cols=50 lines=12
color 2f
cls
echo.&echo.&echo.&echo.
echo	����Oracle 11g������ɣ����潫�������ݿ⡣
goto :sqlplus
goto :eof

rem ===������ʾ===
:sorry
color f5
cls
echo.&echo.&echo.&echo.
echo      ������ʧ�� ������     
echo.
echo      ���ź�-_-��sorry�� δ�ܰ����������
echo.
echo      ����%varError%
echo.
echo      ����ģ����ǵĹ���ʦ�Ѿ����ֽ��������
echo.
echo  --------------------------------------------
echo.
echo          ��Ҫ�˳���ֱ�ӹرմ˴���...
echo.
echo                              �պ���
echo      ʱ�䣺%time:~0,5%
pause>nul
goto :eof

rem ===��sqlpus===
:sqlplus
cls
echo.
set /p userName=<user\user.yan
set /P userName=    Ĭ���ʺ�%userName%��
echo %userName%>user\user.yan
echo.
set /p password=<user\password.yan
set /P password=    Ĭ���ʺ�����%password%��
echo %password%>user\password.yan
set oracle_sid=%name%
mode con cols=120 lines=10000
color 2f
cls
sqlplus %userName%/%password%@%name%
cls
goto :eof

rem ===�ı���ĸ��Сд===
:change
cls
echo.&echo.
set /p name=<user\sid.yan
set /P name=    ������SIDĬ��Ϊ%name%��
cls
echo.&echo.
echo	���ĵȴ�...

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
