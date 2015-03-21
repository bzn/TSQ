scr_gamecenter_connect();

// reset hero in map
scr_clear_hero_in_map();


scr_bgm_stop();


var cnt = scr_get_team_member_count();
for(var i=0;i<MAX_HERO;i++)
{
    if(global.heroInTeam[i] != -1)
    {
        var heroID = global.heroInTeam[i];
        var heroLV = scr_get_hero_lv(heroID);
        var heroX;
        var heroY;
        if(cnt <= 10)
        {   
            heroX = global.deviceW*0.5+(cnt-1)*30-i*60;
            heroY = global.deviceH*0.5;
        }
        else if(cnt <= 13)
        {
            heroX = global.deviceW*0.5+(cnt-1)*24-i*48;
            heroY = global.deviceH*0.5;
        }
        else
        {
            heroX = global.deviceW*0.5+(cnt-1)*20-i*40;
            heroY = global.deviceH*0.5;
        }
        
        //var heroObj = scr_get_hero_obj(heroID);
        
        var hero = instance_create(heroX, heroY, obj_hero_right);
//        hero.sprite_index = heroObj.sprite_index;
        switch(heroID)
        {
        case 1: switch(heroLV) { case 1: hero.sprite_index = spr_ch001_right_0; break; case 2: hero.sprite_index = spr_ch001_right_1; break; case 3: hero.sprite_index = spr_ch001_right_2; break; case 4: hero.sprite_index = spr_ch001_right_3; break; } break;
        case 2: switch(heroLV) { case 1: hero.sprite_index = spr_ch002_right_0; break; case 2: hero.sprite_index = spr_ch002_right_1; break; case 3: hero.sprite_index = spr_ch002_right_2; break; case 4: hero.sprite_index = spr_ch002_right_3; break; } break;
        case 3: switch(heroLV) { case 1: hero.sprite_index = spr_ch003_right_0; break; case 2: hero.sprite_index = spr_ch003_right_1; break; case 3: hero.sprite_index = spr_ch003_right_2; break; case 4: hero.sprite_index = spr_ch003_right_3; break; } break;
        case 4: switch(heroLV) { case 1: hero.sprite_index = spr_ch004_right_0; break; case 2: hero.sprite_index = spr_ch004_right_1; break; case 3: hero.sprite_index = spr_ch004_right_2; break; case 4: hero.sprite_index = spr_ch004_right_3; break; } break;
        case 5: switch(heroLV) { case 1: hero.sprite_index = spr_ch005_right_0; break; case 2: hero.sprite_index = spr_ch005_right_1; break; case 3: hero.sprite_index = spr_ch005_right_2; break; case 4: hero.sprite_index = spr_ch005_right_3; break; } break;
        case 6: switch(heroLV) { case 1: hero.sprite_index = spr_ch006_right_0; break; case 2: hero.sprite_index = spr_ch006_right_1; break; case 3: hero.sprite_index = spr_ch006_right_2; break; case 4: hero.sprite_index = spr_ch006_right_3; break; } break;
        case 7: switch(heroLV) { case 1: hero.sprite_index = spr_ch007_right_0; break; case 2: hero.sprite_index = spr_ch007_right_1; break; case 3: hero.sprite_index = spr_ch007_right_2; break; case 4: hero.sprite_index = spr_ch007_right_3; break; } break;
        case 8: switch(heroLV) { case 1: hero.sprite_index = spr_ch008_right_0; break; case 2: hero.sprite_index = spr_ch008_right_1; break; case 3: hero.sprite_index = spr_ch008_right_2; break; case 4: hero.sprite_index = spr_ch008_right_3; break; } break;
        case 9: switch(heroLV) { case 1: hero.sprite_index = spr_ch009_right_0; break; case 2: hero.sprite_index = spr_ch009_right_1; break; case 3: hero.sprite_index = spr_ch009_right_2; break; case 4: hero.sprite_index = spr_ch009_right_3; break; } break;
        case 10: switch(heroLV) { case 1: hero.sprite_index = spr_ch010_right_0; break; case 2: hero.sprite_index = spr_ch010_right_1; break; case 3: hero.sprite_index = spr_ch010_right_2; break; case 4: hero.sprite_index = spr_ch010_right_3; break; } break;
        case 11: switch(heroLV) { case 1: hero.sprite_index = spr_ch011_right_0; break; case 2: hero.sprite_index = spr_ch011_right_1; break; case 3: hero.sprite_index = spr_ch011_right_2; break; case 4: hero.sprite_index = spr_ch011_right_3; break; } break;
        case 12: switch(heroLV) { case 1: hero.sprite_index = spr_ch012_right_0; break; case 2: hero.sprite_index = spr_ch012_right_1; break; case 3: hero.sprite_index = spr_ch012_right_2; break; case 4: hero.sprite_index = spr_ch012_right_3; break; } break;
        case 13: switch(heroLV) { case 1: hero.sprite_index = spr_ch013_right_0; break; case 2: hero.sprite_index = spr_ch013_right_1; break; case 3: hero.sprite_index = spr_ch013_right_2; break; case 4: hero.sprite_index = spr_ch013_right_3; break; } break;
        case 14: switch(heroLV) { case 1: hero.sprite_index = spr_ch014_right_0; break; case 2: hero.sprite_index = spr_ch014_right_1; break; case 3: hero.sprite_index = spr_ch014_right_2; break; case 4: hero.sprite_index = spr_ch014_right_3; break; } break;
        case 15: switch(heroLV) { case 1: hero.sprite_index = spr_ch015_right_0; break; case 2: hero.sprite_index = spr_ch015_right_1; break; case 3: hero.sprite_index = spr_ch015_right_2; break; case 4: hero.sprite_index = spr_ch015_right_3; break; } break;
        case 16: switch(heroLV) { case 1: hero.sprite_index = spr_ch016_right_0; break; case 2: hero.sprite_index = spr_ch016_right_1; break; case 3: hero.sprite_index = spr_ch016_right_2; break; case 4: hero.sprite_index = spr_ch016_right_3; break; } break;
        }
        
        if(cnt <= 10)
        {
            hero.image_xscale = 1;
            hero.image_yscale = 1;
        }
        else if(cnt <= 13)
        {
            hero.image_xscale = 4/5;
            hero.image_yscale = 4/5;
        }
        else
        {
            hero.image_xscale = 2/3;
            hero.image_yscale = 2/3;
        }        
    }
}

