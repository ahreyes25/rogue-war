switch(state) {
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
		break;
		#endregion
		
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
}