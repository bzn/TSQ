var heroID = argument0;
var pos = heroID-1;   
if(!global.heroUnlock[pos])
{
    scr_snd(snd_unlock);
    
    global.heroUnlock[pos] = true;
    scr_save_game();
    
    if(heroID == 4) achievement_post("h04", 100);
    else if(heroID == 5) achievement_post("h05", 100);
    else if(heroID == 6) achievement_post("h06", 100);
    else if(heroID == 7) achievement_post("h07", 100);
    else if(heroID == 8) achievement_post("h08", 100);
    else if(heroID == 9) achievement_post("h09", 100);
    else if(heroID == 10) achievement_post("h10", 100);
    else if(heroID == 11) achievement_post("h11", 100);
    else if(heroID == 12) achievement_post("h12", 100);
    else if(heroID == 13) achievement_post("h13", 100);
    else if(heroID == 14) achievement_post("h14", 100);
    else if(heroID == 15) achievement_post("h15", 100);
    else if(heroID == 16) achievement_post("h16", 100);
    
    return true;
}

return false;
