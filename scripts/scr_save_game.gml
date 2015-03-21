// save data
ini_open("savedata.ini");

// record data
ini_write_real("recorddata", "best_kill", global.bestKill);
ini_write_real("recorddata", "best_coin", global.bestCoin);
ini_write_real("recorddata", "best_score", global.bestScore);
// once game record
ini_write_real("recorddata", "game_kill", global.gameKill);
ini_write_real("recorddata", "game_coin", global.gameCoin);
ini_write_real("recorddata", "game_score", global.gameScore);
// total record
ini_write_real("recorddata", "total_kill", global.totalKill);
ini_write_real("recorddata", "total_coin", global.totalCoin);
ini_write_real("recorddata", "total_score", global.totalScore);
ini_write_real("recorddata", "total_dball", global.totalDBall);
// now own
ini_write_real("recorddata", "now_coin", global.nowCoin);
ini_write_real("recorddata", "now_dball", global.nowDBall);
// continue counter
ini_write_real("recorddata", "continue_counter", global.continueCounter);

//ini_write_real("userdata", "total_coin", global.totalCoin);
//ini_write_real("userdata", "total_kill", global.totalKill);

// load user data
ini_write_real("userdata", "play_counter", global.playCounter);
ini_write_real("userdata", "is_rating", global.isRating);
ini_write_real("userdata", "is_teached", global.isTeached);
ini_write_real("userdata", "best_stage", global.bestStage);
ini_write_real("userdata", "hero1", global.heroUnlock[0]);
ini_write_real("userdata", "hero2", global.heroUnlock[1]);
ini_write_real("userdata", "hero3", global.heroUnlock[2]);
ini_write_real("userdata", "hero4", global.heroUnlock[3]);
ini_write_real("userdata", "hero5", global.heroUnlock[4]);
ini_write_real("userdata", "hero6", global.heroUnlock[5]);
ini_write_real("userdata", "hero7", global.heroUnlock[6]);
ini_write_real("userdata", "hero8", global.heroUnlock[7]);
ini_write_real("userdata", "hero9", global.heroUnlock[8]);
ini_write_real("userdata", "hero10", global.heroUnlock[9]);
ini_write_real("userdata", "hero11", global.heroUnlock[10]);
ini_write_real("userdata", "hero12", global.heroUnlock[11]);
ini_write_real("userdata", "hero13", global.heroUnlock[12]);
ini_write_real("userdata", "hero14", global.heroUnlock[13]);
ini_write_real("userdata", "hero15", global.heroUnlock[14]);
ini_write_real("userdata", "hero16", global.heroUnlock[15]);

// load stage data
ini_write_real("stagedata", "is_buff_bubble", global.buffBubble);
ini_write_real("stagedata", "is_buff_hp", global.buffHp);
ini_write_real("stagedata", "is_buff_power", global.buffPower);
ini_write_real("stagedata", "is_buff_run", global.buffRun);
ini_write_real("stagedata", "is_playing", global.isPlaying);
ini_write_real("stagedata", "is_continue_menu", global.isContinueMenu);
ini_write_real("stagedata", "now_stage", global.nowStage);
ini_write_real("stagedata", "now_hero_id1", global.heroInTeam[0]);
ini_write_real("stagedata", "now_hero_id2", global.heroInTeam[1]);
ini_write_real("stagedata", "now_hero_id3", global.heroInTeam[2]);
ini_write_real("stagedata", "now_hero_id4", global.heroInTeam[3]);
ini_write_real("stagedata", "now_hero_id5", global.heroInTeam[4]);
ini_write_real("stagedata", "now_hero_id6", global.heroInTeam[5]);
ini_write_real("stagedata", "now_hero_id7", global.heroInTeam[6]);
ini_write_real("stagedata", "now_hero_id8", global.heroInTeam[7]);
ini_write_real("stagedata", "now_hero_id9", global.heroInTeam[8]);
ini_write_real("stagedata", "now_hero_id10", global.heroInTeam[9]);
ini_write_real("stagedata", "now_hero_id11", global.heroInTeam[10]);
ini_write_real("stagedata", "now_hero_id12", global.heroInTeam[11]);
ini_write_real("stagedata", "now_hero_id13", global.heroInTeam[12]);
ini_write_real("stagedata", "now_hero_id14", global.heroInTeam[13]);
ini_write_real("stagedata", "now_hero_id15", global.heroInTeam[14]);
ini_write_real("stagedata", "now_hero_id16", global.heroInTeam[15]);

