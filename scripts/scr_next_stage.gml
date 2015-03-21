scr_bgm_stop();

global.nowStage++;
global.bestStage = global.nowStage; 

global.pause = false;

scr_save_game();

room_goto(rom_prepare);
