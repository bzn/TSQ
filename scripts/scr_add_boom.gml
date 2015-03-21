var boomX = argument0;
var boomY = argument1;
var range = argument2;
var bombPower = argument3;

var sizeDTrainList = ds_list_size(global.dekiTrainList);
for(var j=0;j<sizeDTrainList;j++)
{
    var dekiTrain = ds_list_find_value(global.dekiTrainList, j);
    if(instance_exists(dekiTrain))
    {
        var sizeDTrain = ds_list_size(dekiTrain.train);
        for(var k=0;k<sizeDTrain;k++)
        {
            var dChar = ds_list_find_value(dekiTrain.train, k);
            if(instance_exists(dChar))
            {
                var bombDis = point_distance(boomX,boomY,dChar.x,dChar.y);
//                show_debug_message("dis="+string(bombDis));
//                show_debug_message("rag="+string(range));
                //if(collision_rectangle(bombX-bombRange,bombY-bombRange,bombX+bombRange,bombY+bombRange,dChar,true,false))
                if(bombDis <= range)
                {              
                    dChar.delHP = bombPower;          
                    //dChar.hp -= bombPower;
//                    show_debug_message("boom");
                }
            }
        }
    }
}

if(range <= 150)
{
    show_debug_message("BOMB 1");
    instance_create(boomX, boomY, obj_part_bomb);
    scr_snd(snd_bomb);
}
else if(range <= 200)
{
    show_debug_message("BOMB 2");
    instance_create(boomX, boomY, obj_part_bomb_ex); 
    scr_snd(snd_bomb);
}
else if(range <= 240)
{
    show_debug_message("BOMB 3");
    instance_create(boomX, boomY, obj_part_bigbomb); 
    scr_snd(snd_bomb);
}
else
{
    show_debug_message("BOMB 4");
    instance_create(boomX, boomY, obj_part_bigbomb_ex); 
    scr_snd(snd_bomb);
}

//boomCheck = instance_create(boomX, boomY, obj_boom_check);
//boomCheck.range = range;
