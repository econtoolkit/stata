// $Rev: 68 $
// $Date: 2016-05-20 16:50:35 -0700 (Fri, 20 May 2016) $
// $LastChangedBy: jlperla $

/* //Old code
capture program drop replacestringwithempty
program replacestringwithempty
	syntax varlist(min=1), Code(string)

	foreach var in `varlist' {
		replace `var' = "" if `var' == "`code'"
	}
end
*/

//See http://stackoverflow.com/questions/37356258/variable-length-string-argument-in-stata-syntax

capture program drop replacestringwithempty    
program replacestringwithempty
syntax varlist(min=1 string), Codes(string asis)
tokenize `"`codes'"'
while "`1'" != "" {
    foreach var of varlist `varlist' {
        replace `var' = "" if `var'==`"`1'"'
    }
    macro shift
}
end
