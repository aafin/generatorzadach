@echo off

if exist .\set-env.bat call .\set-env.bat

::latex en-main
::pdfLATEX  en-main
::dvips -V en-main

echo a > en-main.dvi
echo a >   en-main.ps
echo a >  en-main.pdf
echo a >  en-main.html


