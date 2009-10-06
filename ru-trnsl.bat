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
:::::::::::::: Делать html
::type ru-b.htm>ru-main.html
:::::::::::::: с UNICODE для mozilla
::tth -t -i -u -r<ru-main.tex >>ru-main.html
:::::::::::::: без UNICODE для M$ expl-er
::tth -t -i -r <ru-main.tex >>ru-main.html
::type ru-e.htm>>ru-main.html
:::::::::::::::::::::::::::::::::::::::::::::::::::::

