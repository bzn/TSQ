state=0; //menu state
//skip title
if (global.playedonce==1){
    state=1;
    background_visible[0]=0;
    background_visible[1]=0;
    background_visible[2]=1;
    }
else{
    state=0;
    background_visible[0]=1;
    background_visible[1]=1;
    background_visible[2]=0;
    }

//unlock
global.unlock=1;
for (i=0;i<7;i+=1){
    if (global.unlocks[i]==0)
        global.unlock=0;
    }

//man sprites
//the character select screen will update these
global.man1idle=spr_man1;
global.man1swing=spr_man1swing;
global.man1victory=spr_man1victory;
global.man1ship=spr_man1ship1;
global.man2idle=spr_man2;
global.man2swing=spr_man2swing;
global.man2victory=spr_man2victory;
global.man2ship=spr_man2ship2;
starttextcyc=0;

global.winquote[0]="YEEEAH";
global.winquote[1]="I<AM<STRONG<MAN";
global.winquote[2]="GET<RIPPED";
global.winquote[3]="?NEIGH?";
global.winquote[4]="FHTAGN<BABY";
global.winquote[5]="YOU<ARE<NOT<READY";
global.winquote[6]="STRONG<LIKE<BEAR";
global.winquote[7]="GET<PAIN<WRECKED";
global.winquote[8]="";
global.winquote[9]="I<AM<MC<CLUCK";
global.charname[0]="MARK";
global.charname[1]="STRONGMAN";
global.charname[2]="COWMAN<RIDER";
global.charname[3]="?MANICORN?";
global.charname[4]="MUSCHTULHU";
global.charname[5]="MASTER<MUSCLE";
global.charname[6]="FATHER?RUSSIA";
global.charname[7]="ULTRA<FISHBUN";
global.charname[8]="RANDOM";
global.charname[9]="MC<CLUCK";
/////////////////////-------------------------
global.chartrait[0]="NO<SPECIAL<POWERS";
global.chartrait[1]="20@<MORE<SHIP<HEALTH";
global.chartrait[2]="LONGER<ROPE";
global.chartrait[3]="RAINBOW<POWER<AT<15@<HP";
global.chartrait[4]="TELEPORT<WHEN<BUMPED";
global.chartrait[5]="FAST<ACCELERATION:REVERSE";
global.chartrait[6]="RETALIATE<WHEN<BUMPED";
global.chartrait[7]="???<SUPER<HUNK<???";
global.chartrait[8]="";
global.chartrait[9]=">>>";

cyc=0;
victorydance=0;
global.singleplayer=0;
menx=4; //columns in character select (note: menx, not xmen)
meny=2; //rows in character select
selectimgcyc=0;
selectimg1=0;
selectimg2=2;
holdjoy=0;
holdjoyprev=0;

//Player chose Random last time
if (global.chosenrandom[0])
    global.select[0]=8;
if (global.chosenrandom[1])
    global.select[1]=8;
global.chosenrandom[0]=0;
global.chosenrandom[1]=0;

//joystick directions
joyup[1]=0;
joydown[1]=0;
joyleft[1]=0;
joyright[1]=0;
joyup[2]=0;
joydown[2]=0;
joyleft[2]=0;
joyright[2]=0;
joyupprev[1]=0;
joydownprev[1]=0;
joyleftprev[1]=0;
joyrightprev[1]=0;
joyupprev[2]=0;
joydownprev[2]=0;
joyleftprev[2]=0;
joyrightprev[2]=0;
