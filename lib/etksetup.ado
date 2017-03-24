// $Rev: 64 $
// $Date: 2016-05-11 13:47:37 -0700 (Wed, 11 May 2016) $
// $LastChangedBy: jlperla $
capture program drop etksetup

program etksetup
	clear all
	capture log close
	log using out.log, text replace
	set linesize 250
	set more off
end
