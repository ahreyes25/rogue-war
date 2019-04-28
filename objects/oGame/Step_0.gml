switch(state) {
	#region Create Dungeon
	case GAME_STATE.CREATE_DUNGEON:
		#region Create Dungeon
		if (!startedCreatingDungeon) {
			create_dungeon();
			startedCreatingDungeon = true;
		}
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
		if (instance_exists(oPlayer))
			instance_create_layer(oPlayer.x, oPlayer.y, "Controllers", oCamera);
		else
			create_dungeon();
		#endregion
		
		if (createdDungeon)
			state = GAME_STATE.IDLE;
		break;
	#endregion
		
	case GAME_STATE.BATTLE_INTRO:
		if (!instance_exists(oBattlePlayer))
			instance_create_layer(0, 0, "Battle", oBattlePlayer);
		if (!instance_exists(oBattleEnemy))
			instance_create_layer(0, 0, "Battle", oBattleEnemy);
		
		if (oBattleEnemy.x == oBattleEnemy.targetX) 
			if (oBattlePlayer.x == oBattlePlayer.targetX) 
				state = GAME_STATE.BATTLE;
		break;
	
	case GAME_STATE.BATTLE:
		battle();
		check_battle_end();
		break;
	
	case GAME_STATE.BATTLE_END:
		
		break;
	
	case GAME_STATE.WAR:
		war();
		check_war_end();
		break;
		
	case GAME_STATE.LOG:
		break;
}