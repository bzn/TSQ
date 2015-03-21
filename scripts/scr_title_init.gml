ads_disable(0);

sleepTimer = 80;
isTouch = false;
title = instance_create(global.deviceW/2, global.deviceH*0.4, obj_title_text);
sword = instance_create(global.deviceW/2+5, -100, obj_title_sword);
touch = instance_create(global.deviceW/2, global.deviceH*0.7, obj_touch_screen);
shine = instance_create(0, 0, obj_shine);
shine.image_xscale = global.deviceW / sprite_get_width(shine.image_index);
shine.image_yscale = global.deviceH / sprite_get_height(shine.image_index);

audio_stop_all();
audio_channel_num(200);
