//Get powerup
with (other)
    instance_destroy();
global.shakescreen+=20;

//big huge man
if (other.sprite_index=spr_powerup1){ //you shouldn't do this
    if (rainbow<=0){
        bighugeman=150;
        drawscale=3;
        mask_index=spr_bigman;
        //Fishbun bigger
        if (global.select[man-1]==7){
            drawscale=6;
            mask_index=spr_bigman2;
            }
        }
    }
//BIG HUGE MAN!!!
if (other.sprite_index=spr_powerup2){
    if (rainbow<=0){
        bighugeman=150;
        drawscale=6;
        mask_index=spr_bigman2;
        //Fishbun bigger
        if (global.select[man-1]==7){
            drawscale=12;
            mask_index=spr_bigman3;
            }
        }
    }
//Spreadshot
if (other.sprite_index=spr_powerup3){
    if (man==1 && instance_exists(obj_p1)){
        obj_p1.spreadshot=150;
        obj_p1.crazyshot=0;
        obj_p1.homingshot=0;
        obj_p1.exploshot=0;
        }
    else if (man==2 && instance_exists(obj_p2)){
        obj_p2.spreadshot=150;
        obj_p2.crazyshot=0;
        obj_p2.homingshot=0;
        obj_p2.exploshot=0;
        }
    }
//Crazyshot
if (other.sprite_index=spr_powerup4){
    if (man==1 && instance_exists(obj_p1)){
        obj_p1.spreadshot=0;
        obj_p1.crazyshot=150;
        obj_p1.homingshot=0;
        obj_p1.exploshot=0;
        }
    else if (man==2 && instance_exists(obj_p2)){
        obj_p2.spreadshot=0;
        obj_p2.crazyshot=150;
        obj_p2.homingshot=0;
        obj_p2.exploshot=0;
        }
    }
//homing shot
if (other.sprite_index=spr_powerup5){
    if (man==1 && instance_exists(obj_p1)){
        obj_p1.spreadshot=0;
        obj_p1.crazyshot=0;
        obj_p1.homingshot=150;
        obj_p1.exploshot=0;
        }
    else if (man==2 && instance_exists(obj_p2)){
        obj_p2.spreadshot=0;
        obj_p2.crazyshot=0;
        obj_p2.homingshot=150;
        obj_p2.exploshot=0;
        }
    }
//WTFshot
if (other.sprite_index=spr_powerup6){

    ifactor=15;
    if (global.select[man-1]==7)
        ifactor=3;
    for (i=0;i<360;i+=ifactor){ //nah, doing it the better way...
        global.shakescreen=40;
        if (man==1)
            tempid=instance_create(obj_p1.x,obj_p1.y,obj_shot);
        else
            tempid=instance_create(obj_p2.x,obj_p2.y,obj_shot);
        tempid.speed=32;
        tempid.direction=i;
        tempid.owner=man;
        if (man==2)
            tempid.sprite_index=spr_shot2;
        tempid.homing=1;
        tempid2=instance_create(x,y,obj_line);
        tempid2.target=tempid;
        if (man==2)
            tempid2.trailcol=c_aqua;
        }
    }
//Exploshot
if (other.sprite_index=spr_powerup7){
    if (man==1 && instance_exists(obj_p1)){
        obj_p1.spreadshot=0;
        obj_p1.crazyshot=0;
        obj_p1.homingshot=0;
        obj_p1.exploshot=150;
        }
    else if (man==2 && instance_exists(obj_p2)){
        obj_p2.spreadshot=0;
        obj_p2.crazyshot=0;
        obj_p2.homingshot=0;
        obj_p2.exploshot=150;
        }
    }
//Rainbow man
if (other.sprite_index=spr_powerup8){

    obj_sabot.rainbowmusic=180;
    rainbow=150;
    bighugeman=150;
    drawscale=6;
    mask_index=spr_bigman2;
    //Fishbun bigger
    if (global.select[man-1]==7){
        drawscale=12;
        mask_index=spr_bigman3;
        }
    }
