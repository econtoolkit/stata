// $Rev: 78 $
// $Date: 2016-05-30 21:37:35 -0700 (Mon, 30 May 2016) $
// $LastChangedBy: jlperla $

adopath + C:\working\libraries\etk_stata
etkdropall //Useful if debugging the etk programs.
etksetup


//The panel dimension are used by percent_change and demean
use govindustry-v2.3.dta
tsset sic4 year, y

//Several of the data manipulation routines such as logs, percent changes, demeaning.
logall k energy, prefix("l")
percentchange k energy, prefix("pc") logprefix("l")
demean k energy, prefix("dm")
expsmoothdetrend k, prefix("sm") detrendprefix("dt")
hpfilterdetrend k,  trendprefix("dm") filterprefix("filt") 

capture log close //Stop Recording
