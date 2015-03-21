// get unlock hero not in team list
var heroList = ds_list_create();

for(var i=0;i<MAX_HERO;i++)
{
    if(global.heroUnlock[i])
    {            
        var heroID = i+1;
//        show_debug_message(string(i+1)+","+string(scr_is_hero_in_team(heroID))+","+string(scr_is_hero_in_map(heroID)));
        if(!scr_is_hero_in_team(heroID) && !scr_is_hero_in_map(heroID))
            ds_list_add(heroList, heroID);
    }
}
// random hero
var size = ds_list_size(heroList);
if(size)
{
    var pos = irandom(size-1);
    var val = ds_list_find_value(heroList, pos);
    return val;
}
else
{
    return 0;
}
