:: Prefix=":::"
:: Suffix=""
:: Enc="cp866"
:: End

:::RNM-DO



if %3- == - goto end
move %1 bfrn\%1
echo File = %1 >>rnm.log
gawk -f rnm.awk -v A=%2 -v B=%3 bfrn\%1 > %1  
:end
