/// @returns Winning Character Instance

#region Exit Conditions
if (player == noone) return;
if (!instance_exists(player)) return;
if (enemy == noone) return;
if (!instance_exists(enemy))return;
if (player.deck == noone) return;
if (!ds_exists(player.deck, ds_type_list)) return;
if (ds_list_size(player.deck) == 0) return;
if (enemy.deck == noone) return;
if (!ds_exists(enemy.deck, ds_type_list)) return;
if (ds_list_size(enemy.deck) == 0) return;
if (player.newCards == noone) return;
if (!ds_exists(player.newCards, ds_type_list)) return;
if (enemy.newCards == noone) return;
if (!ds_exists(enemy.newCards, ds_type_list)) return;
#endregion

var _pCard = deck_pop_card(player);
var _eCard = deck_pop_card(enemy);
playerCard = _pCard; // store card in oGame as last flipped player card
enemyCard  = _eCard; // store card in oGame as last flipped enemy card

var _pCardValue = global.cardData[_pCard, PROP.VALUE];
var _eCardValue = global.cardData[_eCard, PROP.VALUE];

var _compare = cards_compare(_pCard, _eCard);

// Player Wins
if (_compare == ">") {
	show_debug_message("flip: player wins: " + string(_pCardValue) + " > " + string(_eCardValue));
	ds_list_add(player.newCards, _eCard);
	ds_list_add(player.newCards, _pCard);
	
	if (state == GAME_STATE.WAR)
		show_debug_message("flip: player collects 2 cards.");
	return player;
}
// Enemy Wins
else if (_compare == "<") {
	show_debug_message("flip: player loses: " + string(_pCardValue) + " < " + string(_eCardValue));
	ds_list_add(enemy.newCards, _eCard);
	ds_list_add(enemy.newCards, _pCard);
	
	if (state == GAME_STATE.WAR)
		show_debug_message("flip: enemy collects 2 cards.");
	return enemy;
}
// Tie
else if (_compare == "=") {
	show_debug_message("flip: tie: " + string(_pCardValue) + " = " + string(_eCardValue));
	
	// Game Tie
	if (ds_list_size(player.deck) == 0 && ds_list_size(player.newCards) == 0 && ds_list_size(enemy.deck) == 0 && ds_list_size(enemy.newCards) == 0) {
		show_message("GAME TIE");
	}
	// Not End Game Tie, Just Normal War
	else {
		if (ds_list_size(player.deck) == 0 && ds_list_size(player.newCards) == 0) {
			show_debug_message("flip: war on last card. player loses.");
			ds_list_add(enemy.newCards, _eCard);
			ds_list_add(enemy.newCards, _pCard);
			player.state = CHAR_STATE.DEAD;
		}
		else if (ds_list_size(enemy.deck) == 0 && ds_list_size(enemy.newCards) == 0) {
			show_debug_message("flip: war on last card. enemy loses.");
			ds_list_add(player.newCards, _eCard);
			ds_list_add(player.newCards, _pCard);
			enemy.state = CHAR_STATE.DEAD;
		}
		else
			state = GAME_STATE.WAR;
	}
}