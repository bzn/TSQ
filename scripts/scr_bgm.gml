//return 0;
var bgm = argument0;
var isLoop = argument1;
if(global.nowBgm != -1)
    audio_stop_sound(global.nowBgm);
global.nowBgm = bgm;
audio_play_sound(bgm, 0, isLoop);
