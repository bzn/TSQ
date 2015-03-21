global.isPlaying = false;
    
global.stageMsgbox.isActive = true;
global.stageMsgbox.type = MSG_CONTINUE;

if(global.language == "chs")
{
    global.stageMsgbox.msgTitle = "     全 军 覆 没";
    
    if(global.bestKill < global.gameKill)
    {
        // new record
        global.stageMsgbox.msgStr[0] = "        杀敌："+string(global.gameKill)+" （新纪录！）";
    }
    else
    {
        global.stageMsgbox.msgStr[0] = "        杀敌："+string(global.gameKill)+" （纪录："+string(global.bestKill)+"）";;
    }
    
    if(global.bestCoin < global.gameCoin)
    {
        // new record
        global.stageMsgbox.msgStr[1] = "        银两："+string(global.gameCoin)+" （新纪录！）";
    }
    else
    {
        global.stageMsgbox.msgStr[1] = "        银两："+string(global.gameCoin)+" （纪录："+string(global.bestKill)+"）";;;
    }
    
    var continueCost = scr_get_continue_cost();
    global.stageMsgbox.msgStr[2] = "";
    global.stageMsgbox.msgStr[3] = "        使用  "+string(continueCost)+"龙珠  续关吗？";
}
else
{
    global.stageMsgbox.msgTitle = "     全 軍 覆 沒";
    
    if(global.bestKill < global.gameKill)
    {
        // new record
        global.stageMsgbox.msgStr[0] = "        殺敵："+string(global.gameKill)+" （新紀錄！）";
    }
    else
    {
        global.stageMsgbox.msgStr[0] = "        殺敵："+string(global.gameKill)+" （紀錄："+string(global.bestKill)+"）";;
    }
    
    if(global.bestCoin < global.gameCoin)
    {
        // new record
        global.stageMsgbox.msgStr[1] = "        銀兩："+string(global.gameCoin)+" （新紀錄！）";
    }
    else
    {
        global.stageMsgbox.msgStr[1] = "        銀兩："+string(global.gameCoin)+" （紀錄："+string(global.bestKill)+"）";;;
    }
    
    var continueCost = scr_get_continue_cost();
    global.stageMsgbox.msgStr[2] = "";
    global.stageMsgbox.msgStr[3] = "        使用  "+string(continueCost)+"龍珠  續關嗎？";
}
