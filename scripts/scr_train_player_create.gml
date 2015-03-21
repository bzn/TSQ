// deki
isDeki = false;

forzenTimer = 0;
moveSpeedUpTimer = 0;
moveSlowDownTimer = 0;

// train list
train = ds_list_create();

// train default xy
defaultX = MAP_SIZE * 0.5;
defaultY = MAP_SIZE * 0.5;

heroObj = scr_get_hero_obj(global.nowHeroID)
ds_list_add(train, instance_create(defaultX, defaultY, heroObj));

char0 = ds_list_find_value(train, 0);
char0.isLeader = true;
char0.command = FACE_U;

for(var i=1;i<MAX_HERO;i++)
{
    if(global.heroInTeam[i] != -1)
    {
        heroID = global.heroInTeam[i];
        heroObj = scr_get_hero_obj(heroID);
        // add a new member
        var size = ds_list_size(train);
        var lastChar = ds_list_find_value(train, size-1);
        ds_list_add(train, instance_create(lastChar.x, lastChar.y, heroObj));            
        var pos = ds_list_size(train) - 1;
        var char = ds_list_find_value(train, pos);
        char.pos = pos;
        char.command = lastChar.faceTo;
        ds_list_copy(char.nodeXList,lastChar.nodeXList);
        ds_list_copy(char.nodeYList,lastChar.nodeYList);    
        ds_list_copy(char.nodeDirList,lastChar.nodeDirList);        
    }
}
   
buffQ  = instance_create(global.pTrainX, global.pTrainY, obj_eff_q);
     
/*
// test for multi char
// char1
ds_list_add(train, instance_create(1000, 1060, obj_ch001));
char1 = ds_list_find_value(train, 1);
char1.command = FACE_U;

// char2
ds_list_add(train, instance_create(1000, 1120, obj_ch001));
char2 = ds_list_find_value(train, 2);
char2.command = FACE_U;

// char3
ds_list_add(train, instance_create(1000, 1180, obj_ch001));
char3 = ds_list_find_value(train, 3);
char3.command = FACE_U;

// char4
ds_list_add(train, instance_create(1000, 1240, obj_ch001));
char4 = ds_list_find_value(train, 4);
char4.command = FACE_U;
*/
