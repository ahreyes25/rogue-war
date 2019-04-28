draw_self();

draw_text(x, y, "deck: " + string(ds_list_size(deck)));
draw_text(x, y + 15, "new: " + string(ds_list_size(newCards)));
draw_text(x, y + 30, "total: " + string(ds_list_size(newCards) + ds_list_size(deck)));