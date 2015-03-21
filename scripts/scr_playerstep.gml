//that's right, I just put everything into an if statemet
//what are you going to do about it?

if (!ignoreall){
    //Timers
    if (spreadshot>0)
        spreadshot-=1;
    if (crazyshot>0)
        crazyshot-=1;
    if (homingshot>0)
        homingshot-=1;
    if (exploshot>0)
        exploshot-=1;

    //Exploshot
    if (shotcyc<=0 && exploshot>0){

        shotcyc=20;
        if (global.select[player-1]==7)
            shotcyc=2;
        motion_add(lookdir+180,8);
        tempid=instance_create(x,y,obj_exploshot);
        tempid.owner=player;
        tempid.direction=lookdir;
        with (tempid)
            scr_exploshot();
        global.shakescreen+=20;
        //not a suggestive muzzle flare at all
        tempid=instance_create(x,y,obj_explo);
        tempid.direction=lookdir+130;
        tempid.speed=20;
        tempid=instance_create(x,y,obj_explo);
        tempid.direction=lookdir-130;
        tempid.speed=20;
        tempid=instance_create(x,y,obj_explo);
        tempid.direction=lookdir+70;
        tempid.speed=20;
        tempid=instance_create(x,y,obj_explo);
        tempid.direction=lookdir-70;
        tempid.speed=20;
        }
    
    //Shoot constantly because why not
    if (shotcyc<=0 && exploshot==0){
        shotcyc=8;
        if (global.select[player-1]==7)
            shotcyc=2;
        
        //Normal shot for Mc Cluck
        if (global.select[player-1]==9 && homingshot==0 && spreadshot==0 && crazyshot==0 && exploshot==0){

            tempid=instance_create(x,y,obj_shot);
            tempid.speed=10+speed/2;
            tempid.direction=lookdir;
            tempid.owner=player;
            if (player==2)
                tempid.sprite_index=spr_shot2;
            }
        
        //Homing shot
        if (homingshot>0){

            tempid=instance_create(x,y,obj_shot);
            tempid.speed=10+speed/2;
            tempid.direction=lookdir;
            tempid.owner=player;
            if (player==2)
                tempid.sprite_index=spr_shot2;
            if (homingshot>0){
                tempid.homing=1;
                tempid2=instance_create(x,y,obj_line);
                tempid2.target=tempid;
                if (player==2)
                    tempid2.trailcol=c_aqua;
                }
            }
        //Spreadshot
        if (spreadshot>0){

            tempid=instance_create(x,y,obj_shot);
            tempid.speed=10+speed/2;
            tempid.direction=lookdir;
            tempid.owner=player;
            if (player==2)
                tempid.sprite_index=spr_shot2;
            tempid=instance_create(x,y,obj_shot);
            tempid.speed=8+speed/2;
            tempid.direction=lookdir+20;
            tempid.owner=player;
            if (player==2)
                tempid.sprite_index=spr_shot2;
            tempid=instance_create(x,y,obj_shot);
            tempid.speed=8+speed/2;
            tempid.direction=lookdir-20;
            tempid.owner=player;
            if (player==2)
                tempid.sprite_index=spr_shot2;
            }
        //Crazyshot
        if (crazyshot>0){

            ifactor=30;
            if (global.select[player-1]==7)
                ifactor=10;
            for (i=0;i<360;i+=ifactor){
                tempid=instance_create(x,y,obj_shot);
                tempid.speed=12+speed/2+(i mod 60)/8;
                tempid.direction=i+lookdir;
                tempid.owner=player;
                if (player==2)
                    tempid.sprite_index=spr_shot2;
                }
            }
        }
    else
        shotcyc-=1; //this isn't maybe probably really not the best way to do it
    
    //Move
    if (player==2 && !global.singleplayer){
        if (keyboard_check(vk_up))
            motion_add(lookdir,accel);
        else if (keyboard_check(vk_down))
            motion_add(lookdir+180,accel);
        if (keyboard_check(vk_left))
            lookdir+=turnspeed;
        else if (keyboard_check(vk_right))
            lookdir-=turnspeed;
        //joystick 1
        //this is going to be potentially buggy
        //if you have a controller plugged in, it might detect
        //and hold down a direction, making ghost inputs
        //this is THE dumbest looking code ever:
        if (global.joy[1]==1){
            if (joystick_direction(1)==vk_numpad8 || joystick_direction(1)==vk_numpad7 || joystick_direction(1)==vk_numpad9)
                motion_add(lookdir,accel);
            else if (joystick_direction(1)==vk_numpad2 || joystick_direction(1)==vk_numpad1 || joystick_direction(1)==vk_numpad3)
                motion_add(lookdir+180,accel);
            if (joystick_direction(1)==vk_numpad4 || joystick_direction(1)==vk_numpad1 || joystick_direction(1)==vk_numpad7)
                lookdir+=turnspeed;
            else if (joystick_direction(1)==vk_numpad6 || joystick_direction(1)==vk_numpad3 || joystick_direction(1)==vk_numpad9)
                lookdir-=turnspeed;
            }
        }
    else if (player==1){
        if (keyboard_check(ord("W")))
            motion_add(lookdir,accel);
        else if (keyboard_check(ord("S")))
            motion_add(lookdir+180,accel);
        if (keyboard_check(ord("A")))
            lookdir+=turnspeed;
        else if (keyboard_check(ord("D")))
            lookdir-=turnspeed;
        //joystick 2
        if (global.joy[2]==1){
            if (joystick_direction(2)==vk_numpad8 || joystick_direction(2)==vk_numpad7 || joystick_direction(2)==vk_numpad9)
                motion_add(lookdir,accel);
            else if (joystick_direction(2)==vk_numpad2 || joystick_direction(2)==vk_numpad1 || joystick_direction(2)==vk_numpad3)
                motion_add(lookdir+180,accel);
            if (joystick_direction(2)==vk_numpad4 || joystick_direction(2)==vk_numpad1 || joystick_direction(2)==vk_numpad7)
                lookdir+=turnspeed;
            else if (joystick_direction(2)==vk_numpad6 || joystick_direction(2)==vk_numpad3 || joystick_direction(2)==vk_numpad9)
                lookdir-=turnspeed;
            }
        }
    
    //So-called "AI" Player 2
    //Flies at random and doesn't afraid of anything
    if (global.singleplayer && player==2){
        aicyc-=1;
        if (aicyc<=0){
            aicyc=10+floor(random(20));
            aicontrol1=floor(random(3));
            //Avoid running into walls please... if that's alright with you I mean...
            aicontrol=0;
            if ((x<128 && lookdir>90 && lookdir<270) && random(1)<0.5){
                if (lookdir>180)
                    aicontrol1=1;
                else
                    aicontrol1=2;
                }
            else if ((x>room_width-128 && lookdir<90 || lookdir>270) && random(1)<0.5){
                if (lookdir>180)
                    aicontrol1=2;
                else
                    aicontrol1=1;
                }
            if ((y<128 && lookdir>0 && lookdir<180) && random(1)<0.5){
                if (lookdir>90)
                    aicontrol1=1;
                else
                    aicontrol1=2;
                }
            else if ((y>room_height-128 && lookdir<360 && lookdir>180) && random(1)<0.5){
                if (lookdir>270)
                    aicontrol1=1;
                else
                    aicontrol1=2;
                }
            }
        motion_add(lookdir,accel);
        if (aicontrol1==1)
            lookdir+=turnspeed;
        else if (aicontrol1==2)
            lookdir-=turnspeed;
        }
       
    //Stuff
    image_angle=lookdir;
    if (invincible>0)
        invincible-=1;
    if (invincible mod 2==0) //make the ships flicker
        visible=1;
    else
        visible=0;
    speed*=0.98;
    if (speed<=0.1)
        speed=0;
    
    //Rainbow powerup
    if (!onetimerainbow && hp<15 && ((player==1 && global.select[0]==3) || (player==2 && global.select[1]==3))){
        onetimerainbow=1;
        (instance_create(x,y,obj_powerup)).sprite_index=spr_powerup8;
        }
    
    //Death
    if (hp<=0){
        instance_destroy();

        repeat(60){
            tempid=instance_create(x,y,obj_explo);
            tempid.speed=32+random(32);
            tempid.direction=random(360);
            }
        repeat(20){
            tempid=instance_create(x,y,obj_debris);
            tempid.image_single=player-1;
            tempid.speed*=4; //hacksy
            tempid.ttl*=4;
            tempid.explospew=1;
            instance_create(x,y,obj_explospewer);
            }
        if (player==1){
            with (obj_man1){
                instance_destroy();
                instance_create(x,y,obj_explo);
                }
            }
        else if (player==2){ //really
            with (obj_man2){
                instance_destroy();
                instance_create(x,y,obj_explo);
                }
            }
        }
    
    //Damaged by room edges - there was a bug here. it's gone now.
    if (x<8){
        x=10;
        hspeed=maxspeed;
        if (global.sidehurts){
            if (invincible==0){
                hp-=10;
                invincible=10;
                }
            global.shakescreen+=20;
            }
        }
    if (y<8){
        y=10;
        vspeed=maxspeed;
        if (global.sidehurts){
            if (invincible==0){
                hp-=10;
                invincible=10;
                }
            global.shakescreen+=20;
            }
        }
    if (x>room_width-8){
        x=room_width-10;
        hspeed=-maxspeed;
        if (global.sidehurts){
            if (invincible==0){
                hp-=10;
                invincible=10;
                }
            global.shakescreen+=20;
            }
        }
    if (y>room_height-8){
        y=room_height-10;
        vspeed=-maxspeed;
        if (global.sidehurts){
            if (invincible==0){
                hp-=10;
                invincible=10;
                }
            global.shakescreen+=20;
            }
        }
    if (speed>maxspeed)
        speed=maxspeed;
    }
