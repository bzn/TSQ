var pChar = argument0;

// sound
scr_snd(snd_explo1);                      
scr_snd(snd_swing);

//pChar.swing.isPlay = true;

if(pChar.objWeaponSwing != -1)
{    
    pChar.objWeaponSwing.isActive = true;    
    pChar.objWeaponSwing.x = pChar.atkCenterX;
    pChar.objWeaponSwing.y = pChar.atkCenterY;
    
    pChar.objWeaponSwing.startAngle = -90 + pChar.atkOffsetNow;
    pChar.objWeaponSwing.endAngle = pChar.objWeaponSwing.startAngle + pChar.atkAngle;
    pChar.objWeaponSwing.nowAngle = pChar.objWeaponSwing.startAngle;
}

if(pChar.objWeaponSpear != -1)
{    
    pChar.objWeaponSpear.isActive = true;    
    pChar.objWeaponSpear.x = pChar.atkCenterX;
    pChar.objWeaponSpear.y = pChar.atkCenterY;
    
    pChar.objWeaponSpear.faceTo = pChar.faceTo;
    pChar.objWeaponSpear.endPos = 150;
}

// multi attack
var sizeDTrainList = ds_list_size(global.dekiTrainList);
for(var j=0;j<sizeDTrainList;j++)
{
    var dekiTrain = ds_list_find_value(global.dekiTrainList, j);
    var sizeDTrain = ds_list_size(dekiTrain.train);
    for(var k=0;k<sizeDTrain;k++)
    {
        var dChar = ds_list_find_value(dekiTrain.train, k);
        if(instance_exists(dChar))
        {                           
            var dist = scr_square_x_circle_part(pChar,dChar);
            if(dist >= 0)
            {
                var disTemp = dist;
                var extraPower = 0;                
                if(scr_is_kakusei(12))
                    extraPower = floor(pChar.atkPower * 0.1);
                dChar.delHP += pChar.atkPower + extraPower;
                
                if(pChar.charID == 16 && scr_is_kakusei(16))
                {
                    var rnd = irandom(1);
                    if(rnd == 1)
                    {
                        // critical attack!
                        show_debug_message("critical!");
                        dChar.isAlive = false;
                    }
                }
                // attack effect
                //instance_create(dChar.x,dChar.y,obj_explo);                                                                    
            }
        }  
    }
}


