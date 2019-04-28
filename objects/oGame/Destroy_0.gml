if (ds_exists(battleLog, ds_type_list))
	ds_list_destroy(battleLog);
if (ds_exists(dungeonGrid, ds_type_grid))
	ds_grid_destroy(dungeonGrid);
if (ds_exists(enemies, ds_type_queue))
	ds_queue_destroy(enemies);