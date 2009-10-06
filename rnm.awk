## Prefix="###"
## Suffix=""
## Enc="cp866"
## End

###RNMAWK

BEGIN {
#print(A "->" B)
List="";

}

function RenInStr(Str,A,B,#  	Заменит A на B
	tmp,OutStr,Befor,After,Wrd,WhatIs,FofW){

	OutStr= ""; Befor=""; Wrd="";

	while(match(Str,/\<[[:alnum:]_]+\>/)){		
       		Befor=substr(Str,1,RSTART-1);
		Wrd  =substr(Str,RSTART,RLENGTH);
		After=substr(Str,RSTART+RLENGTH);
	
	        if (Wrd == B) {
			List   = List "\n" NR ":!!\t" OutStr Befor Wrd After;
                }
	        else if ( Wrd == A ) {
			List   = List "\n" NR ":\t" OutStr Befor Wrd After "\n\t" OutStr Befor B After;
			OutStr = OutStr Befor B;
                }
                else
                {
                	OutStr = OutStr Befor Wrd; 
                }

                Str=After;
	}
	return (OutStr Str);
}

{
	print(RenInStr($0,A,B));
}

END {

print(List) >> "rnm.log"

}