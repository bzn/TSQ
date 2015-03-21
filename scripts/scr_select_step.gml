var centerX = global.deviceW * 0.5;
var centerY = global.deviceH * 0.5;

var heroID = global.nowHeroID;
var heroPos = heroID-1;

if(heroPos < 0)
    return 0;

// rating button
if(global.isRating == -1 && global.totalCoin > 10)
{
    global.isRating = 1;
    if(os_type == os_ios)
    {
        if(global.language == "chs")
        {
            shop_leave_rating("喜欢我们的游戏吗？请评价给予我们鼓励！", "Okay!", "Not Today!", "itms-apps://itunes.apple.com/app/id888572934");
        }
        else if(global.language == "cht")
        {
            shop_leave_rating("喜歡我們的遊戲嗎？請評價給予我們鼓勵！", "Okay!", "Not Today!", "itms-apps://itunes.apple.com/app/id888572934");
        }
        else
        {
            shop_leave_rating("Thanks for playing the game! Why not leave a comment?", "Okay!", "Not Today!", "itms-apps://itunes.apple.com/app/id888572934");
        }
    }
}
    
for(var i=0;i<MAX_HERO;i++)
{  
    hero[i].x = centerX + 100 * i - heroPos*100;
}

for(var i=0;i<MAX_HERO;i++)
{    
    var heroID = i+1;   
    var heroLV = scr_get_hero_lv(heroID);
    
    if(global.heroUnlock[i])
    {
        switch(heroLV)
        {
            case 1:
                hero[i].sprite_index = hero[i].spr_lv1;
            break;
            case 2:
                hero[i].sprite_index = hero[i].spr_lv2;
            break;
            case 3:
                hero[i].sprite_index = hero[i].spr_lv3;
            break;
            case 4:
                hero[i].sprite_index = hero[i].spr_lv4;
            break;
        }
            
        if(i != heroPos)
        {
            hero[i].image_xscale = 0.5;
            hero[i].image_yscale = 0.5;  
            hero[i].image_speed = 0;
            hero[i].image_index = 0;
//            hero[i].sprite_index = hero[i].spr_static;        
        }
        else
        {            
            hero[i].image_xscale = 1.0;
            hero[i].image_yscale = 1.0;  
            hero[i].image_speed = 0.2;
            
//            hero[i].sprite_index = hero[i].spr_lv3;
//            hero[i].sprite_index = hero[i].spr_big;
        }                              
    }
    else
    {
        hero[i].sprite_index = hero[i].spr_lock;        
        if(i != heroPos)
        {
            hero[i].image_xscale = 0.5;
            hero[i].image_yscale = 0.5;
            hero[i].image_alpha = 1.0;
        }
        else
        {
            hero[i].image_xscale = 1.0;
            hero[i].image_yscale = 1.0;  
        }
    }
}

if(!global.heroUnlock[heroPos])
{
    if(hero[heroPos].image_alpha > 1.0)
        addAlpha = -0.02;
    if(hero[heroPos].image_alpha <= 0.3)
        addAlpha = +0.02;
    hero[heroPos].image_alpha += addAlpha;    
}
else
{
    if(hero[heroPos].image_alpha != 1.0)
    {
        hero[heroPos].image_alpha = 1.0;        
    }
}

if(global.msgbox.isActive || global.uiShop.isActive || global.loading.isActive)
{
    objBtnUnlock.isActive = false;
    objBtnSelect.isActive = false;
    objBtnLeft.isActive = false;
    objBtnRight.isActive = false;
    objBtnShop.isActive = false;
    btnUpgrade.isActive = false;
}
else
{
    objBtnUnlock.isActive = true;
    objBtnSelect.isActive = true;
    objBtnLeft.isActive = true;
    objBtnRight.isActive = true;    
    objBtnShop.isActive = true;
    btnUpgrade.isActive = true;
}

if(objBtnShop.isClick)
{
    objBtnShop.isClick = false;
    global.uiShop.isActive = true;
}

if(btnRestore.isClick)
{
    btnRestore.isClick = false;
    scr_iap_restore();
}


