// $Rev: 70 $
// $Date: 2016-05-22 21:23:35 -0700 (Sun, 22 May 2016) $
// $LastChangedBy: jlperla $

adopath + C:\working\libraries\etk_stata
etkdropall //Useful if debugging the etk programs.
etksetup

hello

capture program drop mytest
program mytest
	args n
	display "Value = `n'"
end

mytest "1"
mytest "2"

capture log close //Stop Recording