// save hero level
ini_write_real("userdata", "hero_lv1", global.heroLevel[0]);
ini_write_real("userdata", "hero_lv2", global.heroLevel[1]);
ini_write_real("userdata", "hero_lv3", global.heroLevel[2]);
ini_write_real("userdata", "hero_lv4", global.heroLevel[3]);
ini_write_real("userdata", "hero_lv5", global.heroLevel[4]);
ini_write_real("userdata", "hero_lv6", global.heroLevel[5]);
ini_write_real("userdata", "hero_lv7", global.heroLevel[6]);
ini_write_real("userdata", "hero_lv8", global.heroLevel[7]);
ini_write_real("userdata", "hero_lv9", global.heroLevel[8]);
ini_write_real("userdata", "hero_lv10", global.heroLevel[9]);
ini_write_real("userdata", "hero_lv11", global.heroLevel[10]);
ini_write_real("userdata", "hero_lv12", global.heroLevel[11]);
ini_write_real("userdata", "hero_lv13", global.heroLevel[12]);
ini_write_real("userdata", "hero_lv14", global.heroLevel[13]);
ini_write_real("userdata", "hero_lv15", global.heroLevel[14]);
ini_write_real("userdata", "hero_lv16", global.heroLevel[15]);

// hero exp
ini_write_real("userdata", "hero_exp1", global.heroExp[0]);
ini_write_real("userdata", "hero_exp2", global.heroExp[1]);
ini_write_real("userdata", "hero_exp3", global.heroExp[2]);
ini_write_real("userdata", "hero_exp4", global.heroExp[3]);
ini_write_real("userdata", "hero_exp5", global.heroExp[4]);
ini_write_real("userdata", "hero_exp6", global.heroExp[5]);
ini_write_real("userdata", "hero_exp7", global.heroExp[6]);
ini_write_real("userdata", "hero_exp8", global.heroExp[7]);
ini_write_real("userdata", "hero_exp9", global.heroExp[8]);
ini_write_real("userdata", "hero_exp10", global.heroExp[9]);
ini_write_real("userdata", "hero_exp11", global.heroExp[10]);
ini_write_real("userdata", "hero_exp12", global.heroExp[11]);
ini_write_real("userdata", "hero_exp13", global.heroExp[12]);
ini_write_real("userdata", "hero_exp14", global.heroExp[13]);
ini_write_real("userdata", "hero_exp15", global.heroExp[14]);
ini_write_real("userdata", "hero_exp16", global.heroExp[15]);

// hero total kill
ini_write_real("userdata", "hero_kill1", global.heroKill[0]);
ini_write_real("userdata", "hero_kill2", global.heroKill[1]);
ini_write_real("userdata", "hero_kill3", global.heroKill[2]);
ini_write_real("userdata", "hero_kill4", global.heroKill[3]);
ini_write_real("userdata", "hero_kill5", global.heroKill[4]);
ini_write_real("userdata", "hero_kill6", global.heroKill[5]);
ini_write_real("userdata", "hero_kill7", global.heroKill[6]);
ini_write_real("userdata", "hero_kill8", global.heroKill[7]);
ini_write_real("userdata", "hero_kill9", global.heroKill[8]);
ini_write_real("userdata", "hero_kill10", global.heroKill[9]);
ini_write_real("userdata", "hero_kill11", global.heroKill[10]);
ini_write_real("userdata", "hero_kill12", global.heroKill[11]);
ini_write_real("userdata", "hero_kill13", global.heroKill[12]);
ini_write_real("userdata", "hero_kill14", global.heroKill[13]);
ini_write_real("userdata", "hero_kill15", global.heroKill[14]);
ini_write_real("userdata", "hero_kill16", global.heroKill[15]);

ini_close(); //Closes the current open ini file. Be sure to do this!

scr_gamecenter_update();

