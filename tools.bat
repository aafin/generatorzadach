@echo off

if -%1- == -- goto err

if -%1- == -mkalldir- goto mkalldir

goto err

:mkalldir
shift
if not exist %1-ex.txt goto err
gawk -f tools.awk -v ToDo=mkdir  %1-ex.txt >tmp-mkdir.bat
::call tmp-mkdir.bat
::del tmp-mkdir.bat

goto end


:err
echo ?????
goto end

:end