@echo off
chcp 866



:: Кол-во человек в группе по умолчанию
:: Основная масса заданий.



call .\tools.bat mkalldir ru 10

echo chcp 866 > ru\mkcard.bat
echo ..\tools.bat mkcard ru Билеты >> ru\mkcard.bat

copy ru-smpl.txt ru\Образец.ini

:end

pause 
exit





