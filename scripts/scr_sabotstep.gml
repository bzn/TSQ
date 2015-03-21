//SABOT is the world controller in all my games ever
//it's a reference to TreadMarks where the world controller was a TankGod instance named SABOT
//the more you know *star*

// i highjacked remars computer, i have the power to destroy everything!!! muahuahauhuahuahu
//maninboots! noooooooooooooooooooooooo! I'll get youuuuuu if it's the last thing I doooooooooooooooooooooooooooooooo

//kinda reminds me of a game
//-Popcari

//rainbow music
if (rainbowmusic>0){
    rainbowmusic-=1;
    if (rainbowmusic==0){

        }
    }

//shake screen
//it is time
if (global.shakescreen>0){
    global.shakescreen-=1;
    if (global.shakescreen>0){
        view_xview[0]=-round((global.shakescreen/6)+random(global.shakescreen/3));
        view_yview[0]=-round((global.shakescreen/6)+random(global.shakescreen/3));
        }
    else{
        view_xview[0]=0;
        view_yview[0]=0;
        }
    }
if (global.shakescreen>40)
    global.shakescreen=40;

//spawn obstacles
if (obstaclecyc<=0){
    obstaclecyc=20+floor(random(60));
    if (!global.noasteroids){
        temprand=floor(random(4)); //cant' be bothered finding the fastest way of doing this during a jam
        //up
        if (temprand==0){
            tempid=instance_create(random(room_width),-32,obj_obstacle);
            tempid.direction=random(90)+225;
            }
        //left
        else if (temprand==1){
            tempid=instance_create(-32,random(room_height),obj_obstacle);
            tempid.direction=random(90)-45;
            }
        //down
        else if (temprand==2){
            tempid=instance_create(random(room_width),room_height+32,obj_obstacle);
            tempid.direction=random(90)+45;
            }
        //right
        else if (temprand==3){ //thanks Daviex!
            tempid=instance_create(room_width+32,random(room_height),obj_obstacle);
            tempid.direction=random(90)+135;
            }
        }
    }
else
    obstaclecyc-=1;

//COPY AND PASTE BABY
//spawn powerup
//more powerups! they are good for you
if (powerupcyc<=0){
    powerupcyc=50+floor(random(140));
    temprand=floor(random(4));
    if (!global.noitems){
        //up
        if (temprand==0){
            tempid=instance_create(random(room_width),-32,obj_powerup);
            //tempid.direction=random(90)+225;
            tempid.direction=point_direction(tempid.x,tempid.y,100+random(600),100+random(400));
            }
        //left
        else if (temprand==1){
            tempid=instance_create(-32,random(room_height),obj_powerup);
            //tempid.direction=random(90)-45;
            tempid.direction=point_direction(tempid.x,tempid.y,100+random(600),100+random(400));
            }
        //down
        else if (temprand==2){
            tempid=instance_create(random(room_width),room_height+32,obj_powerup);
            //tempid.direction=random(90)+45;
            tempid.direction=point_direction(tempid.x,tempid.y,100+random(600),100+random(400));
            }
        //right
        else if (temprand==3){ //thanks again
            tempid=instance_create(room_width+32,random(room_height),obj_powerup);
            //tempid.direction=random(90)+135;
            tempid.direction=point_direction(tempid.x,tempid.y,100+random(600),100+random(400));
            }
        }
    }
else
    powerupcyc-=1;
