#region Exit Conditions
if (player == noone) return;
if (!instance_exists(player)) return;
if (enemy == noone) return;
if (!instance_exists(enemy))return;
if (player.deck == noone) return;
if (!ds_exists(player.deck, ds_type_list)) return;
if (enemy.deck == noone) return;
if (!ds_exists(enemy.deck, ds_type_list)) return;
if (player.newCards == noone) return;
if (!ds_exists(player.newCards, ds_type_list)) return;
if (enemy.newCards == noone) return;
if (!ds_exists(enemy.newCards, ds_type_list)) return;
if (player.warCards == noone) return;
if (!ds_exists(player.warCards, ds_type_list)) return;
if (enemy.warCards == noone) return;
if (!ds_exists(enemy.warCards, ds_type_list)) return;
#endregion

// Now we have our war cards list and one card left in the deck, at least
if (warCardsCollected >= warCardsToCollect) {
	
	var winner = flip_card();
	if (winner != noone) {
		if (winner == player) {
			battle_log("war: player wins war!");
		
			// Collect All War Cards
			for (var i = 0; i < ds_list_size(player.warCards); i++)
				ds_list_add(player.newCards, ds_list_find_value(player.warCards, i));
			for (var i = 0; i < ds_list_size(enemy.warCards); i++)
				ds_list_add(player.newCards, ds_list_find_value(enemy.warCards, i));
			
			//battle_log("war: player collects " + string(ds_list_size(player.warCards) + ds_list_size(enemy.warCards)) + " cards.");
			battle_log("*************************************");
		
			// Clear War lists
			ds_list_clear(player.warCards);
			ds_list_clear(enemy.warCards);
		
			alarm[2] = global.warVictoryTime;
		}
		else if (winner == enemy) {
			battle_log("war: enemy wins war!");
		
			// Collect All War Cards
			for (var i = 0; i < ds_list_size(enemy.warCards); i++)
				ds_list_add(enemy.newCards, ds_list_find_value(enemy.warCards, i));
			for (var i = 0; i < ds_list_size(player.warCards); i++)
				ds_list_add(enemy.newCards, ds_list_find_value(player.warCards, i));	
			
			//battle_log("war: enemy collects " + string(ds_list_size(player.warCards) + ds_list_size(enemy.warCards)) + " cards.");
			battle_log("*************************************");
		
			// Clear War lists
			ds_list_clear(player.warCards);
			ds_list_clear(enemy.warCards);
	
			alarm[2] = global.warVictoryTime;
		}	
	}
	else {
		state = GAME_STATE.WAR;
	}
	warCardsCollected = 0;
}