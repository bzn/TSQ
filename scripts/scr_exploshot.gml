//Piercing hitscan projectile
for (ii=0;ii<140;ii+=1){
    //wait, this worked on the first try.
    //clearly I am doing something wrong.
    x+=cos(degtorad(direction))*8;
    y-=sin(degtorad(direction))*8;
    instance_create(x-12+random(24),y-12+random(24),obj_explo);
    if (owner=1){
        if (place_meeting(x,y,obj_p2) && !spent){
            obj_p2.hp-=5;
            repeat(8)
                (instance_create(obj_p2.x,obj_p2.y,obj_debris)).image_single=1;
            with (obj_p2){
                if (instance_exists(obj_p1)){
                    motion_add(obj_p1.lookdir,8);
                    tempid=instance_create(x,y,obj_explo);
                    tempid.speed=10;
                    tempid.direction=obj_p1.lookdir+90;
                    tempid=instance_create(x,y,obj_explo);
                    tempid.speed=10;
                    tempid.direction=obj_p1.lookdir-90;
                    tempid=instance_create(x,y,obj_explo);
                    tempid.speed=20;
                    tempid.direction=obj_p1.lookdir+90;
                    tempid=instance_create(x,y,obj_explo);
                    tempid.speed=20;
                    tempid.direction=obj_p1.lookdir-90;
                    }
                }
            spent=1; //prevent multihits
            }
        }
    else if (owner=2){
        if (place_meeting(x,y,obj_p1) && !spent){
            obj_p1.hp-=5;
            repeat(8)
                (instance_create(obj_p1.x,obj_p1.y,obj_debris)).image_single=0;
            with (obj_p1){
                if (instance_exists(obj_p2)){
                    motion_add(obj_p2.lookdir,8);
                    tempid=instance_create(x,y,obj_explo);
                    tempid.speed=10;
                    tempid.direction=obj_p2.lookdir+90;
                    tempid=instance_create(x,y,obj_explo);
                    tempid.speed=10;
                    tempid.direction=obj_p2.lookdir-90;
                    tempid=instance_create(x,y,obj_explo);
                    tempid.speed=20;
                    tempid.direction=obj_p2.lookdir+90;
                    tempid=instance_create(x,y,obj_explo);
                    tempid.speed=20;
                    tempid.direction=obj_p2.lookdir-90;
                    }
                }
            spent=1;
            }
        }
    //hit asteroids
    tempid2=-1;
    tempid2=instance_position(x,y,obj_obstacle);
    if (tempid2>-1){
        with (tempid2){
            instance_destroy();
            repeat(8)
                (instance_create(other.x,other.y,obj_debris)).image_single=2+floor(random(3));
            }
        }
    }
instance_destroy();
