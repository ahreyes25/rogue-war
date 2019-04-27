x = room_width / 2;
y = room_height / 2;

battleLog = ds_list_create();

if (!instance_exists(oGame)) { instance_destroy(); return; }
if (oGame.battleLog == noone) { instance_destroy(); return; }
if (!ds_exists(oGame.battleLog, ds_type_list)) { instance_destroy(); return; }
if (ds_list_size(oGame.battleLog) == 0) { instance_destroy(); return; }

// Get Battle Log From oGame
ds_list_copy(battleLog, oGame.battleLog);

logLength	= ds_list_size(battleLog);
scrollIndex = 0;
logIndex	= noone;