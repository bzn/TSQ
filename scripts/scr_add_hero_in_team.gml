var charID = argument0;
for(var i=0;i<MAX_HERO;i++)
{
    if(global.heroInTeam[i] == -1)
    {
        show_debug_message("set pos="+string(i)+ "id="+string(charID));
        global.heroInTeam[i] = charID;
        break;
    }
}
