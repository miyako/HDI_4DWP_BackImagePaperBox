//%attributes = {}
#DECLARE($count : Text)
var $i; $n : Integer
var $text : Text
$n:=Num:C11($count)
For ($i; 1; $n)
	$text:=$text+String:C10(Random:C100)+"*"
End for 
$text:=Substring:C12($text; 1; Length:C16($text)-1)
