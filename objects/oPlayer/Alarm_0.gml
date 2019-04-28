/// @description Move Fast
if (nextMove != noone) {
	script_execute(nextMove);
	player_action();
}
alarm[0] = moveInterval;