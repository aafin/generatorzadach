@echo off
:: Prefix="::{"
:: Suffix="}"
:: Enc="cp866"
:: End



if -%1- == -- goto err

:: mkalldir ru 25
if -%1- == -mkalldir- goto mkalldir

goto err

::{mkalldirB}
:mkalldir
shift
if not exist %1-ex.txt goto err
if -%2- == -- goto err
gawk -f tools.awk -v ToDo=mkalldir -v KolVo=%2 %1-ex.txt >tmp-mkdir.bat
call tmp-mkdir.bat
::del tmp-mkdir.bat

goto end
::{}


:err
echo ?????
goto end

:end
