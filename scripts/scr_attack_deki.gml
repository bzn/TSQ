var dChar = argument0;

var sizePTrain = ds_list_size(global.playerTrain.train);
for(k=0;k<sizePTrain;k++)
{
    pChar = ds_list_find_value(global.playerTrain.train, k);
    if(scr_square_x_circle_part(dChar,pChar))
    {
        // reset attack speed
        dChar.atkSpeed = dChar.atkSpeedDefault;   
        // sound
        scr_snd(snd_swing);
        scr_snd(snd_explo1);                             
//        dChar.swing.isPlay = true;   

        if(dChar.objWeaponSwing != -1)
        {   
            dChar.objWeaponSwing.isActive = true; 
            dChar.objWeaponSwing.x = dChar.atkCenterX;
            dChar.objWeaponSwing.y = dChar.atkCenterY;
            dChar.objWeaponSwing.startAngle = -90 + dChar.atkOffsetNow;
            dChar.objWeaponSwing.endAngle = dChar.objWeaponSwing.startAngle + dChar.atkAngle;
            dChar.objWeaponSwing.nowAngle = dChar.objWeaponSwing.startAngle;            
        }
        
        if(dChar.objWeaponSpear != -1)
        {   
            dChar.objWeaponSpear.isActive = true; 
            dChar.objWeaponSpear.x = dChar.atkCenterX;
            dChar.objWeaponSpear.y = dChar.atkCenterY;   
            
            dChar.objWeaponSpear.faceTo = dChar.faceTo;     
            dChar.objWeaponSpear.endPos = 120;
        }
     
        pChar.delHP += dChar.atkPower;
        //instance_create(pChar.x,pChar.y,obj_explo);                
    }
}

