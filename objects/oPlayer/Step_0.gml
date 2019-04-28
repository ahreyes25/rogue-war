event_inherited();

switch(state) {
	case CHAR_STATE.IDLE:
		#region Movement
		if (keyboard_check(ord("A"))) {
			nextMove = move_left;
			if (alarm[0] == -1)
				alarm[0] = 1;
		}	
		if (keyboard_check(ord("D"))) { 
			nextMove = move_right;
			if (alarm[0] == -1)
				alarm[0] = 1;
		}
		if (keyboard_check(ord("W"))) {
			nextMove = move_up;
			if (alarm[0] == -1)
				alarm[0] = 1;
		}
		if (keyboard_check(ord("S"))) {
			nextMove = move_down;
			if (alarm[0] == -1)
				alarm[0] = 1;
		}
		if (
			!keyboard_check(ord("A")) &&
			!keyboard_check(ord("D")) &&
			!keyboard_check(ord("W")) &&
			!keyboard_check(ord("S"))
		)
		{
			nextMove = noone;
			alarm[0] = -1;
		}
		#endregion		
		break;
}