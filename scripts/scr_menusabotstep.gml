//ooh, shiny
if (state==0){
    if (random(1)<0.05)
        (instance_create(60*2+floor(random(254*2)),129*2+floor(random(47*2)),obj_sparkle)).boosted=1;
    if (random(1)<0.15)
        (instance_create(221*2+floor(random(71*2)),22*2+floor(random(93*2)),obj_sparkle)).boosted=1;
    }

//Select character with joystick
//gonna hax this and duct tape it to scr_menusabotkey
for (i=1;i<3;i+=1){
    joyupprev[i]=joyup[i];
    joydownprev[i]=joydown[i];
    joyleftprev[i]=joyleft[i];
    joyrightprev[i]=joyright[i];
    joyup[i]=0;
    joydown[i]=0;
    joyleft[i]=0;
    joyright[i]=0;
    }
if (global.joy[1]==1){
    if (joystick_direction(1)==vk_numpad8 || joystick_direction(1)==vk_numpad7 || joystick_direction(1)==vk_numpad9)
        joyup[1]=1;
    else if (joystick_direction(1)==vk_numpad2 || joystick_direction(1)==vk_numpad1 || joystick_direction(1)==vk_numpad3)
        joydown[1]=1;
    if (joystick_direction(1)==vk_numpad4 || joystick_direction(1)==vk_numpad1 || joystick_direction(1)==vk_numpad7)
        joyleft[1]=1;
    else if (joystick_direction(1)==vk_numpad6 || joystick_direction(1)==vk_numpad3 || joystick_direction(1)==vk_numpad9)
        joyright[1]=1;
    }
if (global.joy[2]==1){
    if (joystick_direction(2)==vk_numpad8 || joystick_direction(2)==vk_numpad7 || joystick_direction(2)==vk_numpad9)
        joyup[2]=1;
    else if (joystick_direction(2)==vk_numpad2 || joystick_direction(2)==vk_numpad1 || joystick_direction(2)==vk_numpad3)
        joydown[2]=1;
    if (joystick_direction(2)==vk_numpad4 || joystick_direction(2)==vk_numpad1 || joystick_direction(2)==vk_numpad7)
        joyleft[2]=1;
    else if (joystick_direction(2)==vk_numpad6 || joystick_direction(2)==vk_numpad3 || joystick_direction(2)==vk_numpad9)
        joyright[2]=1;
    }
//Simulate keypress
if (joyup[1] && !joyupprev[1])
    scr_menusabotkey(5);
else if (joydown[1] && !joydownprev[1])
    scr_menusabotkey(6);
if (joyleft[1] && !joyleftprev[1])
    scr_menusabotkey(7);
else if (joyright[1] && !joyrightprev[1])
    scr_menusabotkey(8);
if (joyup[2] && !joyupprev[2])
    scr_menusabotkey(1);
else if (joydown[2] && !joydownprev[2])
    scr_menusabotkey(2);
if (joyleft[2] && !joyleftprev[2])
    scr_menusabotkey(3);
else if (joyright[2] && !joyrightprev[2])
    scr_menusabotkey(4);

//Press joystick buttons - menu selection
holdjoyprev=holdjoy;
holdjoy=0;
if (global.joy[1]){
    for (i=0;i<global.joybuttons[1];i+=1){
        if (joystick_check_button(1,i))
            holdjoy=1;
        }
    }
if (global.joy[2]){
    for (i=0;i<global.joybuttons[2];i+=1){
        if (joystick_check_button(2,i))
            holdjoy=1;
        }
    }
/*    
if (holdjoy && !holdjoyprev)
    scr_menusabotselect();
*/
