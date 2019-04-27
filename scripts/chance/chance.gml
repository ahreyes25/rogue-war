/// @param Percent

var c = argument0;
var rand = irandom_range(1, 100);

if (c < 0) {
	c *= 100;	
}

return (rand <= c);