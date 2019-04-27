// Draw Black Background
draw_set_alpha(0.75);
draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

// Draw Log List
var lineSpacing = 15;
draw_set_halign(fa_center);

for (var i = 0; i < logLength; i++) {
	draw_set_color(c_white);
	
	// Get Temp y Position Relative to List
	var sy = (y + (i * lineSpacing) + (scrollIndex * global.logScrollSpeed));
	
	// If Touching List Item, Draw Red
	if (abs(sy - (mouse_y - lineSpacing)) <= 7)
		draw_set_color(c_red)
		
	// Draw List Item
	draw_text(x, sy, ds_list_find_value(battleLog, i));	
	
	// Reset Color
	draw_set_color(c_white);
}

// Compute Log Index
logIndex = clamp(round((sy - (mouse_y - lineSpacing)) / lineSpacing), 0, logLength - 1);
logIndex = logLength - logIndex - 1;