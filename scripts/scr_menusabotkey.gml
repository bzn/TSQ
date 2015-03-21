//Menu sabot press any key
//argument0 = override keypress
// 1 = joy1 up
// 2 = joy1 down
// 3 = joy1 left
// 4 = joy1 right
// 5 = joy2 up
// 6 = joy2 down
// 7 = joy2 left
// 8 = joy2 right

//keyboard keys
if (keyboard_lastkey!=vk_enter){
    //Left player select - hardcoding this
    //Oh, hey, all of this worked on the first try
    //Clearly I am doing something wrong
    if (keyboard_lastkey==ord("A") || argument0==3){
        global.select[0]-=1;
        if (global.select[0]==-1)
            global.select[0]=3;
        else if (global.select[0]==3)
            global.select[0]=8;
        else if (global.select[0]==7 && !global.unlock)
            global.select[0]=6;
        }
    else if (keyboard_lastkey==ord("D") || argument0==4){
        global.select[0]+=1;
        if (global.select[0]==4)
            global.select[0]=0;
        else if (global.select[0]==9)
            global.select[0]=4;
        else if (global.select[0]==7 && !global.unlock)
            global.select[0]=8;
        }
    else if (keyboard_lastkey==ord("W") || argument0==1){
        if ((global.unlock || global.select[0]!=3) && global.select[0]!=8){ //I'm sorry future Daniel, for having to read this
            global.select[0]-=4;
            if (global.select[0]<0)
                global.select[0]+=8;
            }
        }
    else if (keyboard_lastkey==ord("S") || argument0==2){
        if ((global.unlock || global.select[0]!=3) && global.select[0]!=8){
            global.select[0]+=4;
            if (global.select[0]>7)
                global.select[0]-=8;
            }
        }
    //Player 2
    if (keyboard_lastkey==vk_left || argument0==7){
        global.select[1]-=1;
        if (global.select[1]==-1)
            global.select[1]=3;
        else if (global.select[1]==3)
            global.select[1]=8;
        else if (global.select[1]==7 && !global.unlock)
            global.select[1]=6;
        }
    else if (keyboard_lastkey==vk_right || argument0==8){
        global.select[1]+=1;
        if (global.select[1]==4)
            global.select[1]=0;
        else if (global.select[1]==9)
            global.select[1]=4;
        else if (global.select[1]==7 && !global.unlock)
            global.select[1]=8;
        }
    else if (keyboard_lastkey==vk_up || argument0==5){
        if ((global.unlock || global.select[1]!=3) && global.select[1]!=8){
            global.select[1]-=4;
            if (global.select[1]<0)
                global.select[1]+=8;
            }
        }
    else if (keyboard_lastkey==vk_down || argument0==6){
        if ((global.unlock || global.select[1]!=3) && global.select[1]!=8){
            global.select[1]+=4;
            if (global.select[1]>7)
                global.select[1]-=8;
            }
        }
    }
