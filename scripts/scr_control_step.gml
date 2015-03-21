if(!instance_exists(playerTrain))
{
    if(mouse_check_button_released(mb_left))
    {
        room_goto(rom_title);
    }
}
else
{
    // deki train clean
    var size = ds_list_size(dekiTrainList);
    i=0;
    while(i<size)
    {
        var train = ds_list_find_value(dekiTrainList, i);
        if(!instance_exists(train))
        {
            ds_list_delete(dekiTrainList,i);
            //show_debug_message("delete train "+string(i));
            size = ds_list_size(dekiTrainList);
        }
        else
        {
            i++;
        }
    }
    
    // item Magnet
    if(global.spMagnet > 0)
    {
        global.spMagnet--;
        if(global.spMagnet == 0)
        {
            // effect end
            global.spMagnet = -1;
        }
    }
    
    // item MUDEKI
    if(global.spMudeki > 0)
    {
        global.spMudeki--;
        if(global.spMudeki == 0)
        {
            // effect end
            global.spMudeki = -1;
        }
    }
    
    // item Atk Speed Up
    if(global.atkSpeedUp2 > 0)
    {
        global.atkSpeedUp2--;
        if(global.atkSpeedUp2 == 0)
        {
            // effect end
            global.atkSpeedUp2 = -1;
        }
    }
    
    // item nikuman effect
    if(global.addHP>0)
    {
        var sizePTrain = ds_list_size(playerTrain.train);
        for(i=0;i<sizePTrain;i++)
        {
            pChar = ds_list_find_value(playerTrain.train, i);
            if(instance_exists(pChar))
            {
                pChar.addHP += global.addHP;
            }
        }
        global.addHP = 0;
    }
    
    // item bomb
    var sizeBomb = ds_list_size(global.bombXList);
    if(sizeBomb > 0)
    {
        for(i=0;i<sizeBomb;i++)
        {
            var bombX = ds_list_find_value(global.bombXList, i);
            var bombY = ds_list_find_value(global.bombYList, i);
            var bombRange = ds_list_find_value(global.bombRangeList, i);        
            var bombPower = ds_list_find_value(global.bombPowerList, i);
            var sizeDTrainList = ds_list_size(dekiTrainList);
            for(i=0;i<sizeDTrainList;i++)
            {
                var dekiTrain = ds_list_find_value(dekiTrainList, i);
                var sizeDTrain = ds_list_size(dekiTrain.train);
                for(j=0;j<sizeDTrain;j++)
                {
                    var dChar = ds_list_find_value(dekiTrain.train, j);
                    if(instance_exists(dChar))
                    {
                        if(collision_rectangle(bombX-bombRange,bombY-bombRange,bombX+bombRange,bombY+bombRange,dChar,true,false))
                        {
                            dChar.hp -= bombPower;
                        }
                    }
                }
            }
        }
        
        global.bombXList = ds_list_create();
    }
    
    // item NPC effect
    if(global.addNPC>0)
    {
        switch(global.addNPC)
        {
            case 1:
            newObj = obj_ch001;
            break;
            case 2:
            newObj = obj_ch002;
            break;
            case 3:
            newObj = obj_ch003;
            break;
            case 4:
            newObj = obj_ch004;
            break;
            case 5:
            newObj = obj_ch005;
            break;
            case 6:
            newObj = obj_ch006;
            break;
            case 7:
            newObj = obj_ch007;
            break;
        }
        global.addNPC = 0;
        
        // add a new member
        var size = ds_list_size(playerTrain.train);
        var lastChar = ds_list_find_value(playerTrain.train, size-1);
        ds_list_add(playerTrain.train, instance_create(lastChar.x, lastChar.y, newObj));            
        var pos = ds_list_size(playerTrain.train) - 1;
        var char = ds_list_find_value(playerTrain.train, pos);
        char.pos = pos;
        char.command = lastChar.faceTo;
        ds_list_copy(char.nodeXList,lastChar.nodeXList);
        ds_list_copy(char.nodeYList,lastChar.nodeYList);    
        ds_list_copy(char.nodeDirList,lastChar.nodeDirList);
        
        scr_add_hero_in_team(newObj.charID);        
    }
    
    // player attack
    var sizePTrain = ds_list_size(playerTrain.train);
    var sizeDTrainList = ds_list_size(dekiTrainList);
    for(i=0;i<sizePTrain;i++)
    {
        // no player attack
        // break;
        pChar = ds_list_find_value(playerTrain.train, i);
        if(instance_exists(pChar))
        {
            if(pChar.atkSpeed > 0)
            {
                pChar.atkSpeed--;
            }
            else
            {                
                // break for bullet, only shoot one target
                var isAtkBreak = false;
                for(j=0;j<sizeDTrainList;j++)
                {
                    var dekiTrain = ds_list_find_value(dekiTrainList, j);
                    var sizeDTrain = ds_list_size(dekiTrain.train);
                    for(k=0;k<sizeDTrain;k++)
                    {
                        dChar = ds_list_find_value(dekiTrain.train, k);
                        if(instance_exists(dChar))
                        {
                            if(collision_rectangle(pChar.atkBoxLeft,pChar.atkBoxTop,pChar.atkBoxRight,pChar.atkBoxBottom,dChar,true,false))
                            {
                                // reset attack speed
                                pChar.atkSpeed = pChar.atkSpeedDefault;                                
                                if(global.atkSpeedUp1 > 0)
                                    pChar.atkSpeed = pChar.atkSpeed * 0.75;
                                if(global.atkSpeedUp2 > 0)
                                    pChar.atkSpeed = pChar.atkSpeed * 0.75;    
                                    
                                // attack type
                                // ....
                                
                                switch(pChar.atkType)
                                {
                                case 1:
                                    // normal
                                    scr_atksnd_1();
                                    instance_create(dChar.x,dChar.y,obj_explo);                                    
                                    dChar.delHP = pChar.atkPower;
                                    pChar.swing.isPlay = true;
                                break;
                                case 2:
                                    // fire ball
                                    bullet = instance_create(pChar.atkCenterX,pChar.atkCenterY,obj_bullet_fire);
                                    bullet.isDeki = false;
                                    bullet.targetX = pChar.atkCenterX + (dChar.x - pChar.x)*100;
                                    bullet.targetY = pChar.atkCenterY + (dChar.y - pChar.y)*100;
                                    bullet.sp = 5.0;
                                    bullet.atkPower = pChar.atkPower;
                                    isAtkBreak = true;
                                break;
                                case 3:
                                    // arrow(HuanZhong)
                                    bullet = instance_create(pChar.atkCenterX,pChar.atkCenterY,obj_bullet_arrow);
                                    bullet.isDeki = false;
                                    bullet.targetX = pChar.atkCenterX + (dChar.x - pChar.x)*100;
                                    bullet.targetY = pChar.atkCenterY + (dChar.y - pChar.y)*100;
                                    bullet.image_angle = 90+point_direction(bullet.targetX, bullet.targetY, bullet.x, bullet.y);
                                    bullet.sp = 10.0;
                                    bullet.atkPower = pChar.atkPower;
                                    isAtkBreak = true;
                                break;
                                case 4:
                                    // plume(KonMing)
                                    bullet = instance_create(pChar.atkCenterX,pChar.atkCenterY,obj_bullet_plume);                                    
                                    bullet.isDeki = false;
                                    bullet.targetX = pChar.atkCenterX + (dChar.x - pChar.x)*100;
                                    bullet.targetY = pChar.atkCenterY + (dChar.y - pChar.y)*100;
                                    bullet.image_angle = 90+point_direction(bullet.targetX, bullet.targetY, bullet.x, bullet.y);
                                    bullet.sp = 5.0;
                                    bullet.atkPower = pChar.atkPower;
                                    isAtkBreak = true;
                                break;
                                }
                                
                                if(isAtkBreak)
                                    break;                            
                            }
                        }
                    }
                    if(isAtkBreak)
                        break;
                }
            }        
        }
    }
    
    // deki attack
    var sizePTrain = ds_list_size(playerTrain.train);
    var sizeDTrainList = ds_list_size(dekiTrainList);
    for(i=0;i<sizeDTrainList;i++)
    {
        var dekiTrain = ds_list_find_value(dekiTrainList, i);
        var sizeDTrain = ds_list_size(dekiTrain.train);
        for(j=0;j<sizeDTrain;j++)
        {
            dChar = ds_list_find_value(dekiTrain.train, j);
            if(instance_exists(dChar))
            {
                if(dChar.atkSpeed > 0)
                {
                    dChar.atkSpeed--;
                }
                else
                {
                    for(k=0;k<sizePTrain;k++)
                    {
                        pChar = ds_list_find_value(playerTrain.train, k);
                        if(collision_rectangle(dChar.atkBoxLeft,dChar.atkBoxTop,dChar.atkBoxRight,dChar.atkBoxBottom,pChar,true,false))                        
                        {
                            // reset attack speed
                            dChar.atkSpeed = dChar.atkSpeedDefault;                        
                            if(scr_is_mudeki(pChar))
                            {
                                // ....
                            }
                            else
                            {
                                // attack type
                                // ....
                                
                                scr_atksnd_1();
                                instance_create(pChar.x,pChar.y,obj_explo);
                                pChar.delHP = dChar.atkPower;
                            }
                            //break;
                        }
                    }
                }
            }
        }
    }

    // collision: player x deki
    var sizePTrain = ds_list_size(playerTrain.train);
    var sizeDTrainList = ds_list_size(dekiTrainList);
    for(i=0;i<sizePTrain;i++)
    {
        pChar = ds_list_find_value(playerTrain.train, i);
        if(instance_exists(pChar))
        {
            for(j=0;j<sizeDTrainList;j++)
            {
                var dekiTrain = ds_list_find_value(dekiTrainList, j);
                var sizeDTrain = ds_list_size(dekiTrain.train);
                for(k=0;k<sizeDTrain;k++)
                {
                    dChar = ds_list_find_value(dekiTrain.train, k);
                    if(instance_exists(dChar))
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
                            else if(global.spBubble > 0)
                            {
                                global.spBubble = -1;
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
}

// deki spawn
if(spawnTimer >0)
{
    spawnTimer--;
}
else
{
    if(global.stageDekiCounter < global.stageDekiMax[global.stage])
    {
        spawnTimer = defaultSpawnTimer[global.stage-1];
        ds_list_add(dekiTrainList, instance_create(0, 0, obj_train_deki));
    }
}

// killed all
if(finishTimer == -1 && global.stageDekiKilled >= global.stageDekiMax[global.stage])
{
    finishTimer = 600;
    global.spMagnet = 999;   
    // many coins
    for(i=0;i<17;i++)
    {
        for(j=0;j<17;j++)
        {
            rdm = irandom(3);
            if(rdm == 0)
            {
                itemObj = instance_create(360+i*80,360+j*80,obj_item);
                itemObj.isJustMoney = true;
                itemObj.isRandom = true;            
            }
        }
    }
}
if(finishTimer>0)
{
    finishTimer--;
}
else if(finishTimer==0)
{
    global.stage++;
    room_goto(rom_prepare);
}


