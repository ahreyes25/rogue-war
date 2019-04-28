/* Draw Dungeon Grid -- DEBUG 
if (ds_exists(dungeonGrid, ds_type_grid)) {
	for (var i = 0; i < gw; i++) {
		for (var j = 0; j < gh; j++) {
			
			draw_set_color(c_white)
			if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.PLAYER_SPAWN)
				draw_set_color(c_red);
			else if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.EXIT)
				draw_set_color(c_blue);
			else
				draw_set_color(c_white);
				
			draw_text(10 + (i * 10), 10 + (j * 10), ds_grid_get(dungeonGrid, i, j));	
			
			draw_set_color(c_white);
		}
	}
}