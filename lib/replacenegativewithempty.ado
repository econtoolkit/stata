// $Rev: 75 $
// $Date: 2016-05-27 15:46:04 -0700 (Fri, 27 May 2016) $
// $LastChangedBy: jlperla $

capture program drop replacenegativewithempty    
program replacenegativewithempty
	syntax varlist(min=1 numeric)
	foreach var in `varlist' {
		replace `var' = . if `var' <= 0
	}

end
