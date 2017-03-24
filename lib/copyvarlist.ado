// $Rev: 74 $
// $Date: 2016-05-27 14:28:54 -0700 (Fri, 27 May 2016) $
// $LastChangedBy: jlperla $
capture program drop copyvarlist
program copyvarlist, rclass
	syntax varlist(min=1), Prefix(string)
	local newlist
	foreach var in `varlist' {
		local newlist `newlist' `prefix'`var'
	}
	return local newlist `newlist'
end
