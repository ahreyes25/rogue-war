xTo = x;
yTo = y;
target = noone;
cameraWidth		= 720;//960;
cameraHeight	= 540;//720;

cam		= camera_create();
viewmat = matrix_build_lookat(x, y, -100, x, y, 0, 0, 1, 0);
projmat = matrix_build_projection_ortho(cameraWidth, cameraHeight, 1.0, 32000.0);
camera_set_view_mat(cam, viewmat);
camera_set_proj_mat(cam, projmat);

view_camera[0] = cam;

zoomedOut = false;