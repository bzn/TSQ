//
// moving AI
//
if(global.pause == true)
{
    return 0;
}

if(!instance_exists(char0))
    return 0;

if(ds_list_size(char0.nodeXList)>0)
    return 0;   

// forzen
if(forzenTimer > 0)
    return 0;
       
if(moveSlowDownTimer>0)
    moveSlowDownTimer--;   
    
char0.moveSpeed = char0.moveSpeedDefault;
    
if(moveSpeedUpTimer > 0)
{
    char0.moveSpeed = char0.moveSpeedDefault * 1.2;
}

if(moveSlowDownTimer > 0)
{
    char0.moveSpeed = char0.moveSpeedDefault * 0.6; // 0.5
    
}

// move alarm
minAlarm = 150; // 50
maxAlarm = 250; // 300
    
// AI moving in map
buffer = 10;
if(char0.x-buffer < global.mapLeft)
{
    // new alarm
    moveAlarm = 0;
    char0.x += char0.moveSpeed+buffer;
}
else if(char0.x+buffer > global.mapRight)
{
    // new alarm
    moveAlarm = 0;
    char0.x -= char0.moveSpeed+buffer;
}

if(char0.y-buffer < global.mapUp)
{
    moveAlarm = 0;
    char0.y += char0.moveSpeed+buffer;
}
else if(char0.y+buffer > global.mapDown)
{
    moveAlarm = 0;
    char0.y -= char0.moveSpeed+buffer;
}

// move AI
if(moveAlarm > 0)
{
    moveAlarm--;
}
else
{
    // new alarm
    moveAlarm = irandom_range(minAlarm, maxAlarm);
    // new direction
    directionList = ds_list_create();
    // space buffer
    buffer = 20;
    switch(char0.faceTo)
    {
        case FACE_U:
            if(char0.x-buffer > global.mapLeft && char0.x-global.mapLeft > 100)
                ds_list_add(directionList, FACE_L);
            if(char0.x+buffer < global.mapRight && global.mapRight-char0.x > 100)
                ds_list_add(directionList, FACE_R);
        break;
        case FACE_D:
            if(char0.x-buffer > global.mapLeft && char0.x-global.mapLeft > 100)
                ds_list_add(directionList, FACE_L);
            if(char0.x+buffer < global.mapRight && global.mapRight-char0.x > 100)
                ds_list_add(directionList, FACE_R);
        break;
        case FACE_L:
            if(char0.y-buffer > global.mapUp && char0.y-global.mapUp > 100)
                ds_list_add(directionList, FACE_U);
            if(char0.y+buffer < global.mapDown && global.mapDown-char0.y > 100)
                ds_list_add(directionList, FACE_D);       
        break;
        case FACE_R:
            if(char0.y-buffer > global.mapUp && char0.y-global.mapUp > 100)
                ds_list_add(directionList, FACE_U);
            if(char0.y+buffer < global.mapDown && global.mapDown-char0.y > 100)
                ds_list_add(directionList, FACE_D);         
        break;  
        default:
            if(char0.y-buffer > global.mapUp && char0.y-global.mapUp > 100)
                ds_list_add(directionList, FACE_U);
            if(char0.y+buffer < global.mapDown && global.mapDown-char0.y > 100)
                ds_list_add(directionList, FACE_D);                               
            if(char0.x-buffer > global.mapLeft && char0.x-global.mapLeft > 100)
                ds_list_add(directionList, FACE_L);
            if(char0.x+buffer < global.mapRight && global.mapRight-char0.x > 100)
                ds_list_add(directionList, FACE_R);
        break;            
    }
    size = ds_list_size(directionList);
    pos = irandom_range(1,size) - 1;
    char0.command = ds_list_find_value(directionList, pos);
    //show_message(string(char0.x)+","+string(char0.y));
    //show_message(string(char0.command));
}
