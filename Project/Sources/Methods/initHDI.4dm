//%attributes = {"invisible":true}
ARRAY TEXT:C222(TabControl; 0)
ARRAY TEXT:C222(TextTabControl; 0)

If (Get database localization:C1009(Current localization:K5:22)="ja")
	$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("SAMPLES-ja.json").getText(); Is collection:K8:32)
Else 
	$json:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("SAMPLES-en.json").getText(); Is collection:K8:32)
End if 

COLLECTION TO ARRAY:C1562($json; TabControl; "Title"; TextTabControl; "Text")

//ALL RECORDS([SAMPLES])
//ORDER BY([SAMPLES]; [SAMPLES]SampleSort; >)
//SELECTION TO ARRAY([SAMPLES]Title; TabControl)
//SELECTION TO ARRAY([SAMPLES]Text; TextTabControl)
//UNLOAD RECORD([SAMPLES])

TabControl:=0
Var1:=TextTabControl{1}
Var2:=TextTabControl{2}

_O_PLATFORM PROPERTIES:C365($vlPlatform)

If ($vlPlatform=Windows:K25:3)
	ST SET ATTRIBUTES:C1093(Var1; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 18)
End if 

var $project : Text

If (ds:C1482.EXAMPLES.getCount()=0)
	
	CREATE RECORD:C68([EXAMPLES:4])
	[EXAMPLES:4]wpDoc:2:=WP Import document:C1318(Get 4D folder:C485(Current resources folder:K5:16)+"EXAMPLES.4wp")
	SAVE RECORD:C53([EXAMPLES:4])
	
End if 

If (ds:C1482.PICTURES.getCount()=0)
	
	$path:=File:C1566("/RESOURCES/PICTURES.4ie").platformPath
	$project:=File:C1566("/RESOURCES/PICTURES.4si").getText()
	IMPORT DATA:C665($path; $project)
	
End if 