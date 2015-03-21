var heroID = argument0;
var pos = heroID-1;
var heroLV = global.heroLevel[pos];

if(heroLV >= MAX_LEVEL)
    return -1;

var basicCost = scr_get_upgrade_cost(heroID, heroLV);

if(global.heroUnlock[pos] && global.heroLevel[pos] < MAX_LEVEL)
{
    costExp = scr_get_upgrade_exp(heroID, global.heroLevel[pos]+1);
    nowExp = global.heroExp[pos];
    
    cost = basicCost - floor(basicCost * nowExp / costExp); 
    if(cost < 0)
        cost = 0;
    return cost;
}

return -1;


