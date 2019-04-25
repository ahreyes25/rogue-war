/// @description War Card Flip

if (state != GAME_STATE.WAR)
	return;
	
if (alarm[0] > 0 || alarm[2] > 0) 
	alarm[1] = 1;
else {
	war_pile();
	alarm[1] = global.warCardFlipTime;
}