
## Prefix="###"
## Suffix=""
## Enc="cp866"
## End

# Ø‡Æ·‚Æ ·Á•‚Á®™.



function AtoW(W,i,x,S){  ## è•‡•™Æ§. 
	S="";
  for(i=1 ; i<=length(W) ; i++)
    { x=substr(W,i,1);
      S=S ((x in aw)?aw[x]:x);
     }
  return S;
}


BEGIN { No=0;	###1000
	##  è‡Æ¢•‡™† °„™¢
	## ÌÂ ‰ÓÎÊÌÓ ·˚Ú¸ ‚Ë‰ÌÓ
	LFile="list.txt";
       	Delim="@";
	#Prefix="#" "##";
	Str=0;
	Ndefs=0;
	Nrefs=0;
	ERROR=0;
	split("©Ê„™•≠£ËÈßÂÍ‰Î¢†Ø‡Æ´§¶ÌÔÁ·¨®‚Ï°ÓâñìäÖçÉòôáïöîõÇÄèêéãÑÜùüóëåàíúÅû",a,"");
	split("ÈˆÛÍÂÌ„¯˘Áı˙Ù˚‚‡ÔÓÎ‰Ê˝ˇ˜ÒÏËÚ¸·˛…÷” ≈Õ√ÿŸ«’⁄‘€¬¿œ–ŒÀƒ∆›ﬂ◊—Ã»“‹¡ﬁ",w,"");
	for(i in a) aw[a[i]]=w[i];
	for(i in a) wa[w[i]]=a[i];

}

function Err(a,b){ ###Err
	print("ERROR No" a "\n" b) >"con";
	ERROR=a;
	exit;
} 



/^[ \t]*\.C/ {	  ###Comm
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
	next;
}

(Inside == "V"){
	if($1 == ""){
		Inside=0;
	}
	next;
}

			
/^[ \t]*\.d/ {	###defs
        Ndefs++;
	sub(/^[ \t]*/,"");
	sub(/[ \t]*$/,"");
        AllDefs[Ndefs]=$0;
        NoLineDef[Ndefs]=NR;

        print(NR, $0);
}

/^[ \t]*\.r/ {	###refs
	Nrefs++;
	sub(/^[ \t]*/,"");
	AllRefs[Nrefs]=$0;
        NoLineRef[Nrefs]=NR;

	print(NR, $0);
}

/^[ \t]*\.df/ {  	###df
	if ($3 == "") Err(4,NR":"$0);
	ListLabelOfFile[$2]=$3;
	ListOfFile[$3]=$2;		
}

/^[ \t]*\.s/  {	###s
	No++;	###s10
	LastNo=No;

	if ( $3 == "" ) {   ###s15
		if (Delim $2 in Labels)
			LabelsAnotherNom[No]=Labels[Delim $2];
		else{
			Labels[Delim $2]=No;
                	OnlyLabelsFile[$2]="";
                }
	}
	else{				###s20
		if ( !($2 in ListLabelOfFile) ) Err(1,NR":"$0);

		if ((ListLabelOfFile[$2] Delim $3) in Labels)
			LabelsAnotherNom[No]=Labels[(ListLabelOfFile[$2] Delim $3)];
		else
		      	Labels[ListLabelOfFile[$2] Delim $3]=No;
       	}
}



/^[ \t]*\.b\>/   {  ###LocW1
	LocalBlok=1;
	print(NR" .b");
	next;
}


/^[ \t]*\.e\>/   {  
	LocalBlok=0;
	print(NR" .e");
	next;
} ###ENDLocW1






 
END {         		###200	
	if (ERROR) exit;
	for(FName in ListOfFile) {
		No=0;	###210
		LineNo=0;
		while ((getline line < FName) >0 ){ ###fpr
			LineNo++;
                        if(match(line,"Prefix=\"")){
                        	line=substr(line,RSTART+8);
                                sub(/\".*$/,"",line);
                                Prefix[FName]=line;
                        }
                        if(match(line,"Suffix=\"")){
                        	line=substr(line,RSTART+8);
                                sub(/\".*$/,"",line);
                                Suffix[FName]=line;
                        }
                        if(match(line,"Enc=\"")){
                        	line=substr(line,RSTART+5);
                                sub(/\".*$/,"",line);
                                Enc[FName]=line;
                        }              
                        if(match(line,"End")) break; ###end-fpr
		}
		if(ERRNO) Err(3,ERRNO);           ###err-read
		while ((getline line < FName) >0 ){ ###215
			LineNo++;

			if(Enc[FName] == "cp866") line=AtoW(line);

			# á†¨≠† ‚†° ≠† Ø‡Æ°•´Î
			#gsub("        ","\t",line);

			if(match(line,Prefix[FName])){ ###220
				No=0;
				tmpline=substr(line,RSTART+3);
				sub(Suffix[FName]"[ \\t]*$","",tmpline);

				if( Delim tmpline in Labels ){ ###225
					if(OnlyLabelsFile[tmpline] == "") OnlyLabelsFile[tmpline] = FName;
					if(FName != OnlyLabelsFile[tmpline]) Err(20,"????"); #??????

					if ((FName Delim tmpline) in Labels)
						LabelsAnotherNom[Labels[Delim tmpline]]=Labels[FName Delim tmpline]
					else
						Labels[FName Delim tmpline]=Labels[Delim tmpline];

					delete Labels[Delim tmpline];

                                }

				if((FName Delim tmpline) in Labels){ ###230
					No=Labels[(FName Delim tmpline)];
					MemHed[No]=":"LineNo":"FName":" tmpline ":--------------------------------------------------" ;

					ItIsFirstLine=1		###235
                                }
			}
			if(ItIsFirstLine) {   	###240
				sub((Prefix[FName] tmpline Suffix[FName]),"",line);
				ItIsFirstLine=0;
			}
			if (No != 0) Mem[No]=Mem[No] "\n@" line ; ###250
		}
		close(FName); ###255
	}                    

	for(i=1 ; i<=Ndefs ; i++){  ###PrintDefs
#	print(NoLineDef[i] " " AllDefs[i]);
	}

	for(i=1 ; i<=Nrefs ; i++){  ###PrintRefs
#	print(NoLineRef[i] " " AllRefs[i]);
	}

	for(i=1 ; i <= LastNo; i++){  ###700
		if (i in LabelsAnotherNom){
			print(":"i MemHed[LabelsAnotherNom[i]] Mem[LabelsAnotherNom[i]]);

		}
		else{
			if (i in MemHed)
				{print(":"i MemHed[i] Mem[i])}
			else
				{print(":1:0:No Quotation:4:"); print("@")}
		}
	}

}

