global.pause = false;

// continue do not lost coins
var kills = global.gameKill;
var coins = global.gameCoin;
var scores = global.gameScore;
var dball = global.nowDBall;
// load data   
scr_load_game();
global.isContinueMenu = false;

global.gameKill = kills;
global.gameCoin = coins;
global.gameScore = scores;
global.nowDBall = dball;

var continueCost = scr_get_continue_cost();
if(global.nowDBall >= continueCost)
    global.nowDBall -= continueCost;
global.continueCounter++;
scr_save_game();

room_goto(rom_prepare);
