if(achievement_available())
{
    achievement_post_score("highscore", global.bestKill);

    var pa = global.totalKill;
    if (pa > 100)
        achievement_post("100e", 100);
    
    if (pa > 1000)
        achievement_post("1000e", 100);
    
    if (pa > 10000)
        achievement_post("10000e", 100);
    
    if (pa > 100000)
        achievement_post("100000e", 100);
    
    if (pa > 1000000)
        achievement_post("1000000e", 100);
    
//    achievement_post_score("com.tosmks.sango.coin.best", global.bestCoin);
    show_debug_message("Update Gamecenter");
}
