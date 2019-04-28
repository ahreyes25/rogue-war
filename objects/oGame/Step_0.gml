switch(state) {
	case GAME_STATE.CREATE_DUNGEON:
		#region Create Dungeon
		if (!startedCreatingDungeon) {
			create_dungeon();
			startedCreatingDungeon = true;
		}
		if (createdDungeon)
			state = GAME_STATE.LOAD_DATA;
		#endregion
		
		#region Spawn Player, Enemies, Exit, Chest
		for (var i = 0; i < gw; i++) {
			for (var j = 0; j < gh; j++) {
				if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.PLAYER_SPAWN)
					instance_create_layer(i * global.unitW, j * global.unitW, "Instances", oPlayer);
				if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.EXIT)
					instance_create_layer(i * global.unitW, j * global.unitW, "Instances", oExit);	
				if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.ENEMY_SPAWN)
					instance_create_layer(i * global.unitW, j * global.unitW, "Instances", oEnemy);	
				if (ds_grid_get(dungeonGrid, i, j) == DUNGEON.CHEST)
					instance_create_layer(i * global.unitW, j * global.unitW, "Instances", oChest);	
			}
		}
		#endregion
		
		#region Spawn Camera
		instance_create_layer(oPlayer.x, oPlayer.y, "Controllers", oCamera);
		#endregion
		break;
		
	case GAME_STATE.LOAD_DATA:
		#region Load Card Data Into Player Decks
		if (instance_exists(player) && instance_exists(enemy)) {
			// Split Up All Cards 
			allCards = ds_list_create();
			// Replace with dynamic array size that gets all possible cards
			for (var i = 0; i < 52; i++) {
				ds_list_add(allCards, i);
			}
			ds_list_shuffle(allCards);

			for (var i = 0; i < ds_list_size(allCards); i++) {
				if (i mod 2 == 0)
					ds_list_add(player.deck, i);
				else
					ds_list_add(enemy.deck, i);
			}
			ds_list_shuffle(player.deck);
			ds_list_shuffle(enemy.deck);
			
			state = GAME_STATE.IDLE;
		}
		#endregion
		break;
		
	case GAME_STATE.IDLE:
		break;
	
	case GAME_STATE.BATTLE:
		battle();
		check_battle_end();
		break;
	
	case GAME_STATE.WAR:
		war();
		check_war_end();
		break;
		
	case GAME_STATE.LOG:
		break;
}