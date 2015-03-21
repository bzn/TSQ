if(!instance_exists(playerTrain))
    exit;

// attack(debug)
if(keyboard_check_pressed(vk_f1))
{
    var dekiTrain = ds_list_find_value(dekiTrainList, 0);
    var char = ds_list_find_value(dekiTrain.train, 0);
    char.hp -= 30;
}

// speed up
if(keyboard_check_pressed(vk_f3))
{
    playerTrain.char0.moveSpeedUpTimer = 1000;
    show_debug_message("SPD UP");
}

if(keyboard_check_pressed(vk_f4))
{
    playerTrain.char0.moveSlowDownTimer = 1000;
    show_debug_message("SPD DOWN");    
}

if(keyboard_check_pressed(vk_f5))
{
    global.atkSpeedUp1 = 1;
    show_debug_message("ATK SPD UP 1");
}

if(keyboard_check_pressed(vk_f6))
{
    global.atkSpeedUp2 = 1000;
    show_debug_message("ATK SPD UP 2");
}
if(keyboard_check_pressed(vk_f7))
{
    global.spStrong = 1;
}
// add a new member(debug)
if(keyboard_check_released(vk_space))
{
    var size = ds_list_size(playerTrain.train);
    var lastChar = ds_list_find_value(playerTrain.train, size-1);
    ds_list_add(playerTrain.train, instance_create(lastChar.x, lastChar.y, obj_ch003));            
    var pos = ds_list_size(playerTrain.train) - 1;
    var char = ds_list_find_value(playerTrain.train, pos);
    char.pos = pos;
    char.command = lastChar.faceTo;
    ds_list_copy(char.nodeXList,lastChar.nodeXList);
    ds_list_copy(char.nodeYList,lastChar.nodeYList);    
    ds_list_copy(char.nodeDirList,lastChar.nodeDirList);
}

/*
if(mouse_check_button_released(mb_left))
{
    var size = ds_list_size(playerTrain.train);
    var lastChar = ds_list_find_value(playerTrain.train, size-1);
    ds_list_add(playerTrain.train, instance_create(lastChar.x, lastChar.y, obj_ch003));            
    var pos = ds_list_size(playerTrain.train) - 1;
    var char = ds_list_find_value(playerTrain.train, pos);
    char.pos = pos;
    char.command = lastChar.faceTo;
    ds_list_copy(char.nodeXList,lastChar.nodeXList);
    ds_list_copy(char.nodeYList,lastChar.nodeYList);    
    ds_list_copy(char.nodeDirList,lastChar.nodeDirList);
}
*/

// keyboard control(debug)
if(keyboard_check_pressed(vk_left))
    playerTrain.char0.command = FACE_L;
if(keyboard_check_pressed(vk_right))
    playerTrain.char0.command = FACE_R;
if(keyboard_check_pressed(vk_up))
    playerTrain.char0.command = FACE_U;
if(keyboard_check_pressed(vk_down))
    playerTrain.char0.command = FACE_D;     
    
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
