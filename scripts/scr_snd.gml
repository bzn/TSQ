//return 0;
var snd = argument0;

audio_stop_sound(snd);
global.nowSound = audio_play_sound(snd, global.nowChannel, false);
global.nowChannel++;
if(global.nowChannel >= global.maxChannel)
    global.nowChannel = 1;

/*
if(global.nowSound != -1)
    audio_stop_sound(global.nowSound);
global.nowSound = audio_play_sound(snd, 1, false);
*/
