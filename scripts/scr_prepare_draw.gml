scr_draw_text(global.deviceW*0.5-100, global.deviceH*0.3,"STAGE "+string(global.nowStage),c_white,fnt_nokia32,3,c_black);

var ww = string_length(tipStr) * 10.5;
scr_draw_text(global.deviceW*0.5-ww, global.deviceH*0.75,tipStr,c_white,font16,0,c_black);
