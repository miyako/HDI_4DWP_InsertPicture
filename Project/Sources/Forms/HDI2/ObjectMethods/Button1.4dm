var $wpRange : Object
//get the range from the user selection
$wpRange:=WP Selection range:C1340([EXAMPLES:4]wpDoc:2)


var $mode; $extension : Integer
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



//insert the picture from the picture field you choose from the current record selected. 
WP Insert picture:C1437($wpRange; [PICTURES:1]picture:2; $mode; $extension)

// create a selection in the document in order to see the difference in the insertion mode.
WP SELECT:C1348([EXAMPLES:4]wpDoc:2; $wpRange)

// give the focus to the 4D Write Pro area
GOTO OBJECT:C206(*; "WParea")