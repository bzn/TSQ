// kill all member when train leader dead
if(!instance_exists(char0))
{
    var size = ds_list_size(train);
    for(var i=0;i<size;i++)
    {
        var char = ds_list_find_value(train, i);
        char.isAlive = false;
    }

    // gameover 
    // ....
    //scr_continue();

    //scr_gameover();
    
    global.isZenmetsu = true;
    global.continueMsgTimer = 60;
    global.playCounter++;
    analytics_event_ext("Sango Quest", 
                        "Level", global.nowStage, 
                        "Hero Count", scr_count_unlocked_hero(), 
                        "Game Coins", global.gameCoin, 
                        "Total Coins", global.totalCoin,
                        "Play Counter", global.playCounter);
    
    scr_bgm(snd_lose, false);
//    show_debug_overlay("zenmetsu");
    
//    show_debug_message("GGGG");
    
    // destroy train
    instance_destroy();
}
