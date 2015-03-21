// load data
ini_open("savedata.ini");

// record data
global.bestKill = ini_read_real("recorddata", "best_kill", 0);
global.bestCoin = ini_read_real("recorddata", "best_coin", 0);
global.bestScore = ini_read_real("recorddata", "best_score", 0);
// once game record
global.gameKill = ini_read_real("recorddata", "game_kill", 0);
global.gameCoin = ini_read_real("recorddata", "game_coin", 0);
global.gameScore = ini_read_real("recorddata", "game_score", 0);
// total record
global.totalKill = ini_read_real("recorddata", "total_kill", 0);
global.totalCoin = ini_read_real("recorddata", "total_coin", 0);
global.totalScore = ini_read_real("recorddata", "total_score", 0);
global.totalDBall = ini_read_real("recorddata", "total_dball", 0);
// now own
global.nowCoin = ini_read_real("recorddata", "now_coin", 0);
global.nowDBall = ini_read_real("recorddata", "now_dball", 10);
// continue counter
global.continueCounter = ini_read_real("recorddata", "continue_counter", 0);

// load user data
global.playCounter = ini_read_real("userdata", "play_counter", -1);
global.isRating = ini_read_real("userdata", "is_rating", -1);
global.isTeached = ini_read_real("userdata", "is_teached", -1);
global.bestStage = ini_read_real("userdata", "best_stage", 0);
global.heroUnlock[0] = ini_read_real("userdata", "hero1", 1 );
global.heroUnlock[1] = ini_read_real("userdata", "hero2", 1 );
global.heroUnlock[2] = ini_read_real("userdata", "hero3", 1 );
global.heroUnlock[3] = ini_read_real("userdata", "hero4", 0 );
global.heroUnlock[4] = ini_read_real("userdata", "hero5", 0 );
global.heroUnlock[5] = ini_read_real("userdata", "hero6", 0 );
global.heroUnlock[6] = ini_read_real("userdata", "hero7", 0 );
global.heroUnlock[7] = ini_read_real("userdata", "hero8", 0 );
global.heroUnlock[8] = ini_read_real("userdata", "hero9", 0 );
global.heroUnlock[9] = ini_read_real("userdata", "hero10", 0 );
global.heroUnlock[10] = ini_read_real("userdata", "hero11", 0 );
global.heroUnlock[11] = ini_read_real("userdata", "hero12", 0 );
global.heroUnlock[12] = ini_read_real("userdata", "hero13", 0 );
global.heroUnlock[13] = ini_read_real("userdata", "hero14", 0 );
global.heroUnlock[14] = ini_read_real("userdata", "hero15", 0 );
global.heroUnlock[15] = ini_read_real("userdata", "hero16", 0 );

// load stage data
global.buffBubble = ini_read_real("stagedata", "is_buff_bubble", -1);
global.buffHp = ini_read_real("stagedata", "is_buff_hp", -1);
global.buffPower = ini_read_real("stagedata", "is_buff_power", -1);
global.buffRun = ini_read_real("stagedata", "is_buff_run", -1);
global.isPlaying = ini_read_real("stagedata", "is_playing", 0);
global.isContinueMenu = ini_read_real("stagedata", "is_continue_menu", 0);
global.nowStage = ini_read_real("stagedata", "now_stage", 1);
global.nowHeroID = ini_read_real("stagedata", "now_hero_id1", 1);
global.heroInTeam[0] = ini_read_real("stagedata", "now_hero_id1", -1);
global.heroInTeam[1] = ini_read_real("stagedata", "now_hero_id2", -1);
global.heroInTeam[2] = ini_read_real("stagedata", "now_hero_id3", -1);
global.heroInTeam[3] = ini_read_real("stagedata", "now_hero_id4", -1);
global.heroInTeam[4] = ini_read_real("stagedata", "now_hero_id5", -1);
global.heroInTeam[5] = ini_read_real("stagedata", "now_hero_id6", -1);
global.heroInTeam[6] = ini_read_real("stagedata", "now_hero_id7", -1);
global.heroInTeam[7] = ini_read_real("stagedata", "now_hero_id8", -1);
global.heroInTeam[8] = ini_read_real("stagedata", "now_hero_id9", -1);
global.heroInTeam[9] = ini_read_real("stagedata", "now_hero_id10", -1);
global.heroInTeam[10] = ini_read_real("stagedata", "now_hero_id11", -1);
global.heroInTeam[11] = ini_read_real("stagedata", "now_hero_id12", -1);
global.heroInTeam[12] = ini_read_real("stagedata", "now_hero_id13", -1);
global.heroInTeam[13] = ini_read_real("stagedata", "now_hero_id14", -1);
global.heroInTeam[14] = ini_read_real("stagedata", "now_hero_id15", -1);
global.heroInTeam[15] = ini_read_real("stagedata", "now_hero_id16", -1);

