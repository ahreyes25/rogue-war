// Update Scroll Index on Mouse Wheel Scroll
if (global.invertLogScroll) {
	if (mouse_wheel_up())	scrollIndex++;
	if (mouse_wheel_down()) scrollIndex--;
} else {
	if (mouse_wheel_up())	scrollIndex--;
	if (mouse_wheel_down()) scrollIndex++;
}

// Check for Mouse Click On Log Item
if (mouse_check_button_pressed(mb_left)) {
	var logValue = ds_list_find_value(battleLog, logIndex);
	
}