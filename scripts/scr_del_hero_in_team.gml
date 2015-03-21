var charID = argument0;

for(var i=0;i<MAX_HERO;i++)
{
    if(global.heroInTeam[i] == charID)
    {
        for(var j=i;j<MAX_HERO-1;j++)
        {
            global.heroInTeam[j] = global.heroInTeam[j+1];
        }
        global.heroInTeam[MAX_HERO-1] = -1;
        break;
    }
}
