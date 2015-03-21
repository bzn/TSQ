var pChar = argument0;

// sound
scr_atksnd_1();                        

pChar.swing.isPlay = true;

// multi attack
var sizeDTrainList = ds_list_size(global.dekiTrainList);
for(i=0;i<sizeDTrainList;i++)
{
    var dekiTrain = ds_list_find_value(global.dekiTrainList, i);
    var sizeDTrain = ds_list_size(dekiTrain.train);
    for(j=0;j<sizeDTrain;j++)
    {
        var dChar = ds_list_find_value(dekiTrain.train, j);
        if(instance_exists(dChar))
        {                           
            if(scr_square_x_circle_part(pChar,dChar))
            {
                dChar.delHP += pChar.atkPower;                                        
                // attack effect
                instance_create(dChar.x,dChar.y,obj_explo);                                                                    
            }
        }  
    }
}
