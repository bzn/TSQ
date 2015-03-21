if(finishTimer>0)
{
    finishTimer--;
}
else if(finishTimer==0)
{
    //scr_delete_all_bullet();
    
    finishTimer = -1;
    
//    if(global.bestStage < global.nowStage)
    var unlockHeroID = global.nowStage + 3;
    if(!scr_is_hero_unlock(unlockHeroID) && unlockHeroID <= MAX_HERO)
    {
        global.stageMsgbox.isActive = true;
        global.stageMsgbox.type = MSG_PRICE;    
        if(global.language == "chs")
        {
            global.stageMsgbox.msgTitle = "       新 武 将";
            global.stageMsgbox.msgStr[0] = "";
            global.stageMsgbox.msgStr[1] = "";
            global.stageMsgbox.msgStr[2] = "";
            global.stageMsgbox.msgStr[3] = "          解锁了新武将  "+scr_get_hero_name(unlockHeroID);
        }
        else
        {
            global.stageMsgbox.msgTitle = "       新 武 將";
            global.stageMsgbox.msgStr[0] = "";
            global.stageMsgbox.msgStr[1] = "";
            global.stageMsgbox.msgStr[2] = "";
            global.stageMsgbox.msgStr[3] = "          解鎖了新武將  "+scr_get_hero_name(unlockHeroID);
        }
        
        global.pause = true;
        
        scr_unlock_hero_free(unlockHeroID);
        scr_add_hero(unlockHeroID);
    }
    else
    {
        scr_next_stage();
    }
}

if(global.isZenmetsu)    
{    
    if(global.isPlaying)
    {       
        global.isPlaying = false;
        global.isContinueMenu = true;

        // save data
        ini_open("savedata.ini");
        ini_write_real("stagedata", "is_playing", global.isPlaying);
        ini_write_real("stagedata", "is_continue_menu", global.isContinueMenu);        
        ini_close();
        
        scr_save_temp(); 
    }
    
    if(global.continueMsgTimer > 0)
    {
        global.continueMsgTimer--;
    }
//    else if(!global.stageMsgbox.isActive && mouse_check_button_released(mb_left))
    else if(global.continueMsgTimer == 0)
    {
        //scr_delete_all_bullet();
        
        var adSpMove = 0;                
        if(os_device == device_ios_ipad || 
           os_device == device_ios_ipad_retina || 
           os_device == device_ios_ipad_retina)
        {
            if(global.isADMOB)
            {
                GoogleMobileAds_AddBanner(global.bannerID, GoogleMobileAds_Leaderboard);    
                adSpMove = 100;
            }
        }
        else if(os_device == device_ios_iphone5 ||
            os_device == device_ios_iphone ||
            os_device == device_ios_iphone_retina)
        {
            if(global.isADMOB)
            {   
                GoogleMobileAds_AddBanner(global.bannerID, GoogleMobileAds_Banner);
                adSpMove = 120;
            }
        }
        
        var bw = GoogleMobileAds_BannerGetWidth();
        var bh = GoogleMobileAds_BannerGetHeight();
        var px = (display_get_width() - bw)/2;
        var py = 0;
        GoogleMobileAds_MoveBanner(px,py);
        
        uiCoin.y += adSpMove;
        uiDBall.y += adSpMove;
        uiHero.y += adSpMove;
        uiPBar.y += adSpMove;
        uiSkull.y += adSpMove;
        
        global.continueMsgTimer = -1;
//        scr_bgm_stop();
        scr_continue_msg();  
        
/*        
        var adSpMove = 0;                
        if(os_device == device_ios_ipad || 
        os_device == device_ios_ipad_retina || 
        os_device == device_ios_ipad_retina)
        {
            ads_enable(40,0,2);
            adSpMove = 100;
        }
        else if(os_device == device_ios_iphone5 ||
        os_device == device_ios_iphone ||
        os_device == device_ios_iphone_retina)
        {
            ads_enable(0,0,0);
            adSpMove = 120;
        }
        
        uiCoin.y += adSpMove;
        uiSkull.y += adSpMove;
        uiHero.y += adSpMove;
        uiPBar.y += adSpMove;
*/        
    }
}
else
{
    if(os_is_paused())
    {
        global.pause = true;
        
        scr_bgm_pause();
        
        //
        if(os_type == os_ios && global.isADMOB)
        {
            GoogleMobileAds_ShowInterstitial();
        }
            
    }
    
    if(global.pause == true)
        return 0;
}

