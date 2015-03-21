if(global.pause)
{
    speed = 0;
    return 0;
}
    
// for bomb 
var range = 200;

if(scr_is_kakusei(13))
    range = 300;
                
//show_debug_message(string(distance_to_point(targetX,targetY)));

if(distance_to_point(targetX,targetY) <= spd)
{
    
    var sizeDTrainList = ds_list_size(global.dekiTrainList);
    for(var i=0;i<sizeDTrainList;i++)
    {
//        show_debug_message(string(sizeDTrainList)+","+string(i));
        var dekiTrain = ds_list_find_value(global.dekiTrainList, i);
        var sizeDTrain = ds_list_size(dekiTrain.train);
        for(var j=0;j<sizeDTrain;j++)
        {
            var dChar = ds_list_find_value(dekiTrain.train, j);
            if(instance_exists(dChar))
            {                    
                //if(collision_rectangle(targetX-range,targetY-range,targetY+range,targetY+range,dChar,true,false))
                if(distance_to_point(dChar.x, dChar.y) <= range)
                {
                    dChar.delHP += atkPower;
                }
            }
        }
    }
           
    instance_destroy();
    return 0;
}
