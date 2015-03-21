var heroObj = argument0;

if(global.spMudeki > 0)
    return true;
if(heroObj.bornTimer > 0)
    return true;
return false;
