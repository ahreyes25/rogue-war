enum CHAR_STATE {
	IDLE, BATTLE, WAR, DEAD	
}
state = CHAR_STATE.IDLE;
enemy = noone;

// Decks
deck	 = ds_list_create();
newCards = ds_list_create();
warCards = ds_list_create();

nextX = x;
nextY = y;

if (object_index != oPlayer) {
	for (var i = 0; i < 26; i++) {
		ds_list_add(deck, irandom_range(0, 51));
	}
}
else {
	for (var i = 0; i < 10000; i++) {
		ds_list_add(deck, irandom_range(0, 51));
	}
}
ds_list_shuffle(deck);