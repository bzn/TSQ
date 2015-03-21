// reset hero in map
scr_clear_hero_in_map();

// reset hero in team
scr_clear_hero_in_team();

scr_add_hero_in_map(global.nowHeroID);
scr_add_hero_in_team(global.nowHeroID);

// once game record
global.gameKill = 0;
global.gameCoin = 0;
global.gameScore = 0;
global.continueCounter = 0;

global.nowStage = 1;

room_goto(rom_prepare);
