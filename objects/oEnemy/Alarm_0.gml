/// @description Attacking

if (!instance_exists(oGame)) return;

if (!attacked) {
	attacked = true;
	
	if (ds_exists(oGame.enemies, ds_type_queue)) {
		ds_queue_enqueue(oGame.enemies, id);
		
		if (ds_queue_size(oGame.enemies) == 1) {
			start_battle();
		}
	}
}