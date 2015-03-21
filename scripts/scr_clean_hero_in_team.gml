for(i=0;i<MAX_HERO-1;i++)
{
    if(global.heroInTeam[i] == -1)
    {
        for(j=i;j<MAX_HERO-1;j++)
        {
            global.heroInTeam[j] = global.heroInTeam[j+1];
        }
    }
}
