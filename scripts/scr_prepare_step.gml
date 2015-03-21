if(btnBubble.isClick)
{
    btnBubble.isClick = false;
    if(!global.msgbox.isActive && global.buffBubble == -1 && !uiGoShop.isActive)
    {
        global.msgbox.question = 1;
        global.msgbox.action = 0;
        global.msgbox.isActive = true;
        global.msgbox.type = MSG_QUESTION;
        global.msgbox.msgTitle  = "【神 器】護 盾";
        global.msgbox.msgStr[0] = "";
        global.msgbox.msgStr[1] = "";
        global.msgbox.msgStr[2] = "              花費 1 龍珠";
        global.msgbox.msgStr[3] = "抵擋3次攻擊，或1次衝撞";
        global.msgbox.picID = 1;
    }
}

if(btnHp.isClick)
{
    btnHp.isClick = false;
    if(!global.msgbox.isActive && global.buffHp == -1 && !uiGoShop.isActive)
    {
        global.msgbox.question = 2;
        global.msgbox.action = 0;
        global.msgbox.isActive = true;
        global.msgbox.type = MSG_QUESTION;
        global.msgbox.msgTitle  = "【神 器】生 命";
        global.msgbox.msgStr[0] = "";
        global.msgbox.msgStr[1] = "";
        global.msgbox.msgStr[2] = "              花費 1 龍珠";
        global.msgbox.msgStr[3] = "      全員生命提升20%";
        global.msgbox.picID = 2;
    }
}

if(btnPower.isClick)
{
    btnPower.isClick = false;
    if(!global.msgbox.isActive && global.buffPower == -1 && !uiGoShop.isActive)
    {
        global.msgbox.question = 3;
        global.msgbox.action = 0;
        global.msgbox.isActive = true;
        global.msgbox.type = MSG_QUESTION;
        global.msgbox.msgTitle  = "【神 器】力 量";
        global.msgbox.msgStr[0] = "";
        global.msgbox.msgStr[1] = "";
        global.msgbox.msgStr[2] = "              花費 1 龍珠";
        global.msgbox.msgStr[3] = "      全員攻擊提升10%";
        global.msgbox.picID = 3;
    }
}

if(btnRun.isClick)
{
    btnRun.isClick = false;
    if(!global.msgbox.isActive && global.buffRun == -1 && !uiGoShop.isActive)
    {   
        global.msgbox.question = 4;
        global.msgbox.action = 0;
        global.msgbox.isActive = true;
        global.msgbox.type = MSG_QUESTION;
        global.msgbox.msgTitle  = "【神 器】神 速";
        global.msgbox.msgStr[0] = "";
        global.msgbox.msgStr[1] = "";
        global.msgbox.msgStr[2] = "              花費 1 龍珠";
        global.msgbox.msgStr[3] = "      全員走速提升25%";
        global.msgbox.picID = 4;
    }
}

if(global.msgbox.question != 0 && global.msgbox.action == 1)
{
    if(global.nowDBall <= 0)
    {
        uiGoShop.isActive = true;
    }
    else
    {
        global.nowDBall--;
        // add buff
        switch(global.msgbox.question)
        {
            case 1:
                global.buffBubble = 1;
            break;
            case 2:
                global.buffHp = 1;
            break;
            case 3:
                global.buffPower = 1;
            break;
            case 4:
                global.buffRun = 1;
            break;
        }
        scr_snd(snd_buff);
        scr_save_game();
    }
    
    global.msgbox.question = 0;
    global.msgbox.action = 0;
}

if(uiGoShop.action == 1)
{
    uiGoShop.action = 0;
    show_debug_message("go shop");
    uiShop.isActive = true;
}

if(objBtnPlay.isClick)
{
    objBtnPlay.isClick = false;
    if(!uiGoShop.isActive && !uiShop.isActive && !global.msgbox.isActive)
    {
        //room_goto(rom_stage);
        
        // Stage Data
        var stageDataID = global.nowStage;
        // stage loop!
        if(global.nowStage >= MAX_STAGE)
        {
            stageDataID = (global.nowStage - MAX_STAGE) % 5 + 15;
        }
        stageData = global.stageData[stageDataID - 1];
        
        global.stageRoomID     = real(ds_list_get(stageData,1));
/*        
        if(stageDataID >= MAX_STAGE)
        {
            global.stageRoomID = stageDataID%5 + 1;
        }
*/        
        global.mapLeft = 310;
        global.mapRight = 1590;
        global.mapUp = 310;
        global.mapDown = 1590;
        
        switch(global.stageRoomID)
        {
            case 1:
                global.mapLeft = 350;
                global.mapRight = 1560;
                global.mapUp = 360;
                global.mapDown = 1570;
                room_goto(rom_1);
                show_debug_message("ROM1");
            break;
            case 2:
                global.mapLeft = 320;
                global.mapRight = 1600;
                global.mapUp = 320;
                global.mapDown = 1610;
                room_goto(rom_2);
                show_debug_message("ROM2");
            break;    
            case 3:
                global.mapLeft = 350;
                global.mapRight = 1560;
                global.mapUp = 360;
                global.mapDown = 1580;    
                room_goto(rom_3);
                show_debug_message("ROM3");
            break;    
            case 4:
                global.mapLeft = 320;
                global.mapRight = 1600;
                global.mapUp = 320;
                global.mapDown = 1610;
                room_goto(rom_4);
                show_debug_message("ROM4");
            break;
            case 5:
                global.mapLeft = 350;
                global.mapRight = 1560;
                global.mapUp = 360;
                global.mapDown = 1570; 
                room_goto(rom_5);
                show_debug_message("ROM5");
            break;
        }
    }
}

