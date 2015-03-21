var heroID = argument0;
var nowLV = argument1;

if(nowLV == MAX_LEVEL)
    return 0;

var pos = (heroID-1)*MAX_LEVEL+nowLV;

return global.upgradeExp[pos];
