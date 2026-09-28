//%attributes = {"invisible":true}
var $path : Text

// Load Australia example document
$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Australia.4wp"
vDoc:=WP Import document:C1318($path)
