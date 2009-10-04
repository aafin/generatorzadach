
## Prefix="###"
## Suffix=""
## Enc="cp866"
## End


BEGIN {
	Kav="\"";

}
						###StripLine
function StripLine(L) {
	sub(/^[ \t]*/,"",L);
	sub(/[ \t]*$/,"",L);
	return(L);
}

						###MkDirs
function MkDirs(d1,d2,d3,D,i){

	D[1]=d1; D[2]=d2 ; D[3]=d3;

	for(i=1 ; i<=3 ; i++){
		D[i]=Kav StripLine(D[i]) Kav;
                print("if not exist " D[i] " mkdir " D[i]);
                print("cd " D[i]);
	}
}

						###MkRemake
function MkRemake(RemakeName,GnrtLine,Flname,Lng){
                print("echo @echo off>"RemakeName)
		print("echo setlocal>>"RemakeName)
		print("echo cd ..\\..\\..\\>>"RemakeName)
		print("echo call gnrt " GnrtLine " >>"RemakeName)
		print("echo call " Lng "-trnsl.bat>>"RemakeName)
		print("echo endlocal>>"RemakeName)
		print("echo call ..\\..\\..\\tools.bat cp " Lng " " Flname ">>"RemakeName) 
}
						###MkClean
function MkClean(Fln,CN){
                print("echo @echo off>"CN)
		print("echo del "Fln".ps>>"CN);
		print("echo del "Fln".pdf>>"CN);
		print("echo del "Fln".dvi>>"CN);
		print("echo del "Fln".html>>"CN);
}

						###mkalldir
(ToDo == "mkalldir"){ 

	if (0 == KolVo ) KolVo=1;

	if ($1 == "Z" ) {

        	split($0,TmpA,"@");

        	Lengvige=StripLine(TmpA[2]);
        	Flname=StripLine(TmpA[5])
        	ZdList=StripLine(TmpA[6])
                RemakeName="remake" KolVo ".bat"

               	MkDirs(TmpA[2],TmpA[3],TmpA[4]);
                MkRemake(RemakeName , "!! " ZdList , Flname , Lengvige );
                MkClean(Flname,"clean.bat");
                print("cd ..\\..\\..");



        }
}
                				###mkcard
(ToDo == "mkcard") {
	 #print(":: " $0)
	 Leng=$1;
	 DirNm=$2;
	 FilNm=$3;  Tmp=$3;
         sub(/^.*\\/,"",Tmp); sub(/\..*$/,"",Tmp); 
         MkDirs(Leng,DirNm,Tmp);
         MkRemake("remake.bat","!!!"FilNm"!!!" ,Tmp,Leng)
         MkClean(Tmp,"clean.bat");
         print("cd ..\\..\\..");
} 


###





END { }
