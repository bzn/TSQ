var sizeBullet = ds_list_size(global.heroBulletList);
var sizeDTrainList = ds_list_size(global.dekiTrainList);
for(var i=0;i<sizeBullet;i++)
{
    var bullet = ds_list_find_value(global.heroBulletList, i);
    for(var j=0;j<sizeDTrainList;j++)
    {
        var dekiTrain = ds_list_find_value(global.dekiTrainList, j);
        var sizeDTrain = ds_list_size(dekiTrain.train);
        for(var k=0;k<sizeDTrain;k++)
        {
            var dChar = ds_list_find_value(dekiTrain.train, k);
            if(instance_exists(dChar))
            {
                if(collision_rectangle(dChar.bbox_left,dChar.bbox_top,dChar.bbox_right,dChar.bbox_bottom,bullet,true,false))                
                {
//                    show_debug_message("HIT");
                    var extraPower = 0;                
                    if(scr_is_kakusei(12))
                        extraPower = floor(bullet.atkPower * 0.1);
                    
                    if(bullet.type == BULL_AXE)
                    {
                        dChar.isAxeHit = true;
                        dChar.axePower += bullet.atkPower + extraPower;
                    }
                    else if(bullet.type == BULL_ICE)
                    {
                        dChar.icePower += bullet.atkPower + extraPower;

                        if(dChar.isIceHit == false)
                        {
                            dChar.isIceHit = true;
                        }
                    }
                    else if(bullet.type == BULL_FIRE)
                    {
                        dChar.firePower += bullet.atkPower + extraPower;

                        if(dChar.isFireHit == false)
                        {
                            dChar.isFireHit = true;
                        }
                    }
                    else if(bullet.type == BULL_GREEN)
                    {
                        dChar.delHP += bullet.atkPower + extraPower;
                
                        if(scr_is_kakusei(11))
                        {
                            var rnd = irandom(1);
                            if(rnd == 1)
                            {
                                scr_heal(3);
                            }
                        }
                    }
                    else
                    {
                        // normal
                        dChar.delHP += bullet.atkPower + extraPower;
                    }
                    bullet.isAlive = false;
                    var pos = ds_list_find_index(global.heroBulletList, bullet);
                    ds_list_delete(global.heroBulletList, pos);
                    // boom effect
                    instance_create(bullet.x,bullet.y,obj_part_bullet_boom);                       
                }
            }
        }
    }
}

var sizeDekiBullet = ds_list_size(global.dekiBulletList);
var sizePTrain = ds_list_size(global.playerTrain.train);
for(var i=0;i<sizeDekiBullet;i++)
{
    var bullet = ds_list_find_value(global.dekiBulletList, i);
//    if(scr_is_in_screen(bullet.x,bullet.y))
//    {
        for(var j=0;j<sizePTrain;j++)
        {        
            var pChar = ds_list_find_value(global.playerTrain.train, j);
            if(instance_exists(pChar))
            {
                show_debug_message("DEKI BULLET CHECK");
                if(collision_rectangle(pChar.bbox_left,pChar.bbox_top,pChar.bbox_right,pChar.bbox_bottom,bullet,true,false))
                {
                    show_debug_message("DEKI BULLET HIT");        
                    
                    if(bullet.type == BULL_BLUE)
                    {
                        global.playerTrain.moveSlowDownTimer = 200;
                    }
                    else
                    {
                        // normal
                        pChar.delHP += (bullet.atkPower+global.dekiAtkPlus);
                    }
                    bullet.isAlive = false;
                    var pos = ds_list_find_index(global.dekiBulletList, bullet);
                    ds_list_delete(global.dekiBulletList, pos);
                    // boom effect
                    instance_create(bullet.x,bullet.y,obj_part_bullet_boom);                       
                }
            }
        }
//    }
}
