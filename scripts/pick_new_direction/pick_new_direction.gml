var curDir = argument0;
var tunnel = argument1;
var tunnelLength	= 0;
var canTurnBack		= 0;

if (choose(GRID_DIR.x, GRID_DIR.y) == GRID_DIR.x) {
	if (tunnel >= tunnelLength) {
		if (canTurnBack) {
			nextx = choose(-1, 1);
		}
		else {
			if (curDir == DIR.RIGHT) {
				nextx = 1;
			}
			else if (curDir == DIR.LEFT) {
				nextx = -1;
			}
			else {
				nextx = choose(-1, 1);	
			}
		}
	}
	else {
		if (curDir == DIR.RIGHT) {
			nextx = 1;	
		}
		else if (curDir == DIR.LEFT) {
			nextx = -1;	
		}
	}
	nexty = 0;
}
else {
	if (tunnel >= tunnelLength) {
		if (canTurnBack) {
			nexty = choose(-1, 1);
		}
		else {
			if (curDir == DIR.DOWN) {
				nexty = 1;
			}
			else if (curDir == DIR.UP) {
				nexty = -1;
			}
			else {
				nexty = choose(-1, 1);	
			}
		}
	}
	else {
		if (curDir == DIR.UP) {
			nexty = -1;	
		}
		else if (curDir == DIR.DOWN) {
			nexty = 1;	
		}
	}
	nextx = 0;
}