// collision: player x deki
var sizePTrain = ds_list_size(global.playerTrain.train);
var sizeDTrainList = ds_list_size(global.dekiTrainList);
for(var i=0;i<sizePTrain;i++)
{
    var pChar = ds_list_find_value(global.playerTrain.train, i);
    if(instance_exists(pChar) && scr_is_in_screen(pChar))
    {
        for(var j=0;j<sizeDTrainList;j++)
        {
            var dekiTrain = ds_list_find_value(global.dekiTrainList, j);
            var sizeDTrain = ds_list_size(dekiTrain.train);
            for(var k=0;k<sizeDTrain;k++)
            {
                dChar = ds_list_find_value(dekiTrain.train, k);
                if(instance_exists(dChar) && scr_is_in_screen(dChar))
                {
                    if(collision_rectangle(dChar.bbox_left,dChar.bbox_top,dChar.bbox_right,dChar.bbox_bottom,pChar,true,false))
                    {
                        if(scr_is_mudeki(pChar))
                        {
                            // player just born
                        }
                        else if(dChar.bornTimer > 0)
                        {
                            // deki just born
                        }
                        else if(global.spBubble > 0 && i == 0)
                        {
                            global.spBubble = -1;
                            scr_snd(snd_bubble);
                            if(global.spMudeki < 100)
                                global.spMudeki = 100;
                        }
                        else
                        {
                            show_debug_message("collision: player x deki");
                            pChar.isAlive = false;
                            dChar.isAlive = false;
                            break;
                        }
                    }
                }
            }
        }        
    }
}
