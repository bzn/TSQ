if(global.isZenmetsu)
    return 0;
    
var heroID = argument0;
switch(heroID)
{
    case 1:
    newObj = obj_ch001;
    break;
    case 2:
    newObj = obj_ch002;
    break;
    case 3:
    newObj = obj_ch003;
    break;
    case 4:
    newObj = obj_ch004;
    break;
    case 5:
    newObj = obj_ch005;
    break;
    case 6:
    newObj = obj_ch006;
    break;
    case 7:
    newObj = obj_ch007;
    break;
    case 8:
    newObj = obj_ch008;
    break;
    case 9:
    newObj = obj_ch009;
    break;
    case 10:
    newObj = obj_ch010;
    break;
    case 11:
    newObj = obj_ch011;
    break;
    case 12:
    newObj = obj_ch012;
    break;
    case 13:
    newObj = obj_ch013;
    break;
    case 14:
    newObj = obj_ch014;
    break;
    case 15:
    newObj = obj_ch015;
    break;
    case 16:
    newObj = obj_ch016;
    break;                                                
}

show_debug_message("========1========")
var sizePTrain = ds_list_size(global.playerTrain.train);
for(var i=0;i<sizePTrain;i++)
{
    pChar = ds_list_find_value(global.playerTrain.train, i);
    show_debug_message("pos"+string(i)+"id"+string(pChar.charID));
}
        
// add a new member
var size = ds_list_size(global.playerTrain.train);
var lastChar = ds_list_find_value(global.playerTrain.train, size-1);
ds_list_add(global.playerTrain.train, instance_create(lastChar.x, lastChar.y, newObj));            
var pos = ds_list_size(global.playerTrain.train) - 1;
var char = ds_list_find_value(global.playerTrain.train, pos);
char.pos = pos;
char.command = lastChar.faceTo;
ds_list_copy(char.nodeXList,lastChar.nodeXList);
ds_list_copy(char.nodeYList,lastChar.nodeYList);    
ds_list_copy(char.nodeDirList,lastChar.nodeDirList);

show_debug_message("========2========")
var sizePTrain2 = ds_list_size(global.playerTrain.train);
for(var i=0;i<sizePTrain2;i++)
{
    pChar = ds_list_find_value(global.playerTrain.train, i);
    show_debug_message("pos"+string(i)+"id"+string(pChar.charID));
}
         
//show_debug_message("add = "+string(newObj.charID));

scr_add_hero_in_team(newObj.charID);   
