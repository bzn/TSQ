var dChar = argument0;

var tChar;
var isFindTarget = false;
var distance = 999999; 

var sizeDTrainList = ds_list_size(global.dekiTrainList);
for(a=0;a<sizeDTrainList;a++)
{
    var dekiTrain = ds_list_find_value(global.dekiTrainList, a);
    if(dekiTrain.forzenTimer <= 0)
    {
        var sizeDTrain = ds_list_size(dekiTrain.train);
        for(b=0;b<sizeDTrain;b++)
        {
            tempChar = ds_list_find_value(dekiTrain.train, b);
            var dist = scr_square_x_circle_part(dChar,tempChar);
            if(dist >= 0)
            {
                var disTemp = dist;
                // only attack minimal distance deki char
                if(distance > disTemp && tempChar.hp < tempChar.maxhp)
                {
                    isFindTarget = true;
                    tChar = tempChar;
                    distance = disTemp;
                }
            }
        }
    }
}

if(isFindTarget)
{
    // reset attack speed
    dChar.atkSpeed = dChar.atkSpeedDefault;
    
    tChar.addHP += dChar.atkPower;
    show_debug_message("AREA HEAL");
}
