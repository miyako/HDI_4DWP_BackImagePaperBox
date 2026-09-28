//%attributes = {"invisible":true}

// Reload doc
var $path : Text

$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Argentina2.4wp"
vDoc2:=WP Import document:C1318($path)
