event_inherited();

nextAction = choose(move_right, move_left, move_up, move_down);

if (executeNextAction && !attacked) {
	script_execute(nextAction);
	executeNextAction = false;
}

// Check for War
if (instance_exists(oPlayer)) {
	if (
		place_meeting(x - 1, y, oPlayer) ||
		place_meeting(x + 1, y, oPlayer) ||
		place_meeting(x, y - 1, oPlayer) ||
		place_meeting(x, y + 1, oPlayer)
	)
	{
		if (!attacked)
			if (alarm[0] == -1)
				alarm[0] = 1;
	}
}

// Snap to Player Edge
if (instance_exists(oGame)) {
	if (oGame.state == GAME_STATE.BATTLE || oGame.state == GAME_STATE.BATTLE_INTRO || oGame.state == GAME_STATE.WAR) {
		if (oGame.enemy != noone) {
			if (id == oGame.enemy.id) {
				if (oGame.player != noone) {
					if (instance_exists(oGame.player)) {
						if (x > oGame.player.x + global.unitW)
							x = oGame.player.x + global.unitW;
						if (x < oGame.player.x - global.unitW)
							x = oGame.player.x - global.unitW;
						if (y < oGame.player.y - global.unitW)
							y = oGame.player.y - global.unitW;
						if (y > oGame.player.y + global.unitW)
							y = oGame.player.y + global.unitW;
					}
				}
			}
		}
	}
}