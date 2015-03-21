if(global.pause == true)
{
    return 0;
}

buffQ.x = x;
buffQ.y = y-55;
buffQ.depth = depth - 99999;
buffQ.image_alpha = 0;

if(!instance_exists(char0))
    return 0;

// synth xy
x = char0.x;
y = char0.y;
command = char0.command;

global.pTrainX = x;
global.pTrainY = y;

// speed up forever
/*
if(moveSpeedUpTimer>0)    
    moveSpeedUpTimer--;    
*/


if(moveSlowDownTimer>0)
{
    moveSlowDownTimer--;   
}
    
char0.moveSpeed = char0.moveSpeedDefault;
    
if(global.spMoveFast == 1)
{
    char0.moveSpeed = char0.moveSpeedDefault * 1.3;    
}

if(moveSlowDownTimer > 0)
{
    char0.moveSpeed = char0.moveSpeedDefault * 0.7; // 0.5
    buffQ.image_alpha = 1.0;
}

switch(char0.command)
{
    case FACE_U:
        char0.hspeed = 0;
        char0.vspeed = -char0.moveSpeed;
    break;
    case FACE_D:
        char0.hspeed = 0;
        char0.vspeed = char0.moveSpeed;
    break;
    case FACE_L:
        char0.hspeed = -char0.moveSpeed;
        char0.vspeed = 0;
    break;
    case FACE_R:
        char0.hspeed = char0.moveSpeed;
        char0.vspeed = 0;
    break;
}
