if (ds_exists(deck, ds_type_list))
	ds_list_destroy(deck);
if (ds_exists(newCards, ds_type_list))
	ds_list_destroy(newCards);
if (ds_exists(warCards, ds_type_list))
	ds_list_destroy(warCards);
	
// Clear Battle Characters
if (object_index == oEnemy) {
	// Remove Battle Enemy
	if (instance_exists(oBattleEnemy))
		oBattleEnemy.state = BATTLE_CHAR_STATE.EASE_OUT;
	// Clear Game Enemy
	if (instance_exists(oGame))
		oGame.enemy = noone;
	// Check for Next Enemy in List
	if (ds_exists(oGame.enemies, ds_type_queue)) {
		if (ds_queue_size(oGame.enemies) == 0)
			oPlayer.state = CHAR_STATE.IDLE;
		else {
			start_battle();	
			instance_create_layer(0, 0, "Battle", oBattleEnemy);
		}
	}
}