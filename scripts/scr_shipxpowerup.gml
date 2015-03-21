//I'm starting to regret this "funny" naming scheme for the scripts by now

//Get powerup
with (other)
    instance_destroy();
global.shakescreen+=20;

//Why am I even doing this twice!?!?
//Big huge man
if (other.sprite_index=spr_powerup1){ //you shouldn't do this
    if (player==1){
        if (obj_man1.rainbow<=0){
            obj_man1.bighugeman=150;
            obj_man1.drawscale=3;
            obj_man1.mask_index=spr_bigman;
            if (global.select[0]==7){
                obj_man1.drawscale=6;
                obj_man1.mask_index=spr_bigman2;
                }
            }
        }
    else{
        if (obj_man2.rainbow<=0){
            obj_man2.bighugeman=150;
            obj_man2.drawscale=3;
            obj_man2.mask_index=spr_bigman;
            if (global.select[1]==7){
                obj_man2.drawscale=6;
                obj_man2.mask_index=spr_bigman2;
                }
            }
        }
    }
//BIG HUGE MAN!!!
if (other.sprite_index=spr_powerup2){
    if (player==1){
        if (obj_man1.rainbow<=0){
            obj_man1.bighugeman=150;
            obj_man1.drawscale=6;
            obj_man1.mask_index=spr_bigman2;
            if (global.select[0]==7){
                obj_man1.drawscale=12;
                obj_man1.mask_index=spr_bigman3;
                }
            }
        }
    else{
        if (obj_man2.rainbow<=0){
            obj_man2.bighugeman=150; //fixed
            obj_man2.drawscale=6;
            obj_man2.mask_index=spr_bigman2;
            if (global.select[1]==7){
                obj_man2.drawscale=12;
                obj_man2.mask_index=spr_bigman3;
                }
            }
        }
    }
//It's so very dumb that I'm doing this twice for separate objects
//Spreadshot
if (other.sprite_index=spr_powerup3){
    spreadshot=150;
    crazyshot=0;
    homingshot=0;
    exploshot=0;
    }
//Crazyshot
if (other.sprite_index=spr_powerup4){
    spreadshot=0;
    crazyshot=150;
    homingshot=0;
    exploshot=0;
    }
//Homing shot
if (other.sprite_index=spr_powerup5){
    spreadshot=0;
    crazyshot=0;
    homingshot=150;
    exploshot=0;
    }
//WTFshot
if (other.sprite_index=spr_powerup6){

    ifactor=15;
    if (global.select[player-1]==7)
        ifactor=3;
    for (i=0;i<360;i+=ifactor){
        global.shakescreen=40;
        tempid=instance_create(x,y,obj_shot);
        tempid.speed=32;
        tempid.direction=i;
        tempid.owner=player;
        if (player==2)
            tempid.sprite_index=spr_shot2;
        tempid.homing=1;
        tempid2=instance_create(x,y,obj_line);
        tempid2.target=tempid;
        if (player==2)
            tempid2.trailcol=c_aqua;
        }
    }
//Exploshot
if (other.sprite_index=spr_powerup7){
    spreadshot=0;
    crazyshot=0;
    homingshot=0;
    exploshot=150;
    }
//Rainbow man
if (other.sprite_index=spr_powerup8){


    obj_sabot.rainbowmusic=180;
    if (player==1)
        obj_man1.rainbow=150;
    else if (player==2)
        obj_man2.rainbow=150;
    if (player==1){
        obj_man1.bighugeman=150;
        obj_man1.drawscale=6;
        obj_man1.mask_index=spr_bigman2;
        if (global.select[0]==7){
            obj_man1.drawscale=12;
            obj_man1.mask_index=spr_bigman3;
            }
        }
    else{
        obj_man2.bighugeman=150;
        obj_man2.drawscale=6;
        obj_man2.mask_index=spr_bigman2;
        if (global.select[1]==7){
            obj_man2.drawscale=12;
            obj_man2.mask_index=spr_bigman3;
            }
        }
    }