uiShop = instance_create(global.deviceW*0.5, global.deviceH*0.5, obj_ui_shop);
//uiShop.isActive = true;

uiGoShop = instance_create(global.deviceW*0.5, global.deviceH*0.5, obj_ui_goshop);
//uiGoShop.isActive = true;

global.loading = instance_create(99999,99999, obj_loading);
global.loading.depth = -999999999;

global.shine = instance_create(0, 0, obj_shine);
global.shine.depth = -9999999;

// buff btn
btnBubble = instance_create(global.deviceW*0.5-210, global.deviceH*0.5+140, obj_buffbtn_bubble);
btnBubble.mouseOn = false;
btnHp = instance_create(global.deviceW*0.5-70, global.deviceH*0.5+140, obj_buffbtn_hp);
btnBubble.mouseOn = false;
btnPower = instance_create(global.deviceW*0.5+70, global.deviceH*0.5+140, obj_buffbtn_power);
btnBubble.mouseOn = false;
btnRun = instance_create(global.deviceW*0.5+210, global.deviceH*0.5+140, obj_buffbtn_run);
btnBubble.mouseOn = false;

global.msgbox = instance_create(global.deviceW*0.5, global.deviceH*0.5, obj_msg_box);
global.msgbox.depth = -999999;

objBtnPlay = instance_create(global.deviceW*0.5, global.deviceH*0.5+410, obj_btn_play);

global.isZenmetsu = false;
global.isPlaying = true;
global.isContinueMenu = false;

scr_save_game();

global.dekiHpPlus = 0;
global.dekiAtkPlus = 0;

// Stage Data
var stageDataID = global.nowStage;
// stage loop!
if(global.nowStage > MAX_STAGE)
{
    stageDataID = (global.nowStage - MAX_STAGE) % 5 + 15;
    
    global.dekiHpPlus = round(global.nowStage / 5) * 20;
    global.dekiAtkPlus = round(global.nowStage / 5) * 10;
}

stageData = global.stageData[stageDataID - 1];
global.stageRoomID     = real(ds_list_get(stageData,1));
global.stageMaxDeki     = real(ds_list_get(stageData,2));
global.stageSpawnTimer  = real(ds_list_get(stageData,3));
global.stagePrice  = real(ds_list_get(stageData,4));


// deki kakuritsu box
for(var i=0;i<MAX_DEKI;i++)
{
    global.dekiKakuritsu[i] = real(ds_list_get(stageData,5+i));
    //show_debug_message(string(global.dekiKakuritsu[i]));
}

// deki kakuritsu total
global.dekiTotalK = 0;
for(var i=0;i<MAX_DEKI;i++)
{
    global.dekiTotalK += global.dekiKakuritsu[i];
}

//show_debug_message("====totalK===="+string(global.dekiTotalK));

// pre random coin
for(var i=0;i<15;i++)
{
    for(var j=0;j<15;j++)
    {
        if(scr_is_kakusei(14))
            seed = 3;
        else
            seed = 4;
        global.coinArray[i,j] = irandom(seed);
    }
}


if(global.language == "chs")
    tipStr = scr_get_tips_chs();    
else
    tipStr = scr_get_tips();
