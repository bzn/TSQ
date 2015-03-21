// setup
window_set_size(640,1136);
randomize();

//global.pause = false;

/*
bluezhin: not work
//Create font
global.font=font_add_sprite(spr_letters,ord("0"),1,-1); //set last argument to -2 in Studio
global.font2=font_add_sprite(spr_letters2,ord("0"),1,-1); //set last argument to -2 in Studio
global.font3=font_add_sprite(spr_letters3,ord("0"),1,1); //set last argument to 0 in Studio
global.font4=font_add_sprite(spr_letters4,ord("0"),1,1); //set last argument to 0 in Studio
draw_set_font(global.font);
*/

//Before loading
for (i=0;i<7;i+=1)
    global.unlocks[i]=0;
global.unlock=0;

//Load options file
generate=0;
scr_load();
scr_generatefile();

//detect joysticks (gamepads - get with the times!)
if (joystick_exists(1) && !global.nojoy){
    global.joy[1]=1;
    global.joybuttons[1]=joystick_buttons(1);
    }
else
    global.joy[1]=0;
if (joystick_exists(2) && !global.nojoy){
    global.joy[2]=1;
    global.joybuttons[2]=joystick_buttons(2);
    }
else
    global.joy[2]=0;
//stuff and things
global.wins1=0;
global.wins2=0;
global.select[0]=0; //selected player character
global.select[1]=0; //in-game sabot reads these as what character you are playing as
global.playedonce=0;
alarm[0]=5;
global.brokenmusic=0;
global.chosenrandom[0]=0;
global.chosenrandom[1]=0;
//Always attempt to load the songs
if (file_exists("title.wav") && file_exists("victory.wav") && file_exists("rainbow.wav") && file_exists("game.wav")){
    global.titlesong=sound_add("title.wav",0,1);
    global.victorysong=sound_add("victory.wav",0,1);
    global.rainbowsong=sound_add("rainbow.wav",0,1);
    global.gamesong=sound_add("game.wav",0,1);
    }
else{
    global.brokenmusic=1;
    global.nomusic=1;
    }
