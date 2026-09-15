
C_OBJECT:C1216($wpRange)
//get the range from the user selection
$wpRange:=WP Selection range:C1340([EXAMPLES:4]wpDoc:2)

C_BOOLEAN:C305($fail)
$fail:=False:C215


C_LONGINT:C283($mode; $extension)
//define the mode according radio button 
Case of 
	: (mReplace=1)
		$mode:=wk replace:K81:177
	: (mAppend=1)
		$mode:=wk append:K81:179
	: (mPrepend=1)
		$mode:=wk prepend:K81:178
	Else 
		//default if issues occures
		$mode:=wk replace:K81:177
End case 

Case of 
	: (mInclude=1)
		$extension:=wk include in range:K81:180
	: (mExclude=1)
		$extension:=wk exclude from range:K81:181
	Else 
		//default if issues occures
		$extension:=wk include in range:K81:180
End case 



//ask the user which picture on the disk he wants to insert
$pathSelect:=Get 4D folder:C485(Current resources folder:K5:16)
$imgRef:=Select document:C905($pathSelect; ""; "Select a picture"; 0)
//if he doesn't cancel
If (ok=1)
	//if the file is a picture file supported
	If (Is picture file:C1113(document))
		// insert the picture selected by the user. 
		WP Insert picture:C1437($wpRange; document; $mode; $extension)
		
		// create a selection in the document in order to see the difference in the insertion mode.
		WP SELECT:C1348([EXAMPLES:4]wpDoc:2; $wpRange)
		
		// give the focus to the 4D Write Pro area
		GOTO OBJECT:C206(*; "WParea")
		
	Else 
		$fail:=True:C214
	End if 
Else 
	$fail:=True:C214
End if 
//if the insertion failed alert the user
If ($fail)
	ALERT:C41("Picture insertion failed.")
End if 
