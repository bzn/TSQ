//Cowman
if ((man==1 && global.select[0]==2) || (man==2 && global.select[1]==2)){
    maxstretch=256+128;
    slowmedown=0.985;
    }

//Scale smoothly
if (drawscale>realdrawscale)
    realdrawscale+=0.5;
else if (drawscale<realdrawscale)
    realdrawscale-=0.5;
if (realdrawscale<1)
    realdrawscale=1; //just because

//Rainbows
if (rainbow>0){
    rainbow-=1;
    (instance_create(x,y,obj_rainbow)).image_angle=direction;
    (instance_create(x-hspeed/2,y-vspeed/2,obj_rainbow)).image_angle=direction;
    instance_create(floor(x-64+random(128)),floor(y-64+random(128)),obj_sparkle);
    }

//Closeness extends when the man is bigger and huger (and buggier)
closefactor=drawscale*40;
//Swing bat when close to other player
if (man==2 && instance_exists(obj_p1)){
    if (point_distance(x,y,obj_p1.x,obj_p1.y)<32+closefactor && swing==0){
        swing=3; //Nils says to put a 3 here
        img=0;
        sprite_index=global.man2swing;

        }
    }
else if (man==1 && instance_exists(obj_p2)){
    if (point_distance(x,y,obj_p2.x,obj_p2.y)<32+closefactor && swing==0){
        swing=3; //here too
        img=0;
        sprite_index=global.man1swing;

        }
    }

//Stuff
lookdir=point_direction(x,y,target.x,target.y)+90;
if (bighugeman>0){
    bighugeman-=1;
    if (bighugeman==0){
        if (alwaysbig){
            drawscale=3;
            mask_index=spr_bigman;
            }
        else{
            drawscale=1;
            mask_index=spr_man1;
            }
        }
    }

////"Realistic" "bungeee" "physics"
//Elastic cord
if (abs(x-target.x)>32)
    hspeed-=(x-target.x)/elasticity;
if (abs(y-target.y)>32)
    vspeed-=(y-target.y)/elasticity;
//Slow down
speed*=slowmedown;
//Maximum stretch
if (point_distance(x,y,target.x,target.y)>maxstretch)
    speed*=0.9;

//Swing image cycle
if (swing>0){
    imgcyc+=1;
    if (imgcyc==2){
        imgcyc=0;
        swing-=1;
        img+=1;
        if (swing==0){
            img=floor(random(4));
            if (man==1) //it's starting to get dumb now
                sprite_index=global.man1idle;
            else
                sprite_index=global.man2idle;
            }
        }
    }
