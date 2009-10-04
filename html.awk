

## Prefix="###"
## Suffix=""
## Enc="cp1251"
## End




function SortMxxx(LOWRD,N,i,j,tmp){
	for (i=2 ; i<=N ; i++)  
		for (j=i ; j>=2 ; j--){
			if (LOWRD[j] < LOWRD[j-1]){
				tmp=LOWRD[j];
				LOWRD[j]=LOWRD[j-1];
				LOWRD[j-1]=tmp;
                        }
                }                            
}

function SortM(Arr,N){qsrt(Arr,1,N)}


function qsrt(Arr,l,r,ll,rr,m,tmp){ ###qsrt
	if (l >= r) return;

        ll=l;rr=r;
	m=int((l+r)/2);

	while(l<r)                 ###qsrt10    
	{
		while ((Arr[l] <= Arr[m]) && (l<m))	l++;
		while (Arr[r]>Arr[m])			r--;  
 
		tmp = Arr[l]; Arr[l] = Arr[r]; Arr[r] = tmp;

		if (l == m) m = r;            ###qsrt20    
		else if (r == m) m = l;      
	}
	  qsrt(Arr, ll, m-1);            ###qsrt30    
	  qsrt(Arr, m+1, rr);

}
###ENDqsrt



function DotsToRegExp(S){
	gsub(/\.\.\./,".+",S);
	return ("^"S);
}


function ccod(W,i,x,Sum){  
	Sum=0;
	for(i=1 ; i<=length(W) ; i++) {
  		x=substr(W,i,1);
  		Sum=(Sum+LetterToNom[x]*1111111111)%100000001;
  	}
  return Sum;
}


function MkPic(InsideStr,PicFile,Strtmp){

	PicFile="pic/"ccod(InsideStr);

	if ((getline < (PicFile".htm")) == -1 ){
		print("\\documentclass{article}\\begin{document}\\thispagestyle{empty}") >(PicFile".tex");
	        print(InsideStr) >>(PicFile".tex");
		print("\\end{document}") >(PicFile".tex");

      		close(PicFile".tex");
		system("tth.exe -Ltmp -t -r<" PicFile".tex > "PicFile".htm" );
		close(PicFile".htm");

	}
	else{
		while( (getline Strtmp<(PicFile".htm") )>0 ){
			print(Strtmp);
                }
                close(PicFile".htm");

        }
}

