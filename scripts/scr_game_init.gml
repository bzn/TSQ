global.isADMOB = true;
randomize();

if(global.isADMOB)
{
    global.bannerID = "ca-app-pub-9356057031668248/4812756414";
    GoogleMobileAds_Init(global.bannerID);
    
    global.bannerID2 = "ca-app-pub-9356057031668248/2917220814";
    GoogleMobileAds_Init(global.bannerID2);
}

global.isDebug = false;

// delect language
switch (os_get_language())
{
    case "zh":
        if(os_get_region() == "HK" || os_get_region() == "TW")
            global.language = "cht";
        else
            global.language = "chs";
    break;
    case "ja":
    case "en":
    default:
        global.language = "en";
    break;
}

//show_message_async("language = "+global.language);

//global.language = "chs";

//show_message_async(global.language);
//show_message_async("os_get_region="+os_get_region());
    
// delect device
switch (os_device)
{
    case device_ios_ipad: 
        show_debug_message("ipad device");
        global.deviceW = 768;
        global.deviceH = 1024;
    break;
    case device_ios_ipad_retina: 
        show_debug_message("ipad R device");
        global.deviceW = 768;
        global.deviceH = 1024;
    break;
    case device_ios_iphone: 
        show_debug_message("iphone3 device");
        //window_set_size(320,480);
    break;
    case device_ios_iphone_retina: 
        //window_set_size(640,960);
        show_debug_message("iphone4 device");
        global.deviceW = 640;
        global.deviceH = 960;
    break;
    case device_ios_iphone5: 
        //window_set_size(640,1136);
        show_debug_message("iphone5 device");
        global.deviceW = 640;
        global.deviceH = 1136;
    break;
    case device_ios_unknown: 
        show_debug_message("unknow device");
        global.deviceW = window_get_width();
        global.deviceH = window_get_height();
    break;
    default:
        show_debug_message("default device");
        global.deviceW = window_get_width();
        global.deviceH = window_get_height();
    break;
}       

room_set_width(rom_title, global.deviceW);
room_set_height(rom_title, global.deviceH);

room_set_width(rom_select, global.deviceW);
room_set_height(rom_select, global.deviceH);

room_set_width(rom_prepare, global.deviceW);
room_set_height(rom_prepare, global.deviceH);

scr_load_csv_data();
randomize();
texture_set_interpolation(false);
device_mouse_dbclick_enable(false);

global.pause = false;

// game init
global.isRating = false;
global.addHP = 0;
global.addNPC = 0;

global.pTrainX = 0;
global.pTrainY = 0;

global.isPlaying = false;
global.isContinueMenu = false;
global.tempCoin = 0;

global.isTryGamecenter = false;

global.isTeached = false;

global.nowSound = -1;

audio_channel_num(64);
global.maxChannel = 64;
global.nowChannel = 1;  // (channel 0 for bgm)
global.nowBgm = -1;
// unlocked hero
for(var i=0;i<MAX_HERO;i++)
{
    global.heroUnlock[i] = false;
}

scr_load_game();

// close game when playing
if(global.isPlaying && global.isContinueMenu)
{
    show_debug_message("should not happen");
}

if(global.isPlaying && !global.isContinueMenu)
{
    show_debug_message("user closed game when playing");
    room_goto(rom_prepare);
}

if(!global.isPlaying)
{
    if(global.isContinueMenu)
    {
        show_debug_message("user close game when continue menu");
        scr_load_temp();
        global.isContinueMenu = false;
        scr_save_game();
    }
    else
    {
        show_debug_message("user close game safely");
    }
    
    // reset hero in map
    scr_clear_hero_in_map();    
    // reset hero in team
    scr_clear_hero_in_team();
    
    // once game record
    global.gameKill = 0;
    global.gameCoin = 0;
    global.gameScore = 0;
    global.continueCounter = 0;
    
    var cnt = scr_get_team_member_count();
    show_debug_message("member="+string(cnt));
    room_goto(rom_title);    
}