if(!instance_exists(global.playerTrain))
{  
}
else
{
    // deki train clean
    var size = ds_list_size(global.dekiTrainList);
    var i=0;
    while(i<size)
    {
        var train = ds_list_find_value(global.dekiTrainList, i);
        if(!instance_exists(train))
        {
            ds_list_delete(global.dekiTrainList,i);
            size = ds_list_size(global.dekiTrainList);
        }
        else
        {
            i++;
        }
    }
    
    // item Magnet
    if(global.spMagnet > 0)
    {
        global.spMagnet--;
        if(global.spMagnet == 0)  
            global.spMagnet = -1;
    }
    
    // item MUDEKI
    if(global.spMudeki > 0)
    {
        global.spMudeki--;
        if(global.spMudeki == 0)
            global.spMudeki = -1;
    }
    
    // item Atk Speed Up
    if(global.atkSpeedUp > 0)
    {
        global.atkSpeedUp--;
        if(global.atkSpeedUp == 0)
            global.atkSpeedUp = -1;
    }
    
    // item nikuman effect
    if(global.addHP>0)
    {
        var sizePTrain = ds_list_size(global.playerTrain.train);
        for(var i=0;i<sizePTrain;i++)
        {
            pChar = ds_list_find_value(global.playerTrain.train, i);
            if(instance_exists(pChar))
                pChar.addHP += global.addHP;
        }
        global.addHP = 0;
    }

/*        
    // item bomb
    var sizeBomb = ds_list_size(global.bombXList);
    if(sizeBomb > 0)
    {
        for(var i=0;i<sizeBomb;i++)
        {            
            var bombX = ds_list_find_value(global.bombXList, i);
            var bombY = ds_list_find_value(global.bombYList, i);                        
            var bombRange = ds_list_find_value(global.bombRangeList, i);        
            var bombPower = ds_list_find_value(global.bombPowerList, i);                        
            
            var sizeDTrainList = ds_list_size(global.dekiTrainList);
            for(var j=0;j<sizeDTrainList;j++)
            {
                var dekiTrain = ds_list_find_value(global.dekiTrainList, j);
                if(instance_exists(dekiTrain))
                {
                    var sizeDTrain = ds_list_size(dekiTrain.train);
                    for(var k=0;k<sizeDTrain;k++)
                    {
                        var dChar = ds_list_find_value(dekiTrain.train, k);
                        if(instance_exists(dChar))
                        {
                            var bombDis = point_distance(bombX,bombY,dChar.x,dChar.y);
                            //if(collision_rectangle(bombX-bombRange,bombY-bombRange,bombX+bombRange,bombY+bombRange,dChar,true,false))
                            if(bombDis <= bombRange)
                            {              
                                dChar.delHP = bombPower;          
                                //dChar.hp -= bombPower;
    //                            show_debug_message("boom");
                            }
                        }
                    }
                }
            }
        }
        
        global.bombXList = ds_list_create();
    }
*/        
    // player attack
    scr_player_attack();
    
    // deki attack
    scr_deki_attack();

    // check char collision
//    scr_check_char_collision();
    
    // check bullet collision
//    scr_check_bullet_collision();   
}

// deki spawn
if(spawnTimer >0)
{
    spawnTimer--;
}
else
{
    if(global.stageDekiCounter < global.stageMaxDeki)
    {
        spawnTimer = global.stageSpawnTimer;
        ds_list_add(global.dekiTrainList, instance_create(0, 0, obj_train_deki));

        //scr_snd(snd_spawn);
    }
}

// stage finish (killed all deki)
if(finishTimer == -1 && global.stageDekiKilled >= global.stageMaxDeki && instance_exists(global.playerTrain.char0))
{
    scr_bgm(snd_win, false);
    global.playCounter++;
    analytics_event_ext("Sango Quest", 
                        "Level", global.nowStage, 
                        "Hero Count", scr_count_unlocked_hero(), 
                        "Game Coins", global.gameCoin, 
                        "Total Coins", global.totalCoin,
                        "Play Counter", global.playCounter);
    
    finishTimer = 600;
    global.spMagnet = 9999; 
    global.spMudeki = 9999;  
    var coin = irandom(4);
    // many coins
    for(var i=0;i<15;i++)
    {
        for(var j=0;j<15;j++)
        {
            rdm = global.coinArray[i,j];
            if(rdm == coin)
            {
                itemObj = instance_create(global.mapLeft+40+i*80,global.mapUp+40+j*80,obj_item);
                itemObj.randomType = RAND_COIN;
            }
        }
    }
}



if(!instance_exists(global.playerTrain))
    global.trainSize = 0;
else
    global.trainSize = ds_list_size(global.playerTrain.train);
    
