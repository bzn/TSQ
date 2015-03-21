if(global.pause == true)
{
    hspeed = 0;
    vspeed = 0;
    return 0;
}

// set depth by Y
depth = -y*10;

if(flashTimer>0)
    flashTimer--;     
if(bornTimer>0)
    bornTimer--;    
 
var move = 0;
           
switch(faceTo)
{
    case FACE_U:
        atkOffsetNow = atkOffset;
        swingAngle = 0;
        atkCenterX = x;
        atkCenterY = y - 42 + move;
    break;
    case FACE_D:
        atkOffsetNow = atkOffset + 180;
        swingAngle = 180;
        atkCenterX = x;
        atkCenterY = y - 42 - move;
    break;
    case FACE_L:
        atkOffsetNow = atkOffset + 90;    
        swingAngle = 90;
        atkCenterX = x + move;
        atkCenterY = y - 42;
    break;
    case FACE_R:
        atkOffsetNow = atkOffset - 90;      
        swingAngle = 270;
        atkCenterX = x - move;
        atkCenterY = y - 42;
    break;
}

// item nikuman effect
if(addHP)
{
//    show_debug_message("addHP");

    if(hp < maxhp)
    {
        buffLight.image_alpha = 1.0;
        buffLight.timer = 30;
    }
    
    if(hp < maxhp)
    {
        showHpTimer = 200;
        
        hp += addHP;
        if(hp > maxhp)
        {
            hp = maxhp;
        }
    }
    addHP = 0;    
    //showHpTimer = 200;
}
if(delHP)
{
    if(isLeader && !isDeki && global.spBubble >= 1)
    {
        global.spBubble--;
        if(global.spBubble == 0)
            scr_snd(snd_bubble);
        show_debug_message("bubble block");
        delHP = 0;
    }
    else
    {
        hp -= delHP;
        if(hp <= 0)
            hp = 0;
        delHP = 0;
        flashTimer = 10;
        showHpTimer = 200;
    }
}

if(hp <= 0)
{
    hp = 0;
    isAlive = false;
/*    
    if(isDeki)
        show_debug_message("deki hp=0");
    else
        show_debug_message("player hp=0");    
*/        
}
    
// dead
if(!isAlive)
{
//    scr_snd(snd_explo1);
    if(isDeki)
    {
        //show_debug_message("DEAD DEKI" + string(charID));
        scr_snd(snd_dekidead);
    }
    else
    {
        //show_debug_message("DEAD HERO" + string(charID));
        scr_snd(snd_dead);
    }
        
    effFire.isAlive = false;    
    buffIce.isAlive = false;
    shadow.isAlive = false;
//    hpbar.isAlive = false;
    instance_destroy();
    // explosion
//    instance_create(x,y,obj_explo);

    instance_create(x,y,obj_part_kumo);

/*
    if(isDeki)
        show_debug_message("deki dead");
    else
        show_debug_message("player dead"); 
*/
        
    // deki item
    if(isDeki && global.isTeached)
    {
        // show_debug_message("deki drop item");

        itemObj = instance_create(x,y,obj_item);
        itemObj.randomType = RAND_DBALL;
       
        // ....
        //collision_rectangle( x-30, y-30, x+30, y+30, itemObj, false, true );
        scr_add_kill(1);
    }
    
    if(!isDeki)
    {
        scr_del_hero_in_team(charID);
        scr_del_hero_in_map(charID);
    }
}   
 
/*
// move speed buff
moveSpeed = moveSpeedDefault;  
if(moveSpeedUpTimer > 0)
{
    moveSpeed = moveSpeedDefault * 1.5;
}
if(moveSlowDownTimer > 0)
{
    moveSpeed = moveSpeedDefault * 0.5;
}
*/

// char turn
if(1)
{
    faceTo = command;        

    switch(command)
    {
        case FACE_U:
            if(isLeader)
            {
                hspeed = 0;
                vspeed = -moveSpeed;
            }
            sprite_index = spr_up;
        break;
        case FACE_D:
            if(isLeader)
            {
                hspeed = 0;
                vspeed = moveSpeed;
            }
            sprite_index = spr_down;
        break;
        case FACE_L:
            if(isLeader)
            {
                hspeed = -moveSpeed;
                vspeed = 0;
            }
            sprite_index = spr_left;
        break;
        case FACE_R:
            if(isLeader)
            {
                hspeed = moveSpeed;
                vspeed = 0;
            }
            sprite_index = spr_right;
        break;
    }
}

/*
var spd = moveSpeed;
if(moveSpeedUpTimer > 0)
{
    spd = spd * 1.5;
}
if(moveSlowDownTimer > 0)
{
    spd = spd * 0.5;
}

if(hspeed > 0)
    hspeed = spd;
else if(hspeed < 0)
    hspeed = -spd;
else if(vspeed > 0)    
    vspeed = spd;
else if(vspeed < 0)
    vspeed = -spd;
*/

buffLight.x = x;
buffLight.y = y+14;

buffIce.x = x;
buffIce.y = y;
buffIce.depth = depth-1;

// shadow position
shadow.x = x;
shadow.y = y;

// swing posision
swing.x = atkCenterX;
swing.y = atkCenterY;
swing.image_angle = swingAngle;

effFire.x = x;
effFire.y = y;

/*
hpbar.x = x-24;
hpbar.y = y-90;
hpbar.num1 = hp;
hpbar.num2 = maxhp;
hpbar.depth = depth - 99999;
*/

// debug....
//hspeed = 0;
//vspeed = 0;

