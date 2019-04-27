if (!ds_exists(dungeonGrid, ds_type_grid)) return;

var clusters		= 1;
var iterations		= 1000;
var wrapIterations  = 0;
var canTurnBack		= 0;		// modify in pick_new_direction() also
var canOverlap		= 0;
var tunnelLength	= 0;		// modify in pick_new_direction() also
var canPlaceRoom	= 0;
var roomChance		= 0;
var mxRoomSize 		= 0;

var count = 0;	// break infinite loop

// Destroy All Wall Objects
with(oWall)
	instance_destroy();

#region Set to all WALLS
for (var i = 0; i < gw; i++) {
	for (var j = 0; j < gh; j++) {
		ds_grid_set(dungeonGrid, i, j, LAND.WALL);
	}
}
#endregion

#region Base Level
while (clusters > 0) {
	
	// Start at random point in room
	var cx = irandom_range(0, gw - 1);
	var cy = irandom_range(0, gh - 1);

	// Keep Track Of Direction
	var curDir = choose(DIR.LEFT, DIR.RIGHT, DIR.UP, DIR.DOWN);

	// Keep track of our tunnel lenght
	var tunnel = 0;

	// Random Walk
	while (iterations > 0) {
		// Place Room
		if (canPlaceRoom && chance(roomChance) && tunnel >= tunnelLength) {
			var roomWidth = irandom_range(1, mxRoomSize);
			var roomHeight = roomWidth;
		
			for (var i = 0; i < roomWidth; i++) {
				for (var j = 0; j < roomHeight; j++) {
					if (in_bounds(dungeonGrid, cx + i, cy + j)) {
						if (canOverlap) {
							ds_grid_set(dungeonGrid, cx + i, cy + j, LAND.ROOM);
						}
						else {
							if (ds_grid_get(dungeonGrid, cx + i, cy + j) == LAND.NONE || ds_grid_get(dungeonGrid, cx + i, cy + j) == LAND.WALL) {
								ds_grid_set(dungeonGrid, cx + i, cy + j, LAND.ROOM);
							}
						}
					}
				}
			}
		
			tunnel = 0;
		}
		// Did not place room
		else {
			// Place tunnel piece
			if (canOverlap) {
				if (in_bounds(dungeonGrid, cx, cy)) {
					ds_grid_set(dungeonGrid, cx, cy, LAND.TUNNEL);
				}
			}
			else {
				if (in_bounds(dungeonGrid, cx, cy)) {
					if (ds_grid_get(dungeonGrid, cx, cy) == LAND.NONE || ds_grid_get(dungeonGrid, cx, cy) == LAND.WALL) {
						ds_grid_set(dungeonGrid, cx, cy, LAND.TUNNEL);
					}
				}
				else {
					// Replace iteration point if we did not overalp
					if (wrapIterations) {
						iterations++;
					}
				}
			}
		
			nextx = 0;
			nexty = 0;
		
			// Randomly pick a new direction
			pick_new_direction(curDir, tunnel);
		
			// While next direction is out of bounds, find a new direction
			while (!in_bounds(dungeonGrid, cx + nextx, cy + nexty)) {
				pick_new_direction(curDir, tunnel);
				count++;
				
				// Break Infinite Loop lol
				if (count >= 100)
					break;
			}
		
			// Move to Next Point
			if (nextx == -1) {
				curDir = DIR.LEFT;
				cx--;
			}
			else if (nextx == 1) {
				curDir = DIR.RIGHT;
				cx++;
			}
			else if (nexty == -1) {
				curDir = DIR.UP;
				cy--;
			}
			else if (nexty == 1) {
				curDir = DIR.DOWN;
				cy++;
			}
			tunnel++;
		}
		iterations--;
	}
	clusters--;
}
#endregion

#region Add Slopes

/*
var slopeChance = 30;
for (var i = 0; i < gw; i++) {
	for (var j = 0; j < gh; j++) {
		if (ds_grid_get(dungeonGrid, i, j) == LAND.ROOM || ds_grid_get(dungeonGrid, i, j) == LAND.TUNNEL) {
			
			// check left and bottom
			if (in_bounds(dungeonGrid, i - 1, j) && in_bounds(dungeonGrid, i, j + 1)) {
				if (ds_grid_get(dungeonGrid, i - 1, j) == LAND.WALL && ds_grid_get(dungeonGrid, i, j + 1) == LAND.WALL) {
					if (chance(slopeChance)) {
						ds_grid_set(dungeonGrid, i, j, LAND.SLOPE);
					}
				}
			}
			
			// check right and bottom
			if (in_bounds(dungeonGrid, i + 1, j) && in_bounds(dungeonGrid, i, j + 1)) {
				if (ds_grid_get(dungeonGrid, i + 1, j) == LAND.WALL && ds_grid_get(dungeonGrid, i, j + 1) == LAND.WALL) {
					if (chance(slopeChance)) {
						ds_grid_set(dungeonGrid, i, j, LAND.SLOPE);
					}
				}
			}
			
			// check left and top
			if (in_bounds(dungeonGrid, i - 1, j) && in_bounds(dungeonGrid, i, j - 1)) {
				if (ds_grid_get(dungeonGrid, i - 1, j) == LAND.WALL && ds_grid_get(dungeonGrid, i, j - 1) == LAND.WALL) {
					if (chance(slopeChance)) {
						ds_grid_set(dungeonGrid, i, j, LAND.SLOPE);
					}
				}
			}
			
			// check right and top
			if (in_bounds(dungeonGrid, i + 1, j) && in_bounds(dungeonGrid, i, j - 1)) {
				if (ds_grid_get(dungeonGrid, i + 1, j) == LAND.WALL && ds_grid_get(dungeonGrid, i, j - 1) == LAND.WALL) {
					if (chance(slopeChance)) {
						ds_grid_set(dungeonGrid, i, j, LAND.SLOPE);
					}
				}
			}
		}
	}
}
*/
#endregion

#region Make Sure Room Is Surrounded By Walls

for (var i = 0; i < gw; i++) {
	ds_grid_set(dungeonGrid, i, 0, LAND.WALL);
	ds_grid_set(dungeonGrid, i, gh - 1, LAND.WALL);
}
for (var j = 0; j < gh; j++) {
	ds_grid_set(dungeonGrid, 0, j, LAND.WALL);
	ds_grid_set(dungeonGrid, gw - 1, j, LAND.WALL);
}

#endregion

#region Remove Isolated Pieces

for (var i = 0; i < gw; i++) {
	for (var j = 0; j < gh; j++) {
		if (ds_grid_get(dungeonGrid, i, j) == LAND.WALL) {
			var leftEmpty	= false;
			var rightEmpty	= false;
			var upEmpty		= false;
			var downEmpty	= false;
				
			// Check Left
			if (in_bounds(dungeonGrid, i - 1, j))
				if (ds_grid_get(dungeonGrid, i - 1, j) != LAND.WALL)
					leftEmpty = true;
					
			// Check Right
			if (in_bounds(dungeonGrid, i + 1, j))
				if (ds_grid_get(dungeonGrid, i + 1, j) != LAND.WALL)
					rightEmpty = true;
					
			// Check Up 
			if (in_bounds(dungeonGrid, i, j - 1))
				if (ds_grid_get(dungeonGrid, i, j - 1) != LAND.WALL)
					upEmpty = true;
					
			// Check Down
			if (in_bounds(dungeonGrid, i, j + 1))
				if (ds_grid_get(dungeonGrid, i, j + 1) != LAND.WALL)
					downEmpty = true;
					
			// Delete
			if (leftEmpty + rightEmpty + upEmpty + downEmpty >= 3)
				ds_grid_set(dungeonGrid, i, j, LAND.NONE);
		}
	}
}

#endregion

#region Create Wall Pieces
for (var i = 0; i < gw; i++) {
	for (var j = 0; j < gh; j++) {
		if (ds_grid_get(dungeonGrid, i, j) == 0) {
			instance_create_layer(global.unitW * i, global.unitW * j, "Instances", oWall);	
		}
	}
}
#endregion

createdDungeon = true;