@echo off
chcp 866



:: ���-�� 祫���� � ��㯯� �� 㬮�砭��
:: �᭮���� ���� �������.



call .\tools.bat mkalldir ru 10

echo chcp 866 > ru\mkcard.bat
echo ..\tools.bat mkcard ru ������ >> ru\mkcard.bat

copy ru-smpl.txt ru\��ࠧ��.ini

:end

pause 
exit





