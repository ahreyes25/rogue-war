/// @param Grid
/// @param x
/// @param y

var g = argument0;
var i = argument1;
var j = argument2;

if (!ds_exists(g, ds_type_grid)) return;

return (i <= ds_grid_width(g) - 2 && i >= 1 && j <= ds_grid_height(g) - 2 && j >= 1);