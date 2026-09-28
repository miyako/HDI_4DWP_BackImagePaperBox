//%attributes = {"invisible":true}
var $pathInfo; $pathDemo1; $pathDemo2 : Text
var $platform : Integer

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		// Load documents
		$pathInfo:=Get 4D folder:C485(Current resources folder:K5:16)+"Info.4wp"
		$pathDemo1:=Get 4D folder:C485(Current resources folder:K5:16)+"Australia.4wp"
		$pathDemo2:=Get 4D folder:C485(Current resources folder:K5:16)+"Argentina2.4wp"
		
		// Info tab
		vInfoDoc:=WP Import document:C1318($pathInfo)
		_O_PLATFORM PROPERTIES:C365($platform)
		If ($platform=Windows:K25:3)
			WP SET ATTRIBUTES:C1342(vInfoDoc; wk background color:K81:20; "white")  // Just adapt background color to fit Windows style :-)
		End if 
		
		// Demo1 tab
		vDoc:=WP Import document:C1318($pathDemo1)
		vAustraliaEx:=True:C214
		vClipPaper:=True:C214
		vOriginPaper:=True:C214
		
		// Demo2 tab
		vDoc2:=WP Import document:C1318($pathDemo2)
		
End case 
