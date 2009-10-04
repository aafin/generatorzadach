
## Prefix="###"
## Suffix=""
## Enc="cp866"
## End


BEGIN {
	Kav="\"";

}

function StripLine(L) {
	sub(/^[ \t]*/,"",L);
	sub(/[ \t]*$/,"",L);
	return(L);
}

						###MkDirs
function MkDirs(D,i){
	for(i=1 ; i<=3 ; i++){
                print("if not exist " D[i] " mkdir " D[i]);
                print("cd " D[i]);
	}

}

						###MkRemake
function MkRemake(RemakeName,GnrtLine,Fname,Lng){
                print("echo @echo off>"RemakeName)
		print("echo setlocal>>"RemakeName)
		print("echo cd ..\\..\\..\\>>"RemakeName)
		print("echo call gnrt " GnrtLine " >>"RemakeName)
		print("echo call " Lng "-trnsl.bat>>"RemakeName)
		print("echo endlocal>>"RemakeName)
		print("echo call ..\\..\\..\\" Lng "-cp " Fname ">>"RemakeName) 
}

						###mkalldir
(ToDo == "mkalldir"){ 

	if (0 == KolVo ) KolVo=1;

	if ($1 == "Z" ) {

        	split($0,TmpA,"@");
                
        	Dir[1]= StripLine(TmpA[2])  ;
        	Dir[2]=Kav StripLine(TmpA[3]) Kav ;
        	Dir[3]=Kav StripLine(TmpA[4]) Kav ;

               	MkDirs(Dir);

        	Fname=StripLine(TmpA[5])
        	ZdList=StripLine(TmpA[6])

                RemakeName="remake" KolVo ".ba"

                MkRemake("remake" KolVo ".ba" , "!! " ZdList , Fname , Dir[1] );


                print("cd ..\\..\\..");



        }
}






END { }