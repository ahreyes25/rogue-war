/// @param playeInst

var _player = argument[0];

if (!instance_exists(_player)) return;
if (_player.deck == noone) return;
if (!ds_exists(_player.deck, ds_type_list)) return;
if (ds_list_size(_player.deck) == 0) return;
	
// Pop Card & Add to Player Cards List
var _card = ds_list_find_value(_player.deck, 0);
ds_list_delete(_player.deck, 0);
return _card;