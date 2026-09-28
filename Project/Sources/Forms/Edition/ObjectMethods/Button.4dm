//%attributes = {"invisible":true}
var $path : Text

$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Argentina2.4wp"
WP EXPORT DOCUMENT:C1337(vDocEx; $path)
