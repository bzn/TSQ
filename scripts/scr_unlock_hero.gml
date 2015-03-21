var heroID = argument0;
var pos = heroID-1;   
if(!global.heroUnlock[pos])
{
    cost = scr_get_upgrade_exp(heroID, 1);
    
    show_debug_message(string(global.nowDBall)+"-"+string(cost));
    
    if(global.nowDBall >= cost)
    {
        global.nowDBall -= cost;
        //global.heroUnlock[pos] = true;
        return scr_unlock_hero_free(heroID);
        //scr_save_game();
        //return true;
    }
}

return false;
