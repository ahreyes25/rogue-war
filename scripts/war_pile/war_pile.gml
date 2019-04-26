#region Exit Conditions
if (player == noone) return;
if (!instance_exists(player)) return;
if (enemy == noone) return;
if (!instance_exists(enemy))return;
if (player.deck == noone) return;
if (!ds_exists(player.deck, ds_type_list)) return;
if (enemy.deck == noone) return;
if (!ds_exists(enemy.deck, ds_type_list)) return;
if (player.newCards == noone) return;
if (!ds_exists(player.newCards, ds_type_list)) return;
if (enemy.newCards == noone) return;
if (!ds_exists(enemy.newCards, ds_type_list)) return;
if (player.warCards == noone) return;
if (!ds_exists(player.warCards, ds_type_list)) return;
if (enemy.warCards == noone) return;
if (!ds_exists(enemy.warCards, ds_type_list)) return;
#endregion

// Set Iter Cards Aside Into Pile, But Guarantee One Left In Deck
var _pCard = noone;
var _eCard = noone;
	
// PLAYER
// Draw Card Normally if Deck Larger Than 1
if (ds_list_size(player.deck) > 1) {
	_pCard = deck_pop_card(player);
}
// Marge New Cards into Deck if Exactly 1
else if (ds_list_size(player.deck) == 1) {
	if (ds_list_size(player.newCards) > 0) {
		var _lastCard = deck_pop_card(player);
		ds_list_clear(player.deck);
		ds_list_copy(player.deck, player.newCards);
		ds_list_clear(player.newCards);
		ds_list_add(player.deck, _lastCard);
		ds_list_shuffle(player.deck);
		_pCard = deck_pop_card(player);
	}
}
// Last Card in the Deck Triggered War
else {
	// Marge Decks if We Can
	if (ds_list_size(player.newCards) > 0) {
		ds_list_copy(player.deck, player.newCards);
		ds_list_clear(player.newCards);
		ds_list_shuffle(player.deck);
		_pCard = deck_pop_card(player);
	}
}
	
// ENEMY
// Draw Card Normally if Deck Larger Than 1
if (ds_list_size(enemy.deck) > 1) {
	_eCard = deck_pop_card(enemy);
}
// Marge New Cards into Deck if Exactly 1
else if (ds_list_size(enemy.deck) == 1) {
	if (ds_list_size(enemy.newCards) > 0) {
		var _lastCard = deck_pop_card(enemy);
		ds_list_clear(enemy.deck);
		ds_list_copy(enemy.deck, enemy.newCards);
		ds_list_clear(enemy.newCards);
		ds_list_add(enemy.deck, _lastCard);
		ds_list_shuffle(enemy.deck);
		_eCard = deck_pop_card(enemy);
	}
}
// Last Card in the Deck Triggered War
else {
	// Marge Decks if We Can
	if (ds_list_size(enemy.newCards) > 0) {
		ds_list_copy(enemy.deck, enemy.newCards);
		ds_list_clear(enemy.newCards);
		ds_list_shuffle(enemy.deck);
		_eCard = deck_pop_card(enemy);
	}
}

// Successfully Drew Both Cards
if (_pCard != noone && _eCard != noone) {
	ds_list_add(player.warCards, _pCard);
	ds_list_add(enemy.warCards, _eCard);
	//battle_log("war: adding card " + string(_pCard) + " to player pile.");
	//battle_log("war: adding card " + string(_eCard) + " to enemy pile.");
}
// Did Not Successfully Draw Both Cards, Add Drawn Card Back
else {
	if (_pCard != noone) {
		ds_list_add(player.deck, _pCard);
		ds_list_shuffle(player.deck);
	}
	if (_eCard != noone) {
		ds_list_add(enemy.deck, _eCard);
		ds_list_shuffle(enemy.deck);
	}
}
warCardsCollected++;