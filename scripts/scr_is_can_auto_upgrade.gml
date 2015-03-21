var heroID = argument0;

var pos = heroID-1;
var heroLV = global.heroLevel[pos];

if(heroLV >= MAX_LEVEL)
    return false;
    
var costExp = scr_get_upgrade_exp(heroID, heroLV+1);
var nowExp = global.heroExp[pos];

if(nowExp >= costExp)
{
    show_debug_message(string(heroID)+","+string(heroLV)+","+string(heroID));
    return true;
}
else
    return false;
