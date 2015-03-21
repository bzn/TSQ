var sizePTrain = ds_list_size(global.playerTrain.train);
var sizeDTrainList = ds_list_size(global.dekiTrainList);
for(var i=0;i<sizeDTrainList;i++)
{
    var dekiTrain = ds_list_find_value(global.dekiTrainList, i);
    if(dekiTrain.forzenTimer <= 0)
    {
        var sizeDTrain = ds_list_size(dekiTrain.train);
        for(var j=0;j<sizeDTrain;j++)
        {
            dChar = ds_list_find_value(dekiTrain.train, j);                
            if(instance_exists(dChar) && scr_is_in_screen(dChar) && dChar.hp > dChar.delHP)                
            {
                dChar.buffIce.image_alpha = 0.0;
                
                if(dChar.atkSpeed > 0)
                {
                    dChar.atkSpeed--;
                }
                else
                {          
                          
                    // attack type
                    switch(dChar.charID)
                    {
                    case 1:
                        scr_attack_deki(dChar);
                    break;
                    case 2:
                        scr_attack_bullet_deki(dChar, BULL_YELLOW);
                    break;
                    case 3:
                        scr_attack_deki(dChar);
                    break;
                    case 4:
                        scr_attack_deki(dChar);
                    break;
                    case 5:
                        scr_attack_bullet_deki(dChar, BULL_ARROW2);
                    break;
                    case 6:
                        // ....
                    break;
                    case 7:
                        // ....
                    break;
                    case 8:
                        scr_attack_bullet_deki(dChar, BULL_BLUE);
                    break;
                    case 9:
                        scr_area_heal(dChar);
                        scr_snd(snd_healmagic);
                    break;
                    case 10:
                        scr_attack_bullet_deki(dChar, BULL_KNIFE);
                    break;
                    }  
                                         
                }
            }
        }
    }
    else
    {
        var sizeDTrain = ds_list_size(dekiTrain.train);
        for(var j=0;j<sizeDTrain;j++)
        {
            dChar = ds_list_find_value(dekiTrain.train, j);                
            if(instance_exists(dChar) && scr_is_in_screen(dChar))
            {
                dChar.buffIce.image_alpha = 1.0;
            }
        }
    }
}
