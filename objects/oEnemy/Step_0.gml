event_inherited();

nextAction = choose(move_right, move_left, move_up, move_down);

if (executeNextAction) {
	script_execute(nextAction);
	executeNextAction = false;
}