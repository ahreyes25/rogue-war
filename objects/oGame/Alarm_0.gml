/// @description Card Flip
if (state != GAME_STATE.BATTLE)
	return;
	
// Dont Draw Card If We Are Celebrating A War Victory
if (alarm[2] > 0 || alarm[1] > 0)
	alarm[0] = 1;
else {
	flip_card();
	alarm[0] = global.cardFlipTime;
}