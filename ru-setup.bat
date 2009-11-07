@echo off
chcp 866




call .\tools.bat mkalldir ru 10

echo chcp 866 > ru\mkcard.bat
echo ..\tools.bat mkcard ru ¨«¥βλ >> ru\mkcard.bat

copy ru-smpl.txt ru\Obrazec.ini

:end

pause 
exit





