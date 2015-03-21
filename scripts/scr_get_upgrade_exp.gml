var heroID = argument0;
var heroLv = argument1;

var pos = (heroID-1)*MAX_LEVEL + (heroLv-1);
return global.upgradeExp[pos];
