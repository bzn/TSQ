var stage = argument0;
var hero = argument1;

if(stage >= 20)
    return 10;

if(stage == 1 && hero <= 1)
    return 300;

//if(stage == 1 && hero <= 2)
//    return 200;    
    
var kaku = floor(3000 / (stage * 15));

return kaku;
