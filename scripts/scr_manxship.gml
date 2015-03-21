//Man x ship = shipping?

//Hacking it to the mmmmmax
if (other.invincible==0){
    //teleport if Muschtulhu
    if ((other.player==1 && global.select[0]==4) || (other.player==2 && global.select[1]==4)){
        repeat(20){
            tempid=instance_create(other.x-16+floor(random(32)),other.y-16+floor(random(32)),obj_sparkle);
            tempid.speed=random(4);
            tempid.imgscale=0.5+random(0.5);
            tempid.direction=point_direction(tempid.x,tempid.y,other.x,other.y)+180;
            }
        other.x=floor(random(700)+50);
        other.y=floor(random(300)+50);
        repeat(20){
            tempid=instance_create(other.x-16+floor(random(32)),other.y-16+floor(random(32)),obj_sparkle);
            tempid.speed=random(4);
            tempid.imgscale=0.5+random(0.5);
            tempid.direction=point_direction(tempid.x,tempid.y,other.x,other.y)+180;
            }
        }
    
    //fireback if Father Russia
    if ((other.player==1 && global.select[0]==6) || (other.player==2 && global.select[1]==6)){
        with (other){

            global.shakescreen=40;
            for (i=0;i<5;i+=1){
                tempid=instance_create(x,y,obj_shot);
                tempid.speed=10+speed/2;
                tempid.direction=lookdir-50+i*10;
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
        }
    //knockback
    other.hspeed+=hspeed*0.5; //works for now
    other.vspeed+=vspeed*0.5;
    //give Ultra Fishbun way more ship knockback
    if (man==1 && global.select[0]==7){
        other.hspeed+=hspeed*3;
        other.vspeed+=vspeed*3;
        }
    else if (man==2 && global.select[1]==7){
        other.hspeed+=hspeed*3;
        other.vspeed+=vspeed*3;
        }
    direction+=180; //prevent doing too much damage
    instance_create(other.x,other.y,obj_explo);

    //Bounce away
    if (speed<5)
        speed=5;
    if (rainbow>0)
        other.hp-=15;
    else
        other.hp-=10;
    other.invincible=10;
    global.shakescreen+=20;
    repeat(8)
        (instance_create(other.x,other.y,obj_debris)).image_single=other.player-1;
    if (obj_sabot.combocyc[man-1]>0)
        obj_sabot.combo[man-1]+=1;
    obj_sabot.combocyc[man-1]=45;
    obj_sabot.comboscale[man-1]=4;
    }
