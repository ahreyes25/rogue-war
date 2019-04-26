/// @param log_string

var _logMessage = argument0;

if (battleLog == noone) return;
if (!ds_exists(battleLog, ds_type_list)) return;
if (!is_string(_logMessage)) return;

show_debug_message(_logMessage);
ds_list_add(battleLog, _logMessage);