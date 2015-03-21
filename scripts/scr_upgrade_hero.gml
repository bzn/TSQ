var heroID = argument0;
var pos = heroID-1;

if(global.heroUnlock[pos] && global.heroLevel[pos] < MAX_LEVEL)
{
    var costExp = scr_get_upgrade_exp(heroID, global.heroLevel[pos]+1);
    var nowExp = global.heroExp[pos];    
    
    if(nowExp >= costExp)
    {
        scr_snd(snd_unlock);
        global.heroExp[pos] -= costExp;
        global.heroLevel[pos] += 1;
        scr_save_game();                
        return true;
    }
    
    var extraCost = scr_get_extra_cost(heroID);  
    show_debug_message(string(nowExp)+"/"+string(costExp));
    if(global.nowCoin >= extraCost)
    {  
        scr_snd(snd_unlock);
        global.nowCoin -= extraCost;
        global.heroExp[pos] = 0;
        global.heroLevel[pos] += 1;
        scr_save_game();
        return true;
    }
}

return false;
