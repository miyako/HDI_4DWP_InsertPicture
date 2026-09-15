
Case of 
	: (Form event code:C388=On Load:K2:1)
		initHDI
		
		ALL RECORDS:C47([EXAMPLES:4])
		ALL RECORDS:C47([PICTURES:1])
		
		//ARRAY TEXT(ppBckgndColor;2)
		//ppBckgndColor{1}:="To the document"
		//ppBckgndColor{2}:="To the paragraph"
		//ppBckgndColor:=1
		
		mReplace:=1
		mInclude:=1
End case 

