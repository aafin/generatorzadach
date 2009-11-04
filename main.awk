

BEGIN {

print("\\ZDN{12}{aa}{bb}{cc}{\\ZaZ{1}{2}{3}{4}\\OTV{10}}") >"main-o.tmp"


}

{print($0) >"xxx.tmp"}


END {

 print("%") >"main-r.tmp"


}
