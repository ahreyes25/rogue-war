if (global.invertLogScroll) {
	if (mouse_wheel_up())
		scrollIndex++;
	if (mouse_wheel_down())
		scrollIndex--;
}
else {
	if (mouse_wheel_up())
		scrollIndex--;
	if (mouse_wheel_down())
		scrollIndex++;
}