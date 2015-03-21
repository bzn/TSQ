//victory check
//wait a minute, both players can die at the same time...
//let's support a draw then I guess
//wait, why is this logic in draw()!?!? oh well

//usually, you'll want to do logic in step, not draw.
//Draw is always executed last so your logic might not work like you expect
if (!instance_exists(obj_p1)){
    p1dead=1;
    if (!awarded2){
        awarded2=1;
        global.wins2+=1;
        }
    //victory text for player 2
    draw_set_color(c_white);
    temptext=global.winquote[global.select[1]]; //this line making programmers cry since 2013
    draw_text(floor(room_width/2)-string_length(temptext)*12-2+floor(random(5)),floor(room_height/2)+200-2+floor(random(5)),temptext);
    }
if (!instance_exists(obj_p2)){
    p2dead=1;
    if (!awarded1){
        awarded1=1;
        global.wins1+=1;
        }
    //victory text for player 1
    draw_set_color(c_white);
    temptext=global.winquote[global.select[0]]; //I'm sorry future Daniel
    draw_text(floor(room_width/2)-string_length(temptext)*12-2+floor(random(5)),floor(room_height/2)-200-2+floor(random(5)),temptext);
    }
if (p1dead || p2dead){
    if (!victory){

        }
    victory=1;
    if (victoryscale<1){
        victoryscale+=0.04;
        victoryrot+=60;
        if (victoryscale>=1)
            victoryscale=1;
        }
    else if (victoryscale==1){
        victoryrot=0;
        victorycyc+=1;
        if (victorycyc==120){

//            room_goto(rom_title);
            }
        }
    
    //just change the image according to victory state
    if (p1dead)
        victorytype=1;
    if (p2dead)
        victorytype=0;
    if (p1dead && p2dead) //so whatever
        victorytype=2;
    if (victorycyc mod 16<4)
        victorydance=0;
    else if (victorycyc mod 16<8)
        victorydance=1;
    else if (victorycyc mod 16<12)
        victorydance=2;
    else
        victorydance=3;
    victorypop+=30;
    if (victorypop>360)
        victorypop-=360;
    //draw_sprite_ext(spr_victory,victorytype,floor(room_width/2),floor(room_height/2),victoryscale,victoryscale,victoryrot,c_white,1);
    if (victorytype==0) //player 1 wins
        draw_sprite_ext(global.man1victory,victorydance,floor(room_width/2)-1+floor(random(3)),floor(room_height/2)-1+floor(random(3)),victoryscale*10+sin(degtorad(victorypop)),victoryscale*10-cos(degtorad(victorypop)),victoryrot,c_white,1);
    else if (victorytype==1) //player 2 wins
        draw_sprite_ext(global.man2victory,victorydance,floor(room_width/2)-1+floor(random(3)),floor(room_height/2)-1+floor(random(3)),victoryscale*10+sin(degtorad(victorypop)),victoryscale*10-cos(degtorad(victorypop)),victoryrot,c_white,1);
    else if (victorytype==2){ //draw
        draw_sprite_ext(global.man1victory,victorydance,floor(room_width/2)-1+floor(random(3))-128,floor(room_height/2)-1+floor(random(3)),victoryscale*10+sin(degtorad(victorypop)),victoryscale*10-cos(degtorad(victorypop)),victoryrot,c_white,1);
        draw_sprite_ext(global.man2victory,victorydance,floor(room_width/2)-1+floor(random(3))+128,floor(room_height/2)-1+floor(random(3)),victoryscale*10+sin(degtorad(victorypop)),victoryscale*10-cos(degtorad(victorypop)),victoryrot,c_white,1);
        }
    }

//healthbars
if (instance_exists(obj_p1))
    bar1img=ceil(obj_p1.hp/(obj_p1.maxhp/10));
else
    bar1img=0;
draw_sprite(spr_healthbar,bar1img,4,4); //it's funny that my code is so undocumented
if (instance_exists(obj_p2))
    bar2img=ceil(obj_p2.hp/(obj_p2.maxhp/10));
else
    bar2img=0;
draw_sprite(spr_healthbar,bar2img+11,room_width-128-4,4);
//portraits
//just wing it buddy
if (p1dead)
    draw_sprite(spr_smallportrait,8,160,32);
else
    draw_sprite(spr_smallportrait,global.select[0],160,32);
if (p2dead)
    draw_sprite(spr_smallportrait,8,room_width-160,32);
else
    draw_sprite(spr_smallportrait,global.select[1],room_width-160,32);


//draw win count
//player 1
if (global.wins1>999)
    global.wins1=999;
if (global.wins2>999)
    global.wins2=999;
centerwins1=0;
if (global.wins1>=100)
    centerwins1+=8; //not the best way to do this ever. but this is a game jam
if (global.wins1>=10)
    centerwins1+=8;
if (global.wins1>=100)
    draw_sprite(spr_numbers,floor(global.wins1/100) mod 100,32+centerwins1+4,68+4); //it works!
if (global.wins1>=10)
    draw_sprite(spr_numbers,floor(global.wins1/10) mod 10,48+centerwins1+4,68+4);
draw_sprite(spr_numbers,global.wins1 mod 10,64+centerwins1+4,68+4);
//player 2
centerwins2=0;
if (global.wins2>=100)
    centerwins2+=8;
if (global.wins2>=10)
    centerwins2+=8;
if (global.wins2>=100)
    draw_sprite(spr_numbers,floor(global.wins2/100) mod 100 +10,room_width-96+centerwins2-4,68+4);
if (global.wins2>=10)
    draw_sprite(spr_numbers,floor(global.wins2/10) mod 10 +10,room_width-80+centerwins2-4,68+4);
draw_sprite(spr_numbers,global.wins2 mod 10 +10,room_width-64+centerwins2-4,68+4);

//Combo meter
for (i=0;i<2;i+=1){
    if (combocyc[i]>0){
        combocyc[i]-=1;
        if (combocyc[i]==0)
            combo[i]=1; //stop at 1, not 0
        //Limit combo here
        if (combo[i]>9)
            combo[i]=9;
        //Scale meter
        if (comboscale[i]>1)
            comboscale[i]-=0.25;
        if (comboscale[i]<1)
            comboscale[i]=1;
        //Draw combo if over 1
        if (combo[i]>1){
            if (i==0)
                combox=32;
            else
                combox=room_width-112;
            draw_sprite_ext(spr_numbers,combo[i]+i*10,combox,96,comboscale[i],comboscale[i],0,c_white,1);
            draw_sprite_ext(spr_combo,i,combox+16,96,comboscale[i],comboscale[i],0,c_white,1);
            }
        }
    }


//time to HACK
//starting countdown
starttime+=1;
if (startscale>1)
    startscale-=0.8;
else if (startscale<1){
    startscale=1; //rounding fix... that turned out better than I thought
    if (startimg<3){

        }
    else{

        global.shakescreen=20;
        }
    }
if (starttime==20){
    startimg=1;
    startscale=8;
    }
else if (starttime==40){
    startimg=2;
    startscale=8;
    }
else if (starttime==60){
    startimg=3;
    startscale=8;
    }
else if (starttime==80){
    startimg=4;
    obj_p1.ignoreall=0;
    obj_p2.ignoreall=0;
    }

if (startimg<3)
    draw_sprite_ext(spr_countdown,startimg,room_width/2,room_height/2,startscale,startscale,0,c_white,1);
else if (startimg==3){
    draw_sprite_ext(spr_countdown,3,room_width/2-96,room_height/2,startscale,startscale,0,c_white,1);
    draw_sprite_ext(spr_countdown,4,room_width/2-32,room_height/2,startscale,startscale,0,c_white,1);
    draw_sprite_ext(spr_countdown,5,room_width/2+32,room_height/2,startscale,startscale,0,c_white,1);
    draw_sprite_ext(spr_countdown,6,room_width/2+96,room_height/2,startscale,startscale,0,c_white,1);
    }
