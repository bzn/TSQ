var heroID = argument0;

if(scr_is_hero_in_team(heroID))
{
    pos = heroID-1;
    level = global.heroLevel[pos];
    if(level == MAX_LEVEL)
        return true;
}

return false;
