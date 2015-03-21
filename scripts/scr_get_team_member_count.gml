var count = 0;
for(var i=0;i<MAX_HERO;i++)
{
    if(global.heroInTeam[i] != -1)
    {
        count++;
    }
}
return count;
