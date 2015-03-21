var counter = 0;
for(var i=0;i<MAX_HERO;i++)
{
    var heroID = i+1;
    if(scr_is_hero_unlock(heroID))
    {
        counter++;
    }
}
return counter;
