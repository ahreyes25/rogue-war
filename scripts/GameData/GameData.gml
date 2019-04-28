enum DIR {
	NONE, RIGHT, LEFT, UP, DOWN
}
enum DUNGEON {
	WALL, NONE, TUNNEL, ROOM, SLOPE,
	PLAYER_SPAWN, EXIT, CHEST, ENEMY_SPAWN,
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