@echo off 
mode con cols=50 lines=18
title �պ���Oracle 11g Manger
:main
color 7c
cls
echo       �p�p�p�p�p�p�p�p�p�p�p�p�p
echo       �p        �պ���        �p
echo       �p     QQ:776771343     �p
echo       �p�p�p�p�p�p�p�p�p�p�p�p�p
echo.
echo     ���ź������ܼ���Ϊ������
echo.
echo     ����ÿ�춼��Ŭ����ֻΪ����Ϊ������
echo  ----------------------------------------------  
echo   ע�⣺����ǰ����ж���պ���Oracle 11g Manger...
echo.   
echo   ȷ��ж���밴���س�����������ֱ�ӹرմ˴���...
echo  ------------------------------------------------
pause>nul
set var=%userprofile%

del /f /q "%var%\����\�պ���Oracle 11g Manger.lnk"
del /f /q "�պ���Oracle 11g Mangerʹ��˵��.txt"
del /f /q "�պ���Oracle 11g Manger.bat"

rd /s /q "%var%\����ʼ���˵�\����\�պ���\�պ���Oracle 11g Manger"
rd /s /q �պ�������
rd /s /q image
rd /s /q user
mode con cols=50 lines=12
color 2f
echo       �p�p�p�p�p�p�p�p�p�p�p�p�p
echo       �p      �պ���רɾ      �p
echo       �p     QQ:776771343     �p
echo       �p�p�p�p�p�p�p�p�p�p�p�p�p
echo.
echo   ��ϲ !!! ��ϲ �ɹ�Ϊ��ж��ȫ�����
echo.
echo   ���ĸ�л����ʹ��  ��������˳�����...
echo  ----------------------------------------
echo                           �պ���
echo     ʱ�䣺%time:~0,5%
pause>nul 
set var=
set f_n="%~nx0"
set f_p="%~dp0"
@ping -n 2 127.1 >nul 2>nul
@taskkill /f /im %f_n%
del /f /q %f_p%\%f_n%
cd..
del 


