@echo off

if exist .\set-env.bat call .\set-env.bat

::latex ru-main
::pdfLATEX  ru-main
::dvips -V ru-main

echo a > ru-main.dvi
echo a >   ru-main.ps
echo a >  ru-main.pdf
echo a >  ru-main.html


:::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::: ������ html
::type ru-b.htm>ru-main.html
:::::::::::::: � UNICODE ��� mozilla
::tth -t -i -u -r<ru-main.tex >>ru-main.html
:::::::::::::: ��� UNICODE ��� M$ expl-er
::tth -t -i -r <ru-main.tex >>ru-main.html
::type ru-e.htm>>ru-main.html
:::::::::::::::::::::::::::::::::::::::::::::::::::::