// load hero level
global.heroLevel[0] = ini_read_real("userdata", "hero_lv1", 1);
global.heroLevel[1] = ini_read_real("userdata", "hero_lv2", 1);
global.heroLevel[2] = ini_read_real("userdata", "hero_lv3", 1);
global.heroLevel[3] = ini_read_real("userdata", "hero_lv4", 1);
global.heroLevel[4] = ini_read_real("userdata", "hero_lv5", 1);
global.heroLevel[5] = ini_read_real("userdata", "hero_lv6", 1);
global.heroLevel[6] = ini_read_real("userdata", "hero_lv7", 1);
global.heroLevel[7] = ini_read_real("userdata", "hero_lv8", 1);
global.heroLevel[8] = ini_read_real("userdata", "hero_lv9", 1);
global.heroLevel[9] = ini_read_real("userdata", "hero_lv10", 1);
global.heroLevel[10] = ini_read_real("userdata", "hero_lv11", 1);
global.heroLevel[11] = ini_read_real("userdata", "hero_lv12", 1);
global.heroLevel[12] = ini_read_real("userdata", "hero_lv13", 1);
global.heroLevel[13] = ini_read_real("userdata", "hero_lv14", 1);
global.heroLevel[14] = ini_read_real("userdata", "hero_lv15", 1);
global.heroLevel[15] = ini_read_real("userdata", "hero_lv16", 1);

// hero exp
global.heroExp[0] = ini_read_real("userdata", "hero_exp1", 0);
global.heroExp[1] = ini_read_real("userdata", "hero_exp2", 0);
global.heroExp[2] = ini_read_real("userdata", "hero_exp3", 0);
global.heroExp[3] = ini_read_real("userdata", "hero_exp4", 0);
global.heroExp[4] = ini_read_real("userdata", "hero_exp5", 0);
global.heroExp[5] = ini_read_real("userdata", "hero_exp6", 0);
global.heroExp[6] = ini_read_real("userdata", "hero_exp7", 0);
global.heroExp[7] = ini_read_real("userdata", "hero_exp8", 0);
global.heroExp[8] = ini_read_real("userdata", "hero_exp9", 0);
global.heroExp[9] = ini_read_real("userdata", "hero_exp10", 0);
global.heroExp[10] = ini_read_real("userdata", "hero_exp11", 0);
global.heroExp[11] = ini_read_real("userdata", "hero_exp12", 0);
global.heroExp[12] = ini_read_real("userdata", "hero_exp13", 0);
global.heroExp[13] = ini_read_real("userdata", "hero_exp14", 0);
global.heroExp[14] = ini_read_real("userdata", "hero_exp15", 0);
global.heroExp[15] = ini_read_real("userdata", "hero_exp16", 0);

// hero total kill
global.heroKill[0] = ini_read_real("userdata", "hero_kill1", 0);
global.heroKill[1] = ini_read_real("userdata", "hero_kill2", 0);
global.heroKill[2] = ini_read_real("userdata", "hero_kill3", 0);
global.heroKill[3] = ini_read_real("userdata", "hero_kill4", 0);
global.heroKill[4] = ini_read_real("userdata", "hero_kill5", 0);
global.heroKill[5] = ini_read_real("userdata", "hero_kill6", 0);
global.heroKill[6] = ini_read_real("userdata", "hero_kill7", 0);
global.heroKill[7] = ini_read_real("userdata", "hero_kill8", 0);
global.heroKill[8] = ini_read_real("userdata", "hero_kill9", 0);
global.heroKill[9] = ini_read_real("userdata", "hero_kill10", 0);
global.heroKill[10] = ini_read_real("userdata", "hero_kill11", 0);
global.heroKill[11] = ini_read_real("userdata", "hero_kill12", 0);
global.heroKill[12] = ini_read_real("userdata", "hero_kill13", 0);
global.heroKill[13] = ini_read_real("userdata", "hero_kill14", 0);
global.heroKill[14] = ini_read_real("userdata", "hero_kill15", 0);
global.heroKill[15] = ini_read_real("userdata", "hero_kill16", 0);

ini_close(); //Closes the current open ini file. Be sure to do this!
