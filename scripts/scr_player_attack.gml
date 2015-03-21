var sizePTrain = ds_list_size(global.playerTrain.train);
var sizeDTrainList = ds_list_size(global.dekiTrainList);
for(var i=0;i<sizePTrain;i++)
{
    // no player attack
    // break;
    pChar = ds_list_find_value(global.playerTrain.train, i);
    if(instance_exists(pChar))
    {
        if(pChar.atkSpeed > 0)
        {
            pChar.atkSpeed--;
        }
        else
        {                
            // break for bullet, only shoot one target
            var tChar;
            var isFindTarget = false;
            for(var j=0;j<sizeDTrainList;j++)
            {
                var dekiTrain = ds_list_find_value(global.dekiTrainList, j);
                var sizeDTrain = ds_list_size(dekiTrain.train);
                var distance = 999999;                    
                for(var k=0;k<sizeDTrain;k++)
                {
                    var dChar = ds_list_find_value(dekiTrain.train, k);
                    if(instance_exists(dChar))
                    {
                        var dist = scr_square_x_circle_part(pChar,dChar);
                        if(dist >= 0)
                        {
                            var disTemp = dist;
                            // only attack minimal distance deki char
                            if(distance > disTemp)
                            {                                                                
                                isFindTarget = true;
                                tChar = dChar;
                                distance = disTemp;
                            }
                        }
                    }  
                }
            }
              
            if(isFindTarget == true)
            {
                // reset attack speed
                pChar.atkSpeed = pChar.atkSpeedDefault;  
                
                if(scr_is_kakusei(15))
                {
                    pChar.atkSpeed = pChar.atkSpeed * 0.8;
                }  
                                              
                if(global.atkSpeedUp > 0)
                    pChar.atkSpeed = pChar.atkSpeed * 0.5;    
                
                pChar.atkPower = pChar.atkPowerDefault;
                if(global.atkPowerUp > 0)
                    pChar.atkPower = pChar.atkPower * 1.1;    
                    
                //show_debug_message(string(pChar.charID)+" ATTACK");
                // attack type
                switch(pChar.charID)
                {
                case 1:
                    scr_attack_normal(pChar);
                break;
                case 2:
                    scr_attack_normal(pChar);
                break;
                case 3:
                    scr_attack_normal(pChar);
                break;
                case 4:
                    scr_attack_normal(pChar);
                break;
                case 5:
                    scr_attack_normal(pChar);
                break;
                case 6:
                    scr_attack_bullet_ex(pChar, tChar, BULL_ARROW, false);
                break;
                case 7:
                    scr_attack_bullet_ex(pChar, tChar, BULL_PLUME, false);
                break;
                case 8:
                    scr_attack_bullet_ex(pChar, tChar, BULL_ICE, false);
                break;
                case 9:
                    scr_attack_bullet_ex(pChar, tChar, BULL_AXE, false);
                break;
                case 10:
                    scr_attack_normal(pChar);
                break;
                case 11:
                    scr_attack_bullet_ex(pChar, tChar, BULL_GREEN, false);
                break;
                case 12:
                    scr_attack_normal(pChar);
                break;
                case 13:
                    scr_attack_bullet_ex(pChar, tChar, BULL_BOMB, false);
                break;
                case 14:
                    scr_attack_bullet_ex(pChar, tChar, BULL_FIRE, false);
                break;
                case 15:
                    scr_attack_normal(pChar);
                break;
                case 16:
                    scr_attack_normal(pChar);
                break;
                }
            }
            
        }
    }
}
