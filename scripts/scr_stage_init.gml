scr_gamecenter_connect();

if(global.isADMOB)
{
    GoogleMobileAds_RemoveBanner();
    GoogleMobileAds_LoadInterstitial();
}
//global.heroBulletList = ds_list_create();
//global.dekiBulletList = ds_list_create();

// Special Addon Effect
global.spHeart      = -1;       // (+25% HP)
global.atkPowerUp   = -1;       // (+50% attack power)
global.atkSpeedUp   = -1;       // (+25% attack speed)(timer)
global.spMoveFast   = -1;       // (+25% Move Speed)
global.spBubble     = -1;       // (Bubble)
global.spMagnet     = -1;       // (Magnet Coin)(timer)
global.spMudeki     = -1;       // (MUDEKI)

if(global.buffBubble)
    global.spBubble = 3;
if(global.buffHp)
    global.spHeart = 1;
if(global.buffPower)
    global.atkPowerUp = 1;
if(global.buffRun)
    global.spMoveFast = 1;

//global.bombXList = ds_list_create();
//global.bombYList = ds_list_create();
//global.bombRangeList = ds_list_create();
//global.bombPowerList = ds_list_create();

global.continueMsgTimer = -1;

bubble = instance_create(global.pTrainX, global.pTrainY, obj_eff_bubble);
//buffLight  = instance_create(global.pTrainX, global.pTrainY, obj_eff_light);
buffRoll  = instance_create(global.pTrainX, global.pTrainY, obj_eff_roll);

global.loading = instance_create(99999,99999, obj_loading);
global.loading.depth = -999999999;

global.uiShop = instance_create(global.deviceW*0.5, global.deviceH*0.5, obj_ui_shop);

// UI BUFF
topHeart = instance_create(0, 0, obj_ico_heart);
topHeart.depth = -999999;
topPowerUp = instance_create(0, 0, obj_ico_power);
topPowerUp.depth = -999999;
topSpeedUp = instance_create(0, 0, obj_ico_speed);
topSpeedUp.depth = -999999;
topRun = instance_create(0, 0, obj_ico_run);
topRun.depth = -999999;
topBubble = instance_create(0, 0, obj_ico_bubble);
topBubble.depth = -999999;
topMagnet = instance_create(0, 0, obj_ico_magnet);
topMagnet.depth = -999999;

// UI Counter
uiPause = instance_create(20, global.deviceH-100, obj_ui_pause);
uiPause.depth = -999999;

uiCoin = instance_create(0, 0, obj_ui_game_coin);
uiCoin.depth = -999999;

uiSkull = instance_create(global.deviceW - 160, 0, obj_ui_skull);
uiSkull.depth = -999999;

uiHero = instance_create(global.deviceW - 160, 60, obj_ui_hero);
uiHero.depth = -999999;

uiPBar = instance_create(global.deviceW * 0.5, 30, obj_ui_progress_bar);
uiPBar.depth = -999999;

uiDBall = instance_create(0, 0, obj_ui_game_dball);
uiDBall.depth = -999999;

spawnTimer = 0;

// Stage Record
global.stageDekiKilled = 0;
global.stageDekiCounter = 0;

// finish timer
finishTimer = -1;

// player train
global.playerTrain = instance_create(0, 0, obj_train_player);

// deki train
global.dekiTrainList = ds_list_create();

global.trainSize = 0;

global.unlockHeroCount = 0;
for(var i=0;i<MAX_HERO;i++)
{
    if(global.heroUnlock[i])
    {            
        global.unlockHeroCount++;
    }
}

global.stageMsgbox = instance_create(99999,99999, obj_stage_msgbox);
global.stageMsgbox.depth = -999999;

pauseBox = instance_create(0, 0, obj_ui_pause_box);
pauseBox.depth = -9999999;

var bgmID = (global.nowStage-1) % 5 + 1;
switch(bgmID)
{
    case 1: scr_bgm(snd_stage_1, true);   break;
    case 2: scr_bgm(snd_stage_2, true);   break;
    case 3: scr_bgm(snd_stage_3, true);   break;
    case 4: scr_bgm(snd_stage_4, true);   break;
    case 5: scr_bgm(snd_stage_5, true);   break;
//    case 6: scr_bgm(snd_stage_6, true);   break;
}

/*
objStageText = instance_create(0, 0, obj_stagetext);
objStageText.stageID = 1;
*/

view_wview[0] = global.deviceW;
view_hview[0] = global.deviceH;
view_wport[0] = global.deviceW;
view_hport[0] = global.deviceH;
view_hborder[0] = global.deviceW*0.5;
view_vborder[0] = global.deviceH*0.5;


