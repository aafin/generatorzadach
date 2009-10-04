@echo off

if exist .\set-env.bat call .\set-env.bat

if not exist pic mkdir pic

echo. >main.htm
gawk -f 1.awk main.txt >main.i

gawk -f html.awk -v DoAll=1 main.txt >main.htm
gawk -f html.awk -v DoAll=0 main.txt >main-c.htm


:end