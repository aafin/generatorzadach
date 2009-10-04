

BEGIN {
	Kav="\"";

}

function StripLine(L) {
	sub(/^[ \t]*/,"",L);
	sub(/[ \t]*$/,"",L);
	return(L);
}

#(ToDo == "mkdir")
{

	if ($1 == "Z" ) {

        	split($0,TmpA,"@");

        	Dir1=Kav StripLine(TmpA[2]) Kav ;
        	Dir2=Kav StripLine(TmpA[3]) Kav ;
        	Dir3=Kav StripLine(TmpA[4]) Kav ;
        	Fname=StripLine(TmpA[5])
        	ZdList=StripLine(TmpA[6])

                print("if not exist " Dir1 " mkdir " Dir1);
                print("cd " Dir1);


                print("if not exist " Dir2 " mkdir " Dir2);
                print("cd " Dir2);


                print("if not exist " Dir3 " mkdir " Dir3);
                print("cd " Dir3);

                print("echo gnrt " ZdList " >remake.ba"); 
                print("echo xx " Fname " >>remake.ba"); 

                print("cd ..\\..\\..");



        }
}






END { }