var msg = "";
if(global.language == "chs")
{
    msg = scr_get_upgrade_message_chs(global.nowHeroID);
}
else
{
    msg = scr_get_upgrade_message(global.nowHeroID);
}
var heroLV = global.heroLevel[global.nowHeroID-1];

var extraCost = scr_get_extra_cost(global.nowHeroID);

global.msgbox.isActive = true;
global.msgbox.type = MSG_UPGRADE;
if(global.language == "chs")
{
    global.msgbox.msgTitle  = "        升      级";
}
else
{
    global.msgbox.msgTitle  = "        升      級";
}
global.msgbox.msgStr[1] = "          "+msg[0];
global.msgbox.msgStr[2] = "          "+msg[1];
global.msgbox.msgStr[3] = ""+msg[2];
//global.msgbox.msgStr[3] = "";

//extraCost = 30000;

if(heroLV < 4)
{
    if(global.language == "chs")
    {
        global.msgbox.msgStr[0] = "花费  "+scr_num_to_string(extraCost)+"银币  升级吗？";
    }
    else
    {
        global.msgbox.msgStr[0] = "花費  "+scr_num_to_string(extraCost)+"銀幣  升級嗎？";
    }
}
else
{
    if(global.language == "chs")
    {
        global.msgbox.msgStr[0] = "  已经提升到最高等级！";
    }
    else
    {
        global.msgbox.msgStr[0] = "  已經提升到最高等級！";
    }
    global.msgbox.type = MSG_WARNING;
}

global.msgbox.msgLight[0] = false;
global.msgbox.msgLight[1] = false;
global.msgbox.msgLight[2] = false;
global.msgbox.msgLight[3] = false;
global.msgbox.msgLight[4] = false;

if(heroLV == 1)
{
    global.msgbox.msgLight[0] = true;
    global.msgbox.msgClr[0] = c_white;
    global.msgbox.msgClr[1] = c_dkgray;
    global.msgbox.msgClr[2] = c_dkgray;
}
else if(heroLV == 2)
{
    global.msgbox.msgLight[1] = true;
    global.msgbox.msgClr[0] = c_white;
    global.msgbox.msgClr[1] = c_white;
    global.msgbox.msgClr[2] = c_dkgray;
}
else if(heroLV == 3)
{
    global.msgbox.msgLight[2] = true;
    global.msgbox.msgClr[0] = c_white;
    global.msgbox.msgClr[1] = c_white;
    global.msgbox.msgClr[2] = c_white;
}
