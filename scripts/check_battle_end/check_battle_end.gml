#region Exit Conditions
if (player == noone) return;
if (!instance_exists(player)) return;
if (enemy == noone) return;
if (!instance_exists(enemy))return;
if (player.deck == noone) return;
if (enemy.deck == noone) return;
if (!ds_exists(player.deck, ds_type_list)) return;
if (!ds_exists(enemy.deck, ds_type_list)) return;
if (player.newCards == noone) return;
if (!ds_exists(player.newCards, ds_type_list)) return;
if (enemy.newCards == noone) return;
if (!ds_exists(enemy.newCards, ds_type_list)) return;
#endregion

// Player Has No Cards Left
if (ds_list_size(player.deck) == 0) {
	if (ds_list_size(player.newCards) == 0) {
		state = GAME_STATE.IDLE;
		player.state = CHAR_STATE.DEAD;
		battle_log("Enemy wins battle!");
		return;
	}
	// Has No Deck, But Has Gained Cards
	else {
		ds_list_copy(player.deck, player.newCards);
		ds_list_clear(player.newCards);
		ds_list_shuffle(player.deck);
		//battle_log("player deck reset w/ " + string(ds_list_size(player.deck)) + " cards.");
	}
}

// Enemy Has No Cards Left
if (ds_list_size(enemy.deck) == 0) {
	if (ds_list_size(enemy.newCards) == 0) {
		state = GAME_STATE.IDLE;
		enemy.state = CHAR_STATE.DEAD;
		battle_log("Player wins battle!");
		return;
	}
	// Has No Deck, But Has Gained Cards
	else {
		ds_list_copy(enemy.deck, enemy.newCards);
		ds_list_clear(enemy.newCards);
		ds_list_shuffle(enemy.deck);
		//battle_log("enemy deck reset w/ " + string(ds_list_size(enemy.deck)) + " cards.");
	}
}