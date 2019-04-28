enum BATTLE_CHAR_STATE {
	EASE_IN, EASE_OUT	
}

if (!instance_exists(oGame)) {
	instance_destroy();
	return;
}

state = BATTLE_CHAR_STATE.EASE_IN;