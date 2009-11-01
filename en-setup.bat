@echo off





call .\tools.bat mkalldir en 10

echo ..\tools.bat mkcard en Cards > en\mkcard.bat
copy en-smpl.txt en\Sample.ini

:end

pause 
exit





