//Menu sabot select
//argument0 1 = singleplayer

//Title screen
if (state==0){

    state=1;
    background_visible[0]=0;
    background_visible[1]=0;
    background_visible[2]=1;
    with (obj_sparkle)
        instance_destroy();
    }

//Start game
else if (state==1){
    //random character
    if (global.select[0]==8){
        global.select[0]=floor(random(7+global.unlock));
        global.chosenrandom[0]=1;
        //Super secret character
        if (random(1)<0.05)
            global.select[0]=9;
        }
    if (global.select[1]==8){
        global.select[1]=floor(random(7+global.unlock));
        global.chosenrandom[1]=1;
        if (random(1)<0.05)
            global.select[1]=9;
        }
    scr_mangraphics();
    //stuff
    if (argument0==1)
        global.singleplayer=1;
    else
        global.singleplayer=0;
    global.unlocks[global.select[0]]=1;
    global.unlocks[global.select[1]]=1;
    room_goto(rom_hunkrump);
    }
