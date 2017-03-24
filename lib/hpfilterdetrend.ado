// $Rev: 65 $
// $Date: 2016-05-11 15:22:28 -0700 (Wed, 11 May 2016) $
// $LastChangedBy: jlperla $

capture program drop hpfilterdetrend
program hpfilterdetrend
	syntax varlist(min=1 numeric), Trendprefix(string) Filterprefix(string) 
	marksample touse
	
	foreach var in `varlist' {
		capture confirm numeric variable sm`var' //checks if the variable is present
		if _rc { //Only if it doesn't exist
			tsfilter hp `filterprefix'`var'=`var', trend(`trendprefix'`var')
			
			local lab: variable label `var'			
			label variable `trendprefix'`var' "HP Filtering Trend of `lab'"		
			label variable `filterprefix'`var' "HP Filtered `lab'"
		}
	}
end
