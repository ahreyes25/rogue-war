if (ds_exists(allCards, ds_type_list))
	ds_list_destroy(allCards);
if (ds_exists(battleLog, ds_type_list))
	ds_list_destroy(battleLog);
if (ds_exists(dungeonGrid, ds_type_grid))
	ds_grid_destroy(dungeonGrid);