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
var numberOfEnemies	= 4;

var count = 0;	// break infinite loop

#region Destroy All Old Wall Objects
with(oWall)
	instance_destroy();
#endregion

#region Set to all WALLS
for (var i = 0; i < gw; i++) {
	for (var j = 0; j < gh; j++) {
		ds_grid_set(dungeonGrid, i, j, DUNGEON.WALL);
	}
}
#endregion

#region Establish Base
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
							ds_grid_set(dungeonGrid, cx + i, cy + j, DUNGEON.ROOM);
						}
						else {
							if (ds_grid_get(dungeonGrid, cx + i, cy + j) == DUNGEON.NONE || ds_grid_get(dungeonGrid, cx + i, cy + j) == DUNGEON.WALL) {
								ds_grid_set(dungeonGrid, cx + i, cy + j, DUNGEON.ROOM);
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
					ds_grid_set(dungeonGrid, cx, cy, DUNGEON.TUNNEL);
				}
			}
			else {
				if (in_bounds(dungeonGrid, cx, cy)) {
					if (ds_grid_get(dungeonGrid, cx, cy) == DUNGEON.NONE || ds_grid_get(dungeonGrid, cx, cy) == DUNGEON.WALL) {
						ds_grid_set(dungeonGrid, cx, cy, DUNGEON.TUNNEL);
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

#region Add Slopes -- Currently Off

/*
var slopeChance = 30;
for (var i = 0; i < gw; i++) {
	for (var j = 0; j < gh; j++) {
		if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.ROOM || ds_grid_get(dungeonGrid, i, j) == DUNGEON.TUNNEL) {
			
			// check left and bottom
			if (in_bounds(dungeonGrid, i - 1, j) && in_bounds(dungeonGrid, i, j + 1)) {
				if (ds_grid_get(dungeonGrid, i - 1, j) == DUNGEON.WALL && ds_grid_get(dungeonGrid, i, j + 1) == DUNGEON.WALL) {
					if (chance(slopeChance)) {
						ds_grid_set(dungeonGrid, i, j, DUNGEON.SLOPE);
					}
				}
			}
			
			// check right and bottom
			if (in_bounds(dungeonGrid, i + 1, j) && in_bounds(dungeonGrid, i, j + 1)) {
				if (ds_grid_get(dungeonGrid, i + 1, j) == DUNGEON.WALL && ds_grid_get(dungeonGrid, i, j + 1) == DUNGEON.WALL) {
					if (chance(slopeChance)) {
						ds_grid_set(dungeonGrid, i, j, DUNGEON.SLOPE);
					}
				}
			}
			
			// check left and top
			if (in_bounds(dungeonGrid, i - 1, j) && in_bounds(dungeonGrid, i, j - 1)) {
				if (ds_grid_get(dungeonGrid, i - 1, j) == DUNGEON.WALL && ds_grid_get(dungeonGrid, i, j - 1) == DUNGEON.WALL) {
					if (chance(slopeChance)) {
						ds_grid_set(dungeonGrid, i, j, DUNGEON.SLOPE);
					}
				}
			}
			
			// check right and top
			if (in_bounds(dungeonGrid, i + 1, j) && in_bounds(dungeonGrid, i, j - 1)) {
				if (ds_grid_get(dungeonGrid, i + 1, j) == DUNGEON.WALL && ds_grid_get(dungeonGrid, i, j - 1) == DUNGEON.WALL) {
					if (chance(slopeChance)) {
						ds_grid_set(dungeonGrid, i, j, DUNGEON.SLOPE);
					}
				}
			}
		}
	}
}
*/
#endregion

#region Make Sure Room Border Is Surrounded By Walls

for (var i = 0; i < gw; i++) {
	ds_grid_set(dungeonGrid, i, 0, DUNGEON.WALL);
	ds_grid_set(dungeonGrid, i, gh - 1, DUNGEON.WALL);
}
for (var j = 0; j < gh; j++) {
	ds_grid_set(dungeonGrid, 0, j, DUNGEON.WALL);
	ds_grid_set(dungeonGrid, gw - 1, j, DUNGEON.WALL);
}

#endregion

#region Remove Isolated Pieces

for (var i = 0; i < gw; i++) {
	for (var j = 0; j < gh; j++) {
		if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.WALL) {
			var leftEmpty	= false;
			var rightEmpty	= false;
			var upEmpty		= false;
			var downEmpty	= false;
				
			// Check Left
			if (in_bounds(dungeonGrid, i - 1, j)) {
				if (ds_grid_get(dungeonGrid, i - 1, j) != DUNGEON.WALL)
					leftEmpty = true;
				else
					continue;
			}
			else
				continue;
					
			// Check Right
			if (in_bounds(dungeonGrid, i + 1, j)) {
				if (ds_grid_get(dungeonGrid, i + 1, j) != DUNGEON.WALL)
					rightEmpty = true;
				else
					continue;
			}
			else
				continue;
					
			// Check Up 
			if (in_bounds(dungeonGrid, i, j - 1)) {
				if (ds_grid_get(dungeonGrid, i, j - 1) != DUNGEON.WALL)
					upEmpty = true;
				else
					continue;
			}
			else
				continue;
					
			// Check Down
			if (in_bounds(dungeonGrid, i, j + 1))
				if (ds_grid_get(dungeonGrid, i, j + 1) != DUNGEON.WALL)
					downEmpty = true;
					
			// Delete
			if (leftEmpty + rightEmpty + upEmpty + downEmpty >= 3)
				ds_grid_set(dungeonGrid, i, j, DUNGEON.NONE);
		}
	}
}

#endregion

#region Convert All Tunnel Pieces to None
for (var i = 0; i < gw; i++) {
	for (var j = 0; j < gh; j++) {
		if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.TUNNEL)
			ds_grid_set(dungeonGrid, i, j, DUNGEON.NONE);
	}
}
#endregion

#region Create Wall Instances
for (var i = 0; i < gw; i++) {
	for (var j = 0; j < gh; j++) {
		if (ds_grid_get(dungeonGrid, i, j) == 0) {
			instance_create_layer(global.unitW * i, global.unitW * j, "Instances", oWall);	
		}
	}
}
#endregion

#region Set Player Spawn Point
var playerCorner = choose("topLeft", "topRight", "bottomRight", "bottomLeft");
var placed = false;

// Look For Room of at Least 3x3	
switch (playerCorner) {
	#region TopLeft
	case "topLeft":
		for (var j = 0; j < gh; j++) {
			for (var i = 0; i < gw; i++) {
				if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.NONE) {
					// Look 2 Right & 2 Down
					var empty = true;
					for (var k = i; k < i + 3; k++) {
						for (var l = j; l < j + 3; l++) {
							if (in_bounds(dungeonGrid, k, l)) {
								if (ds_grid_get(dungeonGrid, k, l) != DUNGEON.NONE) {
									empty = false;
									break;
								}
							}
							else {
								empty = false;
								break;
							}
						}
					}
					// Found Empty, Place Spawn Point
					if (empty) {
						ds_grid_set(dungeonGrid, i + 1, j + 1, DUNGEON.PLAYER_SPAWN);
						placed = true;
						break;
					}
				}
				if (placed)
					break;
			}
			if (placed)
				break;
		}
		break;
	#endregion
	
	#region TopRight
	case "topRight":
		for (var j = 0; j < gh; j++) {
			for (var i = gw - 1; i >= 0; i--) {
				if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.NONE) {
					// Look 2 Right & 2 Down
					var empty = true;
					for (var k = i; k > i - 3; k--) {
						for (var l = j; l < j + 3; l++) {
							if (in_bounds(dungeonGrid, k, l)) {
								if (ds_grid_get(dungeonGrid, k, l) != DUNGEON.NONE) {
									empty = false;
									break;
								}
							}
							else {
								empty = false;
								break;
							}
						}
					}
					// Found Empty, Place Spawn Point
					if (empty) {
						ds_grid_set(dungeonGrid, i - 1, j + 1, DUNGEON.PLAYER_SPAWN);
						placed = true;
						break;
					}
				}
				if (placed)
					break;
			}
			if (placed)
				break;
		}
		break;
	#endregion
	
	#region BottomRight
	case "bottomRight":
		for (var j = gh - 1; j >= 0; j--) {
			for (var i = gw - 1; i >= 0; i--) {
				if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.NONE) {
					// Look 2 Right & 2 Down
					var empty = true;
					for (var k = i; k > i - 3; k--) {
						for (var l = j; l > j - 3; l--) {
							if (in_bounds(dungeonGrid, k, l)) {
								if (ds_grid_get(dungeonGrid, k, l) != DUNGEON.NONE) {
									empty = false;
									break;
								}
							}
							else {
								empty = false;
								break;
							}
						}
					}
					// Found Empty, Place Spawn Point
					if (empty) {
						ds_grid_set(dungeonGrid, i - 1, j - 1, DUNGEON.PLAYER_SPAWN);
						placed = true;
						break;
					}
				}
				if (placed)
					break;
			}
			if (placed)
				break;
		}
		break;
	#endregion
	
	#region BottomLeft
	case "bottomLeft":
		for (var j = gh - 1; j >= 0; j--) {
			for (var i = 0; i < gw; i++) {
				if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.NONE) {
					// Look 2 Right & 2 Down
					var empty = true;
					for (var k = i; k < i + 3; k++) {
						for (var l = j; l > j - 3; l--) {
							if (in_bounds(dungeonGrid, k, l)) {
								if (ds_grid_get(dungeonGrid, k, l) != DUNGEON.NONE) {
									empty = false;
									break;
								}
							}
							else {
								empty = false;
								break;
							}
						}
					}
					// Found Empty, Place Spawn Point
					if (empty) {
						ds_grid_set(dungeonGrid, i + 1, j - 1, DUNGEON.PLAYER_SPAWN);
						placed = true;
						break;
					}
				}
				if (placed)
					break;
			}
			if (placed)
				break;
		}
		break;
	#endregion
	
}
#endregion

#region Set Exit Point
if (playerCorner == "topLeft" || playerCorner == "topRight")
	var exitCorner = choose("bottomLeft", "bottomRight");
else
	var exitCorner = choose("topLeft", "topRight");
var placed = false;

// Look For Room of at Least 3x3	
switch (exitCorner) {
	#region TopLeft
	case "topLeft":
		for (var j = 0; j < gh; j++) {
			for (var i = 0; i < gw; i++) {
				if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.NONE) {
					// Look 2 Right & 2 Down
					var empty = true;
					for (var k = i; k < i + 3; k++) {
						for (var l = j; l < j + 3; l++) {
							if (in_bounds(dungeonGrid, k, l)) {
								if (ds_grid_get(dungeonGrid, k, l) != DUNGEON.NONE) {
									empty = false;
									break;
								}
							}
							else {
								empty = false;
								break;
							}
						}
					}
					// Found Empty, Place Spawn Point
					if (empty) {
						ds_grid_set(dungeonGrid, i + 1, j + 1, DUNGEON.EXIT);
						placed = true;
						break;
					}
				}
				if (placed)
					break;
			}
			if (placed)
				break;
		}
		break;
	#endregion
	
	#region TopRight
	case "topRight":
		for (var j = 0; j < gh; j++) {
			for (var i = gw - 1; i >= 0; i--) {
				if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.NONE) {
					// Look 2 Right & 2 Down
					var empty = true;
					for (var k = i; k > i - 3; k--) {
						for (var l = j; l < j + 3; l++) {
							if (in_bounds(dungeonGrid, k, l)) {
								if (ds_grid_get(dungeonGrid, k, l) != DUNGEON.NONE) {
									empty = false;
									break;
								}
							}
							else {
								empty = false;
								break;
							}
						}
					}
					// Found Empty, Place Spawn Point
					if (empty) {
						ds_grid_set(dungeonGrid, i - 1, j + 1, DUNGEON.EXIT);
						placed = true;
						break;
					}
				}
				if (placed)
					break;
			}
			if (placed)
				break;
		}
		break;
	#endregion
	
	#region BottomRight
	case "bottomRight":
		for (var j = gh - 1; j >= 0; j--) {
			for (var i = gw - 1; i >= 0; i--) {
				if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.NONE) {
					// Look 2 Right & 2 Down
					var empty = true;
					for (var k = i; k > i - 3; k--) {
						for (var l = j; l > j - 3; l--) {
							if (in_bounds(dungeonGrid, k, l)) {
								if (ds_grid_get(dungeonGrid, k, l) != DUNGEON.NONE) {
									empty = false;
									break;
								}
							}
							else {
								empty = false;
								break;
							}
						}
					}
					// Found Empty, Place Spawn Point
					if (empty) {
						ds_grid_set(dungeonGrid, i - 1, j - 1, DUNGEON.EXIT);
						placed = true;
						break;
					}
				}
				if (placed)
					break;
			}
			if (placed)
				break;
		}
		break;
	#endregion
	
	#region BottomLeft
	case "bottomLeft":
		for (var j = gh - 1; j >= 0; j--) {
			for (var i = 0; i < gw; i++) {
				if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.NONE) {
					// Look 2 Right & 2 Down
					var empty = true;
					for (var k = i; k < i + 3; k++) {
						for (var l = j; l > j - 3; l--) {
							if (in_bounds(dungeonGrid, k, l)) {
								if (ds_grid_get(dungeonGrid, k, l) != DUNGEON.NONE) {
									empty = false;
									break;
								}
							}
							else {
								empty = false;
								break;
							}
						}
					}
					// Found Empty, Place Spawn Point
					if (empty) {
						ds_grid_set(dungeonGrid, i + 1, j - 1, DUNGEON.EXIT);
						placed = true;
						break;
					}
				}
				if (placed)
					break;
			}
			if (placed)
				break;
		}
		break;
	#endregion
	
}
#endregion

#region Place Enemies 
var numberOfEnemiesPlaced = 0;
for (var i = 0; i < gw; i++) {
	for (var j = 0; j < gh; j++) {
		if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.NONE) {
			if (chance(1) && numberOfEnemiesPlaced < numberOfEnemies) {
				ds_grid_set(dungeonGrid, i, j, DUNGEON.ENEMY_SPAWN);
				numberOfEnemiesPlaced++;
			}
		}
	}
}

#endregion

#region Place Treasure Chests
// Place in Niche Spot
for (var i = 0; i < gw; i++) {
	for (var j = 0; j < gh; j++) {
		if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.NONE) {
			var leftEmpty	= false;
			var rightEmpty	= false;
			var upEmpty		= false;
			var downEmpty	= false;
			// Check Four Sides
			if (in_bounds(dungeonGrid, i - 1, j))
				if (ds_grid_get(dungeonGrid, i - 1, j) != DUNGEON.WALL)
					leftEmpty = true;
				
			if (in_bounds(dungeonGrid, i + 1, j))
				if (ds_grid_get(dungeonGrid, i + 1, j) != DUNGEON.WALL)
					rightEmpty = true;
		
			if (in_bounds(dungeonGrid, i, j + 1))
				if (ds_grid_get(dungeonGrid, i, j + 1) != DUNGEON.WALL)
					downEmpty = true;
			
			if (in_bounds(dungeonGrid, i, j - 1))
				if (ds_grid_get(dungeonGrid, i, j - 1) != DUNGEON.WALL)
					upEmpty = true;
				
			if ((leftEmpty + rightEmpty + upEmpty + downEmpty) == 1)
				ds_grid_set(dungeonGrid, i, j, DUNGEON.CHEST);
		}
	}
}
#endregion

createdDungeon = true;