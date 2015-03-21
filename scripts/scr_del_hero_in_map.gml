var charID = argument0;
for(var i=0;i<MAX_HERO;i++)
{
    if(global.heroInMap[i] == charID)
    {
        global.heroInMap[i] = -1;
        break;
    }
}
