scr_gamecenter_connect();

global.buffBubble = -1;
global.buffHp = -1;
global.buffPower = -1;
global.buffRun = -1;

var centerX = global.deviceW * 0.5;
var centerY = global.deviceH * 0.5 + 60;

hero[0] = instance_create(centerX,centerY,obj_itemhero001);
hero[1] = instance_create(centerX+100,centerY,obj_itemhero002);
hero[2] = instance_create(centerX+200,centerY,obj_itemhero003);
hero[3] = instance_create(centerX+300,centerY,obj_itemhero004);
hero[4] = instance_create(centerX+400,centerY,obj_itemhero005);
hero[5] = instance_create(centerX+500,centerY,obj_itemhero006);
hero[6] = instance_create(920,centerY,obj_itemhero007);
hero[7] = instance_create(920,centerY,obj_itemhero008);
hero[8] = instance_create(920,centerY,obj_itemhero009);
hero[9] = instance_create(920,centerY,obj_itemhero010);
hero[10] = instance_create(920,centerY,obj_itemhero011);
hero[11] = instance_create(920,centerY,obj_itemhero012);
if(MAX_HERO >= 13)
    hero[12] = instance_create(920,centerY,obj_itemhero013);
if(MAX_HERO >= 14)
    hero[13] = instance_create(920,centerY,obj_itemhero014);
if(MAX_HERO >= 15)    
    hero[14] = instance_create(920,centerY,obj_itemhero015);
if(MAX_HERO >= 16)    
    hero[15] = instance_create(920,centerY,obj_itemhero016);

// admob
var adSpMove = 0;                
if(os_device == device_ios_ipad || 
   os_device == device_ios_ipad_retina || 
   os_device == device_ios_ipad_retina)
{
    if(global.isADMOB)
    {
        //ads_enable(40,0,2);
        GoogleMobileAds_AddBanner(global.bannerID, GoogleMobileAds_Leaderboard);  
        adSpMove = 100;
    }
}
else if(os_device == device_ios_iphone5 ||
    os_device == device_ios_iphone ||
    os_device == device_ios_iphone_retina)
{
    if(global.isADMOB)
    {
        //ads_enable(0,0,0);    
        GoogleMobileAds_AddBanner(global.bannerID, GoogleMobileAds_Banner); 
        adSpMove = 120;
    }
}

var bw = GoogleMobileAds_BannerGetWidth();
var bh = GoogleMobileAds_BannerGetHeight();
var px = (display_get_width() - bw)/2;
var py = 0;
GoogleMobileAds_MoveBanner(px,py);

//GoogleMobileAds_ShowInterstitial();

//uiStar = instance_create(centerX-90, centerY-240, obj_ui_star);
uiNameBox = instance_create(centerX, centerY-320, obj_ui_name);
uiExp = instance_create(centerX, centerY-200, obj_ui_exp);
btnUpgrade = instance_create(centerX+174, uiExp.y, obj_btn_upgrade);

uiCoin = instance_create(0, 0 + adSpMove, obj_ui_now_coin);
uiCoin.depth = -999999;
uiDBall = instance_create(0, 60 + adSpMove, obj_ui_dball);
uiDBall.depth = -999999;

addAlpha = -0.02;

objBtnLeft = instance_create(centerX-100, centerY+80, obj_btn_left);
objBtnRight = instance_create(centerX+100, centerY+80, obj_btn_right);


btnRestore = instance_create(global.deviceW-70, global.deviceH-50, obj_btn_restore);

//objDBallCost = instance_create(260, 720, obj_cost_dball);
//objCoinCost = instance_create(260, 720, obj_cost_coin);

objBtnUnlock = instance_create(centerX, centerY+220, obj_btn_unlock);
objBtnSelect = instance_create(centerX, centerY+350, obj_btn_select);

if(global.isDebug)
{
    objBtnReset = instance_create(centerX-100, 60, obj_btn_reset);
    objBtnMoney = instance_create(centerX+100, 60, obj_btn_money);
}

objBtnShop = instance_create(global.deviceW-60, 60 + adSpMove, obj_btn_shop);

global.uiShop = instance_create(global.deviceW*0.5, global.deviceH*0.5, obj_ui_shop);

global.shine = instance_create(0, 0, obj_shine);
global.shine.depth = -9999999;

global.msgbox = instance_create(99999,99999, obj_select_msgbox);
global.msgbox.depth = -999999;

global.loading = instance_create(99999,99999, obj_loading);
global.loading.depth = -999999999;

scr_bgm(snd_select, true);

/*
show_debug_message(string(scr_point_x_circle_part(50,100,200,135,225,0,0)));
show_debug_message(string(scr_point_x_circle_part(-100,90,200,135,225,0,0)));
show_debug_message(string(scr_point_x_circle_part(-50,-100,200,135,225,0,0)));
show_debug_message(string(scr_point_x_circle_part(50,-100,200,135,225,0,0)));
*/

/*
if(scr_point_x_circle_part(0,0,45,135,50,100))
    show_debug_message("IN");
else
    show_debug_message("OUT");
*/

/*
a = arctan (100/50) * 180 / pi;
b = arctan (100/100) * 180 / pi;
c = arctan (50/100) * 180 / pi;

show_debug_message(string(a));
show_debug_message(string(b));
show_debug_message(string(c));
*/
    
//aaa = arctan (100/100) * 180 / pi;
//bbb = arctan (-100/100) * 180 / pi;
/*
aaa = arctan (-100/-100) * 180 / pi;
bbb = arctan (100/-100) * 180 / pi;
show_debug_message(string(aaa));
show_debug_message(string(bbb));
*/
/*
show_debug_message(string(arctan(0)));
show_debug_message(string(arctan(1)));
show_debug_message(string(arctan(2)));
show_debug_message(string(arctan(3)));
*/

/*
//OT
if(scr_point_x_circle_part(0,100,160,30,120,0,0))
    show_debug_message("IN");
else
    show_debug_message("OUT");    
    
//OT
if(scr_point_x_circle_part(100,99,50,45,90,100,100))
    show_debug_message("IN");
else
    show_debug_message("OUT");    
//IN
if(scr_point_x_circle_part(100,101,50,45,90,100,100))
    show_debug_message("IN");
else
    show_debug_message("OUT");    
//OT        
if(scr_point_x_circle_part(101,100,50,45,90,100,100))
    show_debug_message("IN");
else
    show_debug_message("OUT");    
//OT    
if(scr_point_x_circle_part(99,100,50,45,90,100,100))
    show_debug_message("IN");
else
    show_debug_message("OUT");    
*/   
