// Clear Old Battle Log
if (battleLog != noone)
	if (ds_exists(battleLog, ds_type_list))
		ds_list_clear(battleLog);
		
state = GAME_STATE.BATTLE;
battle_log("*************** B A T T L E ***************");