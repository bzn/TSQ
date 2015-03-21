if(!instance_exists(global.playerTrain))
    exit;

/*
// speed up
if(keyboard_check_pressed(vk_f1))
{
    global.spHeart = 1;
    show_debug_message("POW UP");
}
if(keyboard_check_pressed(vk_f2))
{
    global.atkPowerUp = 1;
    show_debug_message("POW UP");    
}   
if(keyboard_check_pressed(vk_f3))
{
    global.atkSpeedUp = 1000;
    show_debug_message("SPD UP");    
}
if(keyboard_check_pressed(vk_f4))
{
    global.spMoveFast = 1;
    show_debug_message("MOVE FAST");
}
if(keyboard_check_pressed(vk_f5))
{
    global.spBubble = 1;
    show_debug_message("BUBBLE");
}
if(keyboard_check_pressed(vk_f6))
{
    global.spMagnet = 1000;
    show_debug_message("Magnet");
}
if(keyboard_check_pressed(vk_f7))
{
    global.addHP += 1;
    show_debug_message("add global hp");
}
*/

/*
if(keyboard_check_pressed(vk_f1))
{
    for(var i=0;i<MAX_HERO;i++)
        global.heroLevel[i] = 1;
    show_debug_message("LEVEL 1");        
}
if(keyboard_check_pressed(vk_f2))
{
    for(var i=0;i<MAX_HERO;i++)
        global.heroLevel[i] = 2;
    show_debug_message("LEVEL 2");        
}
if(keyboard_check_pressed(vk_f3))
{
    for(var i=0;i<MAX_HERO;i++)
        global.heroLevel[i] = 3;
    show_debug_message("LEVEL 3");        
}
if(keyboard_check_pressed(vk_f4))
{
    for(var i=0;i<MAX_HERO;i++)
        global.heroLevel[i] = 4;
    show_debug_message("LEVEL 4");        
}

if(keyboard_check_pressed(vk_f6))
{
    global.atkSpeedUp = 1000;
    show_debug_message("Magnet");
}
*/
if(keyboard_check_pressed(vk_f1))
{
    // add hero
    var heroID = scr_random_unuse_hero_id();
    if(heroID > 0)
    {
        scr_add_hero(heroID);
    }
}
if(keyboard_check_pressed(vk_f2))
{
    // kill all
    var sizeDTrainList = ds_list_size(global.dekiTrainList);
    for(var i=0;i<sizeDTrainList;i++)
    {
        var dekiTrain = ds_list_find_value(global.dekiTrainList, i);
        var sizeDTrain = ds_list_size(dekiTrain.train);
        for(var j=0;j<sizeDTrain;j++)
        {
            dChar = ds_list_find_value(dekiTrain.train, j);
            dChar.hp = 0;
        }
    }
}
if(keyboard_check_pressed(vk_f3))
{
    // next stage
    scr_next_stage();
}
if(keyboard_check_pressed(vk_f5))
{
    // add money
    global.nowCoin += 1000000;
    // add dball
    global.nowDBall += 100;
}
// ==== SAVE ====
if(keyboard_check_pressed(vk_f8))
{
    scr_save_game();
}

if(keyboard_check_pressed(vk_f9))
{
    global.spBubble = 3;
    show_debug_message("BUBBLE");
}

if(keyboard_check_pressed(vk_f10))
{
    global.playerTrain.char0.delHP = 10;
}

if(keyboard_check_pressed(vk_f11))
{
//    scr_next_stage();
}

if(keyboard_check_pressed(vk_f12))
{
//    show_debug_message("=============RESET=============");
//    scr_reset_game();
    scr_reset_game();
    room_goto(rom_title);
    show_debug_message("Game Reset");
}

// add a new member(debug)
if(keyboard_check_released(vk_space))
{    
    instance_create(global.playerTrain.char0.x,global.playerTrain.char0.y,obj_part_bomb)
/*
    var heroID = scr_random_unuse_hero_id();
    if(heroID > 0)
    {
        scr_add_hero(heroID);
    }
*/
}

/*
if(mouse_check_button_released(mb_left))
{
    var size = ds_list_size(global.playerTrain.train);
    var lastChar = ds_list_find_value(global.playerTrain.train, size-1);
    ds_list_add(global.playerTrain.train, instance_create(lastChar.x, lastChar.y, obj_ch003));            
    var pos = ds_list_size(global.playerTrain.train) - 1;
    var char = ds_list_find_value(global.playerTrain.train, pos);
    char.pos = pos;
    char.command = lastChar.faceTo;
    ds_list_copy(char.nodeXList,lastChar.nodeXList);
    ds_list_copy(char.nodeYList,lastChar.nodeYList);    
    ds_list_copy(char.nodeDirList,lastChar.nodeDirList);
}
*/

// keyboard control(debug)
if(keyboard_check_pressed(vk_left))
    global.playerTrain.char0.command = FACE_L;
if(keyboard_check_pressed(vk_right))
    global.playerTrain.char0.command = FACE_R;
if(keyboard_check_pressed(vk_up))
    global.playerTrain.char0.command = FACE_U;
if(keyboard_check_pressed(vk_down))
    global.playerTrain.char0.command = FACE_D;     
    
/*    
if(keyboard_check_pressed(vk_f1))
{
    var char = ds_list_find_value(train, 0);
    char.isAlive = false;
}

if(keyboard_check_pressed(vk_f2))
{
    var char = ds_list_find_value(train, 1);
    char.isAlive = false;
}

if(keyboard_check_pressed(vk_f3))
{
    var char = ds_list_find_value(train, 2);
    char.isAlive = false;
}

if(keyboard_check_pressed(vk_f4))
{
    var char = ds_list_find_value(train, 0);
    char.isAlive = false;
    char = ds_list_find_value(train, 1);
    char.isAlive = false;
}
*/    
