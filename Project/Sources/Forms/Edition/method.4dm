//%attributes = {"invisible":true}
var $path : Text

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		// Load documents
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Argentina2.4wp"
		vDocEx:=WP Import document:C1318($path)
		
End case 
