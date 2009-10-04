@echo off
:: Prefix="::{"
:: Suffix="}"
:: Enc="cp866"
:: End



if -%1- == -- goto err

:: mkalldir ru 25
if -%1- == -mkalldir- goto mkalldir
:: cp ru Name
if -%1- == -cp- goto cp

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

::{toolscp}
:cp
shift
if -%2- == -- goto err
if not exist ..\..\..\%1-main.tex goto err

copy ..\..\..\%1-main.dvi %2.dvi
del ..\..\..\%1-main.dvi
del ..\..\..\%1-main.log
del ..\..\..\%1-main.aux

copy ..\..\..\%1-main.ps %2.ps
del ..\..\..\%1-main.ps

copy ..\..\..\%1-main.pdf %2.pdf
del ..\..\..\%1-main.pdf

copy ..\..\..\%1-main.html %2.html
del ..\..\..\%1-main.html

goto end
::{}

:err
echo ?????
goto end

:end
