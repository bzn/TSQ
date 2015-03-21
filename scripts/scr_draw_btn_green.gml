draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, -1, 1);

if(global.language == "chs")
    scr_draw_text(x-32, y-20, "确 认", c_white, font20, 1, c_black);
else
    scr_draw_text(x-32, y-20, "確 認", c_white, font20, 1, c_black);

