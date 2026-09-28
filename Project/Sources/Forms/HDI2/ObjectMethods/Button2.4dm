//%attributes = {"invisible":true}
var $path; $file : Text
var $pict : Picture


// Select the image to insert according to the current example 
If (vAustraliaEx=True:C214)
	$file:="AustraliaPicture.jpg"
Else 
	$file:="World.png"
End if 

// Read picture file
$path:=Get 4D folder:C485(Current resources folder:K5:16)+$file
READ PICTURE FILE:C678($path; $pict)

// Insert as background picture
WP SET ATTRIBUTES:C1342(vDoc; wk background image:K81:21; $pict)
WP SET ATTRIBUTES:C1342(vDoc; wk background repeat:K81:24; wk no repeat:K81:109)
