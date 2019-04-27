/// @description Battle Log
if (battleLog == noone) return;
if (!ds_exists(battleLog, ds_type_list)) return;
if (state == GAME_STATE.BATTLE || state == GAME_STATE.WAR) return;

if (!instance_exists(oBattleLog))
	instance_create_layer(mouse_x, mouse_y, "Controllers", oBattleLog);
else
	with(oBattleLog)
		instance_destroy();