heroID = argument0;
pos = heroID-1;   
if(!global.heroUnlock[pos] && global.heroLevel[pos] < 4)
{
    global.heroLevel[pos] += 1;
    return true;
}

return false;
