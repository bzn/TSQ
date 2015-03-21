//show_debug_message("GG");

// renew record       
if(global.bestKill < global.gameKill)
    global.bestKill = global.gameKill;
    
if(global.bestCoin < global.gameCoin)
    global.bestCoin = global.gameCoin;    
    
if(global.bestScore < global.bestScore)
    global.bestScore = global.bestScore;        

// gameover
global.nowStage = 1;
global.gameKill = 0;
global.gameCoin = 0;
global.gameScore = 0;
global.continueCounter = 0;
global.isZenmetsu = false;
global.isPlaying = false;
global.isContinueMenu = false;
scr_save_game();
room_goto(rom_select);
