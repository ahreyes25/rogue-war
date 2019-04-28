if (!instance_exists(oGame)) return;
if (!instance_exists(oPlayer)) return;

// Set Player
if (oGame.player == noone)
	oGame.player = oPlayer;
	
// Set Enemy
if (oGame.enemy == noone) 
	if (ds_exists(oGame.enemies, ds_type_queue))
		if (ds_queue_size(oGame.enemies) > 0)
			oGame.enemy = ds_queue_dequeue(oGame.enemies);
		else
			return;

// Clear Old Battle Log
if (oGame.battleLog != noone)
	if (ds_exists(oGame.battleLog, ds_type_list))
		ds_list_clear(oGame.battleLog);
		
oGame.player.state = CHAR_STATE.BATTLE;		

// Transition
oGame.state = GAME_STATE.BATTLE_INTRO;
battle_log("*************** B A T T L E ***************");