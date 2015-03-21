var charID = argument0;
for(var j=0;j<MAX_HERO;j++)
{
    if(global.heroInTeam[j] == charID)
    {
        return true;
    }
}
return false;
