enum CHAR_STATE {
	IDLE, BATTLE, WAR, DEAD	
}
state = CHAR_STATE.BATTLE;
enemy = noone;

// Decks
deck	 = ds_list_create();
newCards = ds_list_create();
warCards = ds_list_create();