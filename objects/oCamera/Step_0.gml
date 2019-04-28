if (instance_exists(oPlayer))
	target = oPlayer;

if (!instance_exists(target)) return;

// Set target x & y
xTo = target.x;
yTo = target.y;
		
// Move Camera Object
x += (xTo - x) * 0.1;
y += (yTo - y) * 0.1;

// Update Camera View Matrix
viewmat = matrix_build_lookat(x, y, -100, x, y, 0, 0, 1, 0);
camera_set_view_mat(cam, viewmat);

// Update Camera Projection Matrix
projmat = matrix_build_projection_ortho(cameraWidth, cameraHeight, 1.0, 32000.0);
camera_set_proj_mat(cam, projmat);


if (keyboard_check_pressed(ord("Z")))
	if (keyboard_check(vk_shift))
		zoomedOut = !zoomedOut

if (zoomedOut) {
	cameraWidth  = 1920;
	cameraHeight = 1440;
}
else {
	cameraWidth	 = 720;
	cameraHeight = 540;
}