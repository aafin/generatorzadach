
@echo off


:: Prefix=":::"
:: Suffix=""
:: Enc="cp866"
:: End

:::RNM

if exist bfrn echo Упс. Директория BFRN сущствует!
if exist bfrn goto end


if %2- == - echo неверные параметры
if %2- == - goto end

MKDIR BFRN
echo. >rnm.log

set A=%1
set B=%2

for %%x in (ru-myzdn.bat gnrt.bat ru-main.tex ru-zadan.tex ) do call rnm_do.bat %%x %A% %B%
for %%x in (main.txt gzd-lb.awk ru-zdn.bat test-lb.awk main.awk rnm.bat) do call rnm_do.bat %%x %A% %B%


:end
