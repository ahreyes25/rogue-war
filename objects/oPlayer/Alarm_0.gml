/// @description Interval Movement

if (state != CHAR_STATE.IDLE) {
	nextMove = noone;
	alarm[0] = -1;
	return;
}

if (nextMove != noone) {
	script_execute(nextMove);
	player_action();
}
alarm[0] = moveInterval;
