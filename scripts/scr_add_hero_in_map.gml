var charID = argument0;
for(var i=0;i<MAX_HERO;i++)
{
    if(global.heroInMap[i] == -1)
    {
//        show_debug_message("add"+string(charID));
        global.heroInMap[i] = charID;
        break;
    }
}
