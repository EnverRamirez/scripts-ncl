undef("get_height")
function get_height(p)
/;
Computes height (m) from pressure (mb or hPa) using standard atmosphere
source: https://en.wikipedia.org/wiki/Barometric_formula
Enver Ramirez
;/

local zero

begin

zero=0.0
;Standard atmosphere (international units, except pressure)
if ( p .ge. 226.32 ) then
 Tb = 288.15
 Lb = -0.0065
 pb = 1013.25
 hb = 0.0
elseif ( p .lt. 226.32 .and. p .ge. 54.7489 ) then
 Tb = 216.65
 Lb = zero
 pb = 226.32
 hb = 11000.0
elseif ( p .lt. 54.7489 .and. p .ge. 8.6802 ) then
 Tb = 216.65
 Lb = 0.001
 pb = 54.7489
 hb = 20000.0
elseif ( p .lt. 8.6802 .and. p .ge. 1.1091 ) then
 Tb = 228.65
 Lb = 0.0028
 pb = 8.6802
 hb = 32000.0
elseif ( p .lt. 1.1091 .and. p .ge. 0.6694 ) then
 Tb = 270.65
 Lb = zero
 pb = 1.1091
 hb = 47000.0
elseif ( p .lt. 0.6694 .and. p .ge. 0.0396 ) then
 Tb = 270.65
 Lb = -0.0028
 pb = 0.6694
 hb = 51000.0
else
 Tb = 214.65
 Lb = -0.002
 pb = 0.0396
 hb = 71000.0
end if

;Compute height:
 alpha=0.034  ; K/m
if ( Lb .eq. zero ) then
 h = hb - Tb/alpha * log(p/pb)
else
 h = Tb/Lb * ( (p/pb)^(-Lb/alpha) - 1  ) + hb
end if

 return( h ) 
end
