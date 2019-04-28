#region Auto tiling -- WARNING: DISGUSTING SPAGHETTI CODE 

gx = x / global.unitW;
gy = y / global.unitW;

var wallLeft		= false;
var wallRight		= false;
var wallUp			= false;
var wallDown		= false;
var wallUpLeft		= false;
var wallUpRight		= false;
var wallDownLeft	= false;
var wallDownRight	= false;

// Check Left
if (in_bounds(oGame.dungeonGrid, gx - 1, gy)) {
	if (ds_grid_get(oGame.dungeonGrid, gx - 1, gy) == DUNGEON.WALL)
		wallLeft = true;
}
else
	wallLeft = true;

// Check Right
if (in_bounds(oGame.dungeonGrid, gx + 1, gy)) {
	if (ds_grid_get(oGame.dungeonGrid, gx + 1, gy) == DUNGEON.WALL)
		wallRight = true;
}
else
	wallRight = true;

// Check Up
if (in_bounds(oGame.dungeonGrid, gx, gy - 1)) {
	if (ds_grid_get(oGame.dungeonGrid, gx, gy - 1) == DUNGEON.WALL)
		wallUp = true;
}
else
	wallUp = true;

// Check Down
if (in_bounds(oGame.dungeonGrid, gx, gy + 1)) {
	if (ds_grid_get(oGame.dungeonGrid, gx, gy + 1) == DUNGEON.WALL)
		wallDown = true;
}
else
	wallDown = true;

// Check UpLeft
if (in_bounds(oGame.dungeonGrid, gx - 1, gy - 1)) {
	if (ds_grid_get(oGame.dungeonGrid, gx - 1, gy - 1) == DUNGEON.WALL)
		wallUpLeft = true;
}
else
	wallUpLeft = true;

// Check UpRight
if (in_bounds(oGame.dungeonGrid, gx + 1, gy - 1)) {
	if (ds_grid_get(oGame.dungeonGrid, gx + 1, gy - 1) == DUNGEON.WALL)
		wallUpRight = true;
}
else
	wallUpRight = true;

// Check DownLeft
if (in_bounds(oGame.dungeonGrid, gx - 1, gy + 1)) {
	if (ds_grid_get(oGame.dungeonGrid, gx - 1, gy + 1) == DUNGEON.WALL)
		wallDownLeft = true;
}
else
	wallDownLeft = true;

// Check DownRight
if (in_bounds(oGame.dungeonGrid, gx + 1, gy + 1)) {
	if (ds_grid_get(oGame.dungeonGrid, gx + 1, gy + 1) == DUNGEON.WALL)
		wallDownRight = true;
}
else
	wallDownRight = true;