BEGIN {   ###htmbegin

##nach=systime();



       	Strr= Strr "\000\001\002\003\004\005\005\007";
	Strr= Strr "\010\011\012\013\014\015\015\017";
	Strr= Strr "\020\021\022\023\024\025\025\027";
       	Strr= Strr "\030\031\032\033\034\035\035\037";
	Strr= Strr "\040\041\042\043\044\045\045\047";
	Strr= Strr "\050\051\052\053\054\055\055\057";
	Strr= Strr "\060\061\062\063\064\065\065\067";
	Strr= Strr "\070\071\072\073\074\075\075\077";


       	Strr= Strr "\100\101\102\103\104\105\105\107";
	Strr= Strr "\110\111\112\113\114\115\115\117";
	Strr= Strr "\120\121\122\123\124\125\125\127";
       	Strr= Strr "\130\131\132\133\134\135\135\137";
	Strr= Strr "\140\141\142\143\144\145\145\147";
	Strr= Strr "\150\151\152\153\154\155\155\157";
	Strr= Strr "\160\161\162\163\164\165\165\167";
	Strr= Strr "\170\171\172\173\174\175\175\177";


	Strr= Strr "\200\201\202\203\204\205\205\207";
	Strr= Strr "\210\211\212\213\214\215\215\217";
	Strr= Strr "\220\221\222\223\224\225\225\227";
       	Strr= Strr "\230\231\232\233\234\235\235\237";
	Strr= Strr "\240\241\242\243\244\245\245\247";
	Strr= Strr "\250\251\252\253\254\255\255\257";
	Strr= Strr "\260\261\262\263\264\265\265\267";
	Strr= Strr "\270\271\272\273\274\275\275\277";


	Strr= Strr "\300\301\302\303\304\305\305\307";
	Strr= Strr "\310\311\312\313\314\315\315\317";
	Strr= Strr "\320\321\322\323\324\325\325\327";
       	Strr= Strr "\330\331\332\333\334\335\335\337";
	Strr= Strr "\340\341\342\343\344\345\345\347";
	Strr= Strr "\350\351\352\353\354\355\355\357";
	Strr= Strr "\360\361\362\363\364\365\365\367";
	Strr= Strr "\370\371\372\373\374\375\375\377";



        #print(S);
        split(Strr,AllLetter,"");

        for (i in AllLetter) LetterToNom[AllLetter[i]]=i;
        Strr="";



	tmp="&nbsp;&nbsp;&nbsp;";
	Probel[1]=tmp ;
	Probel[2]=tmp tmp ;
	Probel[3]=tmp tmp tmp ;
	Probel[4]=tmp tmp tmp tmp ;
	Probel[5]=tmp tmp tmp tmp tmp ;
	Probel[6]=tmp tmp tmp tmp tmp tmp ;
#	print("<html><bady>");
	print("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">");
	print("<HTML><HEAD>");
	print("<META http-equiv=Content-Type content=\"text/html; charset=windows-1251\">");
	NoC=0;
	NoCite=0;
	NoDo=0;
	Defs=1;
	Inside=0;
	NoHtmlb=0;
	LastNumOfLocBlok=0;
	CurrNumOfLocBlok=0;
        NomOfLocWord=0;



#	IFile=ARGV[1]".i";
	IFile=ARGV[1];
	FileN=ARGV[1];

	sub(/\.[^\.]*/,".i",IFile);
	sub(/\.[^\.]*/,"",FileN);

	ErrFile="Err.txt";
	print("") > ErrFile;
	Getln();
	while(Defs == 1){  ###htm-begin10       
		split(Str,M);

		# найдем коментарий к переменной
		#CommentToVar=M[4]" "M[5]" "M[6]" "M[7];
                CommentToVar=Str
		sub(/[ ]*[^ ]*[ ]*[^ ]*[ ]*[^ ]*[ ]*/,"",CommentToVar);

		if (M[2] == ".di"){
			AllIndW[M[3]]="g";
			NoHtmlb++;
			if(M[3] in Link) print (M[3]" появилось второй раз на строчке "M[1]) >>ErrFile;
			Link[M[3]]="i"NoHtmlb;
			CommOfGlobVar[M[3]]=CommentToVar;
			TypeOfGlobalVar[M[3]]=0;
			if (M[4] ~ /^[0-9]+$/) 	TypeOfGlobalVar[M[3]]=M[4];
		}
		if (M[2] == ".dh"){      ###htm-begin15
			NoSection++;
			sub(/^.*\.dh[ ]+[^ ]+[ ]*/,"",Str);
			sub(/[ \t]*$/,"",Str);

                        ###htm-begin16
                        if (M[3] == "+1") {
	                        HedPlusOne=Str;
                        	Str = Str "; " HedNoPlus;
                                HedPlusTwo=""; HedPlusThree="";
                                HeadLevel=LastHeadLevel+1;
                        }
                        else if (M[3] == "+2") {
	                        HedPlusTwo=Str;
                        	Str = Str "; " HedPlusOne "; " HedNoPlus;
                                HedPlusThree="";
                                HeadLevel=LastHeadLevel+2;
                        }
                        else if (M[3] == "+3") {
	                        HedPlusThree=Str;
                        	Str = Str "; " HedPlusTwo "; " HedPlusOne "; " HedNoPlus;
                                HeadLevel=LastHeadLevel+3;
                        }
                        else {
                        	HedNoPlus=Str;
                                HedPlusOne=""; HedPlusTwo=""; HedPlusThree="";
                                LastHeadLevel=M[3];
                                HeadLevel=LastHeadLevel;
                        }

                        Header[NoSection]=Str;
			if(Str in LinkS) print (Str" появилось второй раз на строчке "M[1]) >>ErrFile;

			LinkS[Str]="s"NoSection;					
			print(M[1] Probel[HeadLevel] "<a href=\"#"LinkS[Str]"\">"Str"</a><br>"); ###htm-begin17
		}
		if (M[2] == ".b") {
			LastNumOfLocBlok++;
			CurrNumOfLocBlok=LastNumOfLocBlok;
		}
		if (M[2] == ".e") {
			CurrNumOfLocBlok=0;
		}
		if (M[2] == ".dl") {
			NomOfLocWord++;
			LocWord[M[3]"@"CurrNumOfLocBlok]=NomOfLocWord;
                        AllIndW[M[3]]="l";

                        CommOfLocVar[M[3]"@"CurrNumOfLocBlok]=CommentToVar; # Коментарий к переменной

		}
		if (M[2] == ".df") { 
			FilesNames[M[3]]=M[4];
		}
		Getln();    ###htm-begin20    
	}


       	LastNumOfLocBlok=0;
	CurrNumOfLocBlok=LastNumOfLocBlok;

}

#function MkIndd(S,Wrd){   
#	gsub("<","\\&lt;",S);		
#	for(Wrd in AllIndW){
#		if (Wrd"@"CurrNumOfLocBlok in LocWord)
#			gsub(("\\y"Wrd"\\y"),"<a style=\"color:Green\" href=\"#l"LocWord[Wrd"@"CurrNumOfLocBlok]"\">"Wrd"</a>",S);
#		else if (Wrd in Link)
#			gsub(("\\y"Wrd"\\y"),"<a href=\"#"Link[Wrd]"\">"Wrd"</a>",S);
#	}
#	return S;
#}       


function MkInd(S,#                ###MkInd
	i,Wrd,g,w,nw,out,SS){

	out="";

	SS=S;

#	while(match(S,/\<\w+\>/)){		
	while(match(S,/\<[[:alnum:]_]+\>/)){		
		g=substr(S,1,RSTART-1);
		Wrd=substr(S,RSTART,RLENGTH);
		S=substr(S,RSTART+RLENGTH);

		gsub("<","\\&lt;",g);

		if (Wrd"@"CurrNumOfLocBlok in LocWord)
			gsub(("\\y"Wrd"\\y"),"<a style=\"color:Green\" href=\"#l"LocWord[Wrd"@"CurrNumOfLocBlok]"\" title=\""CommOfLocVar[Wrd"@"CurrNumOfLocBlok]"\" >"Wrd"</a>",Wrd);
		else if (Wrd in Link) {
                                CountBR++;
				BR[Wrd]=BR[Wrd]" "CountBR;
				BRW[Wrd"@-@BR"CountBR]=SS;
				gsub(("\\y"Wrd"\\y"),"<a Id=\"BR"CountBR"\" href=\"#"Link[Wrd]"\" title=\""CommOfGlobVar[Wrd]"\">"Wrd"</a>",Wrd);
			}
		out=out g Wrd;
        }

        gsub("<","\\&lt;",S);

        return (out S);     
}
###

function Getln(a,M){  ###Getln
	a=getline Str < IFile;  ###Getln10
	if (Str ~ /^:/) {
		Defs=0;
		split(Str,M,":");
		NoCite=M[2];
		NoStr=M[3]-1;
		Fname=M[4];
		LabelName=M[5];

               	a=getline Str < IFile;
		
	}
        if (Str ~ /^@/){ ###Getln20
        	sub(/^@/,"",Str);
                NoStr++;
	}

	if (a<=0) NoCite=100000000; ###Getln30
	return a;
}



/^[ \t]*\./ && (NoDo == 0){   ###htm-begin
	NoDo=1;
}

(NoDo == 0) {next;} ###htm-begin30

/^[ \t]*\.C/ {
	Inside="C";
	next;
}

(Inside == "C"){
	if($1 != ""){
	}
	else {
		Inside=0;
	}
	next;
}


/^[ \t]*\.c/ {
	next;
}



/^[ \t]*\.V/ {
	Inside="V";
#	print("<pre style=\"background-color:Aqua\">")
	print("<pre>\n------")	
	next;
}

(Inside == "V"){
	if($1 != ""){
		S=MkInd($0);
		print(S);
	}
	else {
		print("------\n</pre>");
		Inside=0;
	}
	next;
}







/^[ \t]*\.df/ {
	print("<em>"$3"</em>");
	next;
}

/^[ \t]*\.f/ {
	print("<em>"FilesNames[$2]"</em>");
	next;
}


#/^[ \t]*\.s/ {

($1 == ".s" && DoAll == 1) {
       	NoC++;
	while(NoCite < NoC) Getln();
#	print("<pre style=\"background-color:Gray\">");
	print("<pre>");
#	print("<em style=\"color:red\" title=\""LabelName"\">"Fname " ("LabelName")</em>")
	print("<a style=\"color:red\" id=sr"NoC" href="FileN"-c.htm#sr"NoC" title=\""LabelName"\">"Fname " ("LabelName")</a>")
	while(NoCite == NoC) {
		S=MkInd(Str);
		print(NoStr"\t"S);
		Getln();		
	}
	print("</pre>");
	next;
}


($1 == ".s" && DoAll == 0 ) {
       	NoC++;
	while(NoCite < NoC) Getln();
	print("<br>");
	print("<a style=\"color:red\" id=sr"NoC" href="FileN".htm#sr"NoC" title=\""LabelName"\">(||||||||||||)</a>")
	while(NoCite == NoC) {
		S=MkInd(Str);
		#print(NoStr"\t"S);
		Getln();		
	}
	print("<p>");
	next;
}



/^[ \t]*\.fix/ {
	$1="";
	print("<b style=\"background-color:Fuchsia\" title=\"file:"FILENAME",line:"NR"\">" MkInd($0) "</b>");
	next;
}

/^[ \t]*\.i/ {
	print("<b>"$2"</b>");
	next;
}

/^[ \t]*\.di/ {
	Wrd=$2;
	$1="";$2="";
	print("<em style=\"color:Red\" id="Link[Wrd] " title=\"" $0 "\">"Wrd"</em>");
	next;
}




/^[ \t]*\.b\>/ {		###LW-a
	LastNumOfLocBlok++;
	CurrNumOfLocBlok=LastNumOfLocBlok;
	next;
}
/^[ \t]*\.e\>/ {		
	CurrNumOfLocBlok=0;
	next;
}          
/^[ \t]*\.dl/ {
	Wrd=$2;
	$1="";$2="";
	print("<em style=\"color:Green\" id=l"LocWord[Wrd"@"CurrNumOfLocBlok] " title=\"" $0 "\">"Wrd"</em>" );
	#print( "<em>(" $0 ")</em>" )
	next;
}


			###ENDLW-a

			###EmptyLine10 
/^[ \t]*\.t/ {print("<p>" $0);}

	
	

/^[ \t]*\.r/ {  $1="";		###Ref10
		sub(/^[ ]*/,"");
		AbrrOK=0;
		AbrrWord=DotsToRegExp($0);
		for(HoleWord in LinkS) {
			if(HoleWord ~ AbrrWord){
				print("<a href=#"LinkS[HoleWord]" title=\"см. " HoleWord "\">(***)"  "</a>");
				AbrrOK=1;
			}
		}
	if (!AbrrOK) {print("<br><b style=\"background-color:Fuchsia\" title=\"file:"FILENAME",line:"NR"\">\n.r "$0"\n</b><br>")}
	next;
}


/^[ \t]*\.dh/ {		###Zagol10
	$1="";
	L=$2;
	if (L == "+1"){
		L=LastHeadLevel+1;
	}
	else if (L == "+2") {
		L=LastHeadLevel+2;
	}
	else if (L == "+3") {
		L=LastHeadLevel+3;
	}
	else {
        	LastHeadLevel=L;
        }
	$2= "";
	sub(/^[ \t]*/,"");
	sub(/[ \t]*$/,"");

        NomOfHeader++;

	print("<h"L" id="LinkS[Header[NomOfHeader]]" title=\"file:"FILENAME",line:"NR"\">"Header[NomOfHeader]"</h"L">"); 
       	#print("<h"L" id="LinkS[$0]" title=\"file:"FILENAME",line:"NR"\">"$0"</h"L">"); #????


	next;
	
}


/^[ \t]*\.m/ {
	$1="";
	#print($0)>"tmp.tex";
	#system("tth.exe -Ltmp -t  -r<tmp.tex");
	#close("tmp.tex");
#	print($0) | " tth.exe -t -i -r";

	MkPic($0);
	next;
}


/^[ \t]*\.M/ {
	Inside="M";
	InsideStr="";
	next;
}

(Inside == "M"){
	if($1 != "") InsideStr=InsideStr "\n" $0;
	else {
		#print(InsideStr)>"tmp.tex";
		#system("tth.exe -Ltmp -t -r<tmp.tex");
		Inside=0;
               	#close("tmp.tex");
               	MkPic(InsideStr);
	}

	next;
}




/^[ \t]*$/ {
	if(Inside != 0){
		Inside=0;
	}
	else {
		print("<p>");
	}
	next;
}


{					
	print(MkInd($0));
}
					

END {


if(DoAll){   ###Ind10

	ii=0;
        for (Wrd in Link) {
        	ii++;
        	LOWRD[ii]=Wrd;
        }
	
	SortM(LOWRD,ii) 




        for (Type=0 ; Type <= 10 ; Type++){


		for (j=1 ; j<=ii ; j++){ 

                	Wrd=LOWRD[j];
 			
                	split(BR[Wrd],Arr);


                        N=split(BR[Wrd],Arr);  
                        for (i in Arr) {Arr[i]=Arr[i]+0}

	               	SortM(Arr,N); 

                	if(TypeOfGlobalVar[Wrd] == Type){
                        
                        	print(MkInd(Wrd) " ["TypeOfGlobalVar[Wrd] "]")
                        	#for (i in Arr) {
               	                for (i=1 ; i<=N ; i++) {
                        		S=BRW[Wrd"@-@BR"Arr[i]];
                                        gsub("<","\\&lt;",S);		
                        		gsub("\"","'",S);
                        		gsub(/^[ \t]*/,"",S);


                        		print("<a href=\"#BR"Arr[i]"\" title=\""S"\">(*)</a>");
                        }
                        print("<br>");

                        }

                }

        }

}


print("</bady></html>");

#for(i in BR) print(i "->" BR[i]);

#for(i in BRW) print(i "->" BRW[i]);

##print( systime() - nach);

}