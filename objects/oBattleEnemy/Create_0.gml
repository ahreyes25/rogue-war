event_inherited();

image_scale = 6;
sprite_index = oGame.enemy.sprite_index;
image_xscale = image_scale;
image_yscale = image_scale;

targetX = view_wport[view_current] - (global.unitW * image_xscale * 1.5);
x = view_wport[view_current] + (global.unitW * (image_yscale + 1));
y = global.unitW * image_xscale * 0.5;
startX = x;