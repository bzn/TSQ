//
// mouse control
//

if(!instance_exists(char0))
    return 0;

/*
// touch problem test  
if(mouse_check_button_pressed(mb_left))
{
    if(char0.command==FACE_U)
        char0.command = FACE_L;
    else
        char0.command = FACE_U;
}
*/

var isMoveCommand = false;  


if(mouse_check_button_pressed(mb_left) && !isMoveCommand)
{
    touchX = mouse_x;
    touchY = mouse_y;
}


 
if(mouse_check_button_released(mb_left))
{    
    isCanCommand = false;
    touchX = -1;
    touchY = -1;
}
