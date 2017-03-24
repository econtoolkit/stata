// $Rev: 76 $
// $Date: 2016-05-30 15:45:24 -0700 (Mon, 30 May 2016) $
// $LastChangedBy: jlperla $
capture program drop displaylonglabels
program displaylonglabels
args length
	quietly{
		ds, has(type numeric) //
	}
	format %`length'.0g `r(varlist)'
end
