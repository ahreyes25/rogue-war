event_inherited();

image_scale = 8;
sprite_index = oGame.player.sprite_index;
image_xscale = image_scale;
image_yscale = image_scale;

targetX = global.unitW * 1.5;
x = -global.unitW * (image_xscale);
y = view_hport[view_current] - (global.unitW * (image_yscale + 1));
startX = x;