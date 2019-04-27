enum DIR {
	NONE, RIGHT, LEFT, UP, DOWN
}
enum LAND {
	WALL, TUNNEL, ROOM, SLOPE, NONE,
}
enum GRID_DIR {
	x, y, i, j	
}

global.cardFlipTime		= 1;
global.warCardFlipTime	= 1;
global.warVictoryTime	= 1;
global.soundFxMult		= 1.0;
global.musicMult		= 1.0;
global.logScrollSpeed	= 40;
global.invertLogScroll	= true;

global.unitW = 32;