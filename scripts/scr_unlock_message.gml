if(global.language == "chs")
{
    var msg = scr_get_upgrade_message_chs(global.nowHeroID);
    
    global.msgbox.isActive = true;
    global.msgbox.type = MSG_UNLOCK;
    global.msgbox.msgTitle = "        解      锁";
    global.msgbox.msgStr[0] = "";
    global.msgbox.msgStr[1] = "";
    global.msgbox.msgStr[2] = "";
    global.msgbox.msgStr[3] = "";
    global.msgbox.msgStr[4] = "";
    global.msgbox.msgStr[5] = "          立即购买这个英雄？";
    global.msgbox.msgStr[6] = " （也可以透过 Stage"+string(global.nowHeroID-3)+" 解锁）";
    
    global.msgbox.msgClr[0] = c_dkgray;
    global.msgbox.msgClr[1] = c_dkgray;
    global.msgbox.msgClr[2] = c_dkgray;
}
else
{
    var msg = scr_get_upgrade_message(global.nowHeroID);
    
    global.msgbox.isActive = true;
    global.msgbox.type = MSG_UNLOCK;
    global.msgbox.msgTitle = "        解      鎖";
    global.msgbox.msgStr[0] = "";
    global.msgbox.msgStr[1] = "";
    global.msgbox.msgStr[2] = "";
    global.msgbox.msgStr[3] = "";
    global.msgbox.msgStr[4] = "";
    global.msgbox.msgStr[5] = "          立即購買這個英雄？";
    global.msgbox.msgStr[6] = " （也可以透過 Stage"+string(global.nowHeroID-3)+" 解鎖）";
    
    global.msgbox.msgClr[0] = c_dkgray;
    global.msgbox.msgClr[1] = c_dkgray;
    global.msgbox.msgClr[2] = c_dkgray;
}