// Row
if (wallLeft && !wallRight && !wallUp && !wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sRR;
if (wallLeft && wallRight && !wallUp && !wallDown)
	sprite_index = sRM;
if (!wallLeft && wallRight && !wallUp && !wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sRL;

// Column
if (!wallLeft && !wallRight && !wallUp && wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sCT;
if (!wallLeft && !wallRight && wallUp && !wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sCB;
if (!wallLeft && !wallRight && wallUp && wallDown)
	sprite_index = sCM;
	
// Box
if (!wallLeft && wallRight && !wallUp && wallDown)
	sprite_index = sTL;
if (wallLeft && wallRight && !wallUp && wallDown)
	sprite_index = sTM;
if (wallLeft && !wallRight && !wallUp && wallDown)
	sprite_index = sTR;
if (!wallLeft && wallRight && wallUp && wallDown)
	sprite_index = sML;
if (wallLeft && wallRight && wallUp && wallDown)
	sprite_index = sMM;
if (wallLeft && !wallRight && wallUp && wallDown)
	sprite_index = sMR;
if (!wallLeft && wallRight && wallUp && !wallDown)
	sprite_index = sBL;
if (wallLeft && wallRight && wallUp && !wallDown)
	sprite_index = sBM;
if (wallLeft && !wallRight && wallUp && !wallDown)
	sprite_index = sBR;

// Inverted Box
if (!wallLeft && wallRight && !wallUp && wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sITL;
if (wallLeft && wallRight && !wallUp && !wallDown && !wallUpLeft && !wallUpRight && wallDownLeft && wallDownRight)
	sprite_index = sITM;
if (wallLeft && !wallRight && !wallUp && wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sITR;
if (!wallLeft && !wallRight && wallUp && wallDown && !wallUpLeft && wallUpRight && !wallDownLeft && wallDownRight)
	sprite_index = sIML;
if (!wallLeft && !wallRight && wallUp && wallDown && wallUpLeft && !wallUpRight && wallDownLeft && !wallDownRight)
	sprite_index = sIMR;
if (!wallLeft && wallRight && wallUp && !wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sIBL;
if (wallLeft && wallRight && !wallUp && !wallDown && wallUpLeft && wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sIBM;
if (wallLeft && !wallRight && wallUp && !wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sIBR;

// Island
if (!wallLeft && !wallRight && !wallUp && !wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sI;
	
// Left T
if (!wallLeft && wallRight && !wallUp && !wallDown && !wallUpLeft && wallUpRight && !wallDownLeft && wallDownRight)
	sprite_index = sRL;
if (!wallLeft && !wallRight && !wallUp && wallDown && !wallUpLeft && !wallUpRight && wallDownLeft && !wallDownRight)
	sprite_index = sCT;
if (wallLeft && !wallRight && wallUp && wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sTeL;
if (!wallLeft && !wallRight && wallUp && !wallDown && wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sCB;

// Right T
if (!wallLeft && !wallRight && !wallUp && wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && wallDownRight)
	sprite_index = sCT;
if (!wallLeft && wallRight && wallUp && wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sTeR;
if (wallLeft && !wallRight && !wallUp && !wallDown && wallUpLeft && !wallUpRight && wallDownLeft && !wallDownRight)
	sprite_index = sRR;
if (!wallLeft && !wallRight && wallUp && !wallDown && !wallUpLeft && wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sCB;

// Down T
if (!wallLeft && wallRight && !wallUp && !wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && wallDownRight)
	sprite_index = sRL;
if (wallLeft && wallRight && !wallUp && wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sTeD;
if (wallLeft && !wallRight && !wallUp && !wallDown && !wallUpLeft && !wallUpRight && wallDownLeft && !wallDownRight)
	sprite_index = sRR;
if (!wallLeft && !wallRight && wallUp && !wallDown && wallUpLeft && wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sCB;

// Up T
if (!wallLeft && wallRight && !wallUp && !wallDown && !wallUpLeft && wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sRL;
if (wallLeft && wallRight && wallUp && !wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sTeU;
if (!wallLeft && !wallRight && !wallUp && wallDown && !wallUpLeft && !wallUpRight && wallDownLeft && wallDownRight)
	sprite_index = sCT;
if (wallLeft && !wallRight && !wallUp && !wallDown && wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sRR;

// Intersection
if (!wallLeft && !wallRight && !wallUp && wallDown && !wallUpLeft && !wallUpRight && wallDownLeft && wallDownRight)
	sprite_index = sCT;
if (!wallLeft && wallRight && !wallUp && !wallDown && !wallUpLeft && wallUpRight && !wallDownLeft && wallDownRight)
	sprite_index = sRL;
if (wallLeft && wallRight && wallUp && wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sI4;
if (wallLeft && !wallRight && !wallUp && !wallDown && wallUpLeft && !wallUpRight && wallDownLeft && !wallDownRight)
	sprite_index = sRR;
if (!wallLeft && !wallRight && wallUp && !wallDown && wallUpLeft && wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sCB;

// Bottom Right L
if (!wallLeft && !wallRight && !wallUp && wallDown && !wallUpLeft && !wallUpRight && wallDownLeft && !wallDownRight)
	sprite_index = sCT;
if (!wallLeft && wallRight && !wallUp && !wallDown && !wallUpLeft && wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sRL;
if (wallLeft && !wallRight && wallUp && !wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sLBR;

// Bottom Left L
if (!wallLeft && !wallRight && !wallUp && wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && wallDownRight)
	sprite_index = sCT;
if (!wallLeft && wallRight && wallUp && !wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sLBL;
if (wallLeft && !wallRight && !wallUp && !wallDown && wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sRR;

// Top Right L
if (!wallLeft && wallRight && !wallUp && !wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && wallDownRight)
	sprite_index = sRL;
if (wallLeft && !wallRight && !wallUp && wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sLTR;
if (!wallLeft && !wallRight && wallUp && !wallDown && wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sCB;

// Top Left L
if (!wallLeft && wallRight && !wallUp && wallDown && !wallUpLeft && !wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sLTL;
if (wallLeft && !wallRight && !wallUp && !wallDown)
	sprite_index = sRR;
if (!wallLeft && !wallRight && wallUp && !wallDown && !wallUpLeft && wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sCB;

// Inner Corners
if (wallLeft && wallRight && wallUp && wallDown && !wallUpLeft && wallUpRight && wallDownLeft && wallDownRight)
	sprite_index = sIBR;
if (wallLeft && wallRight && wallUp && wallDown && wallUpLeft && !wallUpRight && wallDownLeft && wallDownRight)
	sprite_index = sIBL;
if (wallLeft && wallRight && wallUp && wallDown && wallUpLeft && wallUpRight && wallDownLeft && !wallDownRight)
	sprite_index = sITL;
if (wallLeft && wallRight && wallUp && wallDown && wallUpLeft && wallUpRight && !wallDownLeft && wallDownRight)
	sprite_index = sITR;

// Inner Ts
if (wallLeft && wallRight && wallUp && wallDown && wallUpLeft && wallUpRight && !wallDownLeft && !wallDownRight)
	sprite_index = sITeD;
if (wallLeft && wallRight && wallUp && wallDown && !wallUpLeft && !wallUpRight && wallDownLeft && wallDownRight)
	sprite_index = sITeU;
if (wallLeft && wallRight && wallUp && wallDown && !wallUpLeft && wallUpRight && !wallDownLeft && wallDownRight)
	sprite_index = sITeL;
if (wallLeft && wallRight && wallUp && wallDown && wallUpLeft && !wallUpRight && wallDownLeft && !wallDownRight)
	sprite_index = sITeR;

// Inner Ls
if (wallLeft && wallRight && !wallUp && wallDown && !wallDownLeft && wallDownRight)
	sprite_index = sILTL;
if (wallLeft && wallRight && !wallUp && wallDown && wallDownLeft && !wallDownRight)
	sprite_index = sILTR;
if (wallLeft && wallRight && wallUp && !wallDown && wallUpLeft && !wallUpRight)
	sprite_index = sILBR;
if (wallLeft && wallRight && wallUp && !wallDown && !wallUpLeft && wallUpRight)
	sprite_index = sILBL;
	
if (wallLeft && !wallRight && wallUp && wallDown && wallUpLeft && !wallDownLeft)
	sprite_index = sIL4;
if (wallLeft && !wallRight && wallUp && wallDown && !wallUpLeft && wallDownLeft)
	sprite_index = sIL2;
if (!wallLeft && wallRight && wallUp && wallDown && wallUpRight && !wallDownRight)
	sprite_index = sIL3;
if (!wallLeft && wallRight && wallUp && wallDown && !wallUpRight && wallDownRight)
	sprite_index = sIL1;
	
// Crosses
if (wallLeft && wallRight && wallUp && wallDown && !wallUpLeft && wallUpRight && wallDownLeft && !wallDownRight)
	sprite_index = sC2;
if (wallLeft && wallRight && wallUp && wallDown && wallUpLeft && !wallUpRight && !wallDownLeft && wallDownRight)
	sprite_index = sC1;

// Other
if (wallLeft && !wallRight && !wallUp && wallDown && !wallUpRight && !wallDownLeft)
	sprite_index = sLTR;
if (!wallLeft && wallRight && wallUp && !wallDown && !wallUpRight && !wallDownLeft)
	sprite_index = sLBL;
if (!wallLeft && wallRight && !wallUp && wallDown && !wallUpLeft && !wallDownRight)
	sprite_index = sLTL;
if (wallLeft && !wallRight && wallUp && !wallDown && !wallUpLeft && !wallDownRight)
	sprite_index = sLBR;

#endregion