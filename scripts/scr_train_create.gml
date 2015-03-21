isPlayer = argument0;

if(isPlayer)
{
    touchX          = -1;           // 玩家觸碰點
    touchY          = -1;
    isPressed       = false;        // 是否正壓著
    
    // 火車列
    train = ds_list_create();
    // 火車頭char0
    defaultX = MAP_SIZE * 0.5;
    defaultY = MAP_SIZE * 0.5;
    ds_list_add(train, instance_create(defaultX, defaultY, obj_char_1));
    char0 = ds_list_find_value(train, 0);
    char0.isLeader = true;
    //char0.command = FACE_U;
    
    /*
    //測試多人
    // char1
    ds_list_add(train, instance_create(1000, 1060, obj_char_1));
    char1 = ds_list_find_value(train, 1);
    char1.command = FACE_U;
    
    // char2
    ds_list_add(train, instance_create(1000, 1120, obj_char_1));
    char2 = ds_list_find_value(train, 2);
    char2.command = FACE_U;
    
    // char3
    ds_list_add(train, instance_create(1000, 1180, obj_char_1));
    char3 = ds_list_find_value(train, 3);
    char3.command = FACE_U;
    
    // char4
    ds_list_add(train, instance_create(1000, 1240, obj_char_1));
    char4 = ds_list_find_value(train, 4);
    char4.command = FACE_U;
    */
}
else
{
    // train
    train = ds_list_create();
    
    // train leader
    defaultX = irandom_range(MAP_ACTIVE_LEFT,MAP_ACTIVE_RIGHT);
    defaultY = irandom_range(MAP_ACTIVE_TOP,MAP_ACTIVE_BOTTOM);
    ds_list_add(train, instance_create(defaultX, defaultY, obj_char_1));
    char0 = ds_list_find_value(train, 0);
    char0.isLeader = true;
    
    // train member
    memberCount = irandom_range(0,2);
    
    moveAlarm = 0;
    
    char0.moveSpeed = 2;
    
    //測試多人
    // char1
    ds_list_add(train, instance_create(defaultX, defaultY, obj_char_1));
    char1 = ds_list_find_value(train, 1);
    char1.command = FACE_U;
    char1.moveSpeed = 2;
    // char2
    ds_list_add(train, instance_create(defaultX, defaultY, obj_char_1));
    char2 = ds_list_find_value(train, 2);
    char2.command = FACE_U;
    char2.moveSpeed = 2;
}

