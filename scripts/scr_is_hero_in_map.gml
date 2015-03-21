var charID = argument0;
for(var i=0;i<MAX_HERO;i++)
{
    if(global.heroInMap[i] == charID)
    {
        return true;
    }
}
return false;
