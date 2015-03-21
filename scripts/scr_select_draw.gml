var centerX = global.deviceW * 0.5;
var centerY = global.deviceH * 0.5;
var nameX = uiNameBox.x - 60;
var nameY = uiNameBox.y - 8;
var titleX = uiNameBox.x - 90;
var titleY = uiNameBox.y - 70;

if(global.nowHeroID < 0)
    global.nowHeroID = 1;
var heroLv = global.heroLevel[global.nowHeroID-1];  


if(global.language == "chs")
{
    if(global.heroUnlock[global.nowHeroID-1])
    {
        switch(global.nowHeroID)
        {
            case 1:
                if(heroLv==1) titleStr="玄德";
                else if(heroLv==2) titleStr="玄德";
                else if(heroLv==3) titleStr="玄德";
                else if(heroLv==4) titleStr="皇帝";
                scr_draw_text(nameX,nameY,"刘 备",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 2:
                if(heroLv==1) titleStr="云长";
                else if(heroLv==2) titleStr="云长";
                else if(heroLv==3) titleStr="云长";
                else if(heroLv==4) titleStr="武圣";
                scr_draw_text(nameX,nameY,"关 羽",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 3:
                if(heroLv==1) titleStr="翼德";
                else if(heroLv==2) titleStr="翼德";
                else if(heroLv==3) titleStr="翼德";
                else if(heroLv==4) titleStr="燕人";
                scr_draw_text(nameX,nameY,"张 飞",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 4:
                if(heroLv==1) titleStr="子龙";
                else if(heroLv==2) titleStr="子龙";
                else if(heroLv==3) titleStr="子龙";
                else if(heroLv==4) titleStr="当千";
                scr_draw_text(nameX,nameY,"赵 云",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 5:
                if(heroLv==1) titleStr="孟起";
                else if(heroLv==2) titleStr="孟起";
                else if(heroLv==3) titleStr="孟起";
                else if(heroLv==4) titleStr="锦马超";
                scr_draw_text(nameX,nameY,"马 超",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 6:
                if(heroLv==1) titleStr="汉升";
                else if(heroLv==2) titleStr="汉升";
                else if(heroLv==3) titleStr="汉升";
                else if(heroLv==4) titleStr="神弓";
                scr_draw_text(nameX,nameY,"黄 忠",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 7:
                if(heroLv==1) titleStr="孔明";
                else if(heroLv==2) titleStr="孔明";
                else if(heroLv==3) titleStr="孔明";
                else if(heroLv==4) titleStr="卧龙";
                scr_draw_text(nameX-20,nameY,"诸葛亮",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 8:
                if(heroLv==1) titleStr="士元";
                else if(heroLv==2) titleStr="士元";
                else if(heroLv==3) titleStr="士元";
                else if(heroLv==4) titleStr="凤雏";
                scr_draw_text(nameX,nameY,"庞 统",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 9:
                if(heroLv==1) titleStr="文长";
                else if(heroLv==2) titleStr="文长";
                else if(heroLv==3) titleStr="文长";
                else if(heroLv==4) titleStr="双斧";
                scr_draw_text(nameX,nameY,"魏 延",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 10:
                if(heroLv==1) titleStr="坦之";
                else if(heroLv==2) titleStr="坦之";
                else if(heroLv==3) titleStr="坦之";
                else if(heroLv==4) titleStr="武神";
                scr_draw_text(nameX,nameY,"关 平",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 11:
                if(heroLv==1) titleStr="元化";
                else if(heroLv==2) titleStr="元化";
                else if(heroLv==3) titleStr="元化";
                else if(heroLv==4) titleStr="仁医";
                scr_draw_text(nameX,nameY,"华 陀",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 12:
                if(heroLv==1) titleStr="";
                else if(heroLv==2) titleStr="";
                else if(heroLv==3) titleStr="";
                else if(heroLv==4) titleStr="疾风";
                scr_draw_text(nameX,nameY,"张 苞",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 13:
                if(heroLv==1) titleStr="南蛮";
                else if(heroLv==2) titleStr="南蛮";
                else if(heroLv==3) titleStr="南蛮";
                else if(heroLv==4) titleStr="狂暴";
                scr_draw_text(nameX,nameY,"孟 获",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 14:
                if(heroLv==1) titleStr="夫人";
                else if(heroLv==2) titleStr="夫人";
                else if(heroLv==3) titleStr="夫人";
                else if(heroLv==4) titleStr="火神";
                scr_draw_text(nameX,nameY,"祝 融",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 15:
                if(heroLv==1) titleStr="伯约";
                else if(heroLv==2) titleStr="伯约";
                else if(heroLv==3) titleStr="伯约";
                else if(heroLv==4) titleStr="文武之德";
                scr_draw_text(nameX,nameY,"姜 维",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 16:
                if(heroLv==1) titleStr="奉先";
                else if(heroLv==2) titleStr="奉先";
                else if(heroLv==3) titleStr="奉先";
                else if(heroLv==4) titleStr="天下无双";
                scr_draw_text(nameX,nameY,"吕 布",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
        }
    }
    else
    {
        scr_draw_text(nameX,nameY," ? ? ? ",c_white,font40,3,c_black);
    }
    //objDBallCost.cost = 0;
    //objCoinCost.cost = 0;

    var nowLv = scr_get_hero_lv(global.nowHeroID);
    var pos = global.nowHeroID-1;
    if(pos >= 0)
    {
        if(!global.heroUnlock[pos])
        {
            var cost = scr_get_unlock_cost(global.nowHeroID);
    // objDBallCost.cost = cost;
    // scr_draw_text(objBtnUnlock.x-78, objBtnUnlock.y-20, "UNLOCK",c_white,fnt_nokia28,0,c_black);
    // scr_draw_text(objBtnSelect.x-78, objBtnSelect.y-20, "SELECT",c_white,fnt_nokia28,0,c_black);
            scr_draw_text(objBtnUnlock.x-56, objBtnUnlock.y-30, "解    锁",c_white,font30,1,c_black);
            scr_draw_text(objBtnSelect.x-56, objBtnSelect.y-30, "决    定",c_white,font30,1,c_black);
        }
        else
        {
            if(nowLv < MAX_LEVEL)
            {
                var cost = scr_get_extra_cost(global.nowHeroID);
    // objCoinCost.cost = cost;
            }
    // scr_draw_text(objBtnUnlock.x-92, objBtnUnlock.y-20, "UPGRADE",c_white,fnt_nokia28,0,c_black);
    // scr_draw_text(objBtnSelect.x-78, objBtnSelect.y-20, "SELECT",c_white,fnt_nokia28,0,c_black);
            scr_draw_text(objBtnUnlock.x-56, objBtnUnlock.y-30, "升    级",c_white,font30,1,c_black);
            scr_draw_text(objBtnSelect.x-56, objBtnSelect.y-30, "决    定",c_white,font30,1,c_black);
        }
    }

   if(!global.heroUnlock[pos])
    {
    }
    else
    {
        if(nowLv >= 4)
        {
            // scr_draw_text(uiExp.x-226, uiExp.y-12, "Lv.MAX",c_white,fnt_nokia16,1,c_black);
            scr_draw_text(uiExp.x-202, uiExp.y-12, "Lv.最大",c_white,font16,0,c_black);
        }
        else
        {
            // scr_draw_text(uiExp.x-184, uiExp.y-12, "Lv."+string(heroLv),c_white,fnt_nokia16,1,c_black);
            scr_draw_text(uiExp.x-180, uiExp.y-12, "Lv. "+string(heroLv),c_white,font16,0,c_black);
        }
    }
}
else
{
    if(global.heroUnlock[global.nowHeroID-1])
    {
        switch(global.nowHeroID)
        {
            case 1:
                if(heroLv==1) titleStr="玄德";
                else if(heroLv==2) titleStr="玄德";
                else if(heroLv==3) titleStr="玄德";
                else if(heroLv==4) titleStr="皇帝";
                scr_draw_text(nameX,nameY,"劉 備",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 2:
                if(heroLv==1) titleStr="雲長";
                else if(heroLv==2) titleStr="雲長";
                else if(heroLv==3) titleStr="雲長";
                else if(heroLv==4) titleStr="武聖";
                scr_draw_text(nameX,nameY,"關 羽",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 3:
                if(heroLv==1) titleStr="翼德";
                else if(heroLv==2) titleStr="翼德";
                else if(heroLv==3) titleStr="翼德";
                else if(heroLv==4) titleStr="燕人";
                scr_draw_text(nameX,nameY,"張 飛",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 4:
                if(heroLv==1) titleStr="子龍";
                else if(heroLv==2) titleStr="子龍";
                else if(heroLv==3) titleStr="子龍";
                else if(heroLv==4) titleStr="當千";
                scr_draw_text(nameX,nameY,"趙 雲",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 5:
                if(heroLv==1) titleStr="孟起"; 
                else if(heroLv==2) titleStr="孟起"; 
                else if(heroLv==3) titleStr="孟起";
                else if(heroLv==4) titleStr="錦馬超";
                scr_draw_text(nameX,nameY,"馬 超",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 6:
                if(heroLv==1) titleStr="漢升"; 
                else if(heroLv==2) titleStr="漢升"; 
                else if(heroLv==3) titleStr="漢升"; 
                else if(heroLv==4) titleStr="神弓";
                scr_draw_text(nameX,nameY,"黃 忠",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 7:
                if(heroLv==1) titleStr="孔明"; 
                else if(heroLv==2) titleStr="孔明";
                else if(heroLv==3) titleStr="孔明";
                else if(heroLv==4) titleStr="臥龍";
                scr_draw_text(nameX-20,nameY,"諸葛亮",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 8:
                if(heroLv==1) titleStr="士元"; 
                else if(heroLv==2) titleStr="士元";
                else if(heroLv==3) titleStr="士元";
                else if(heroLv==4) titleStr="鳳雛";
                scr_draw_text(nameX,nameY,"龐 統",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 9:
                if(heroLv==1) titleStr="文長"; 
                else if(heroLv==2) titleStr="文長";
                else if(heroLv==3) titleStr="文長";
                else if(heroLv==4) titleStr="雙斧";
                scr_draw_text(nameX,nameY,"魏 延",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 10:
                if(heroLv==1) titleStr="坦之"; 
                else if(heroLv==2) titleStr="坦之";
                else if(heroLv==3) titleStr="坦之";
                else if(heroLv==4) titleStr="武神";
                scr_draw_text(nameX,nameY,"關 平",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 11:
                if(heroLv==1) titleStr="元化"; 
                else if(heroLv==2) titleStr="元化";
                else if(heroLv==3) titleStr="元化";
                else if(heroLv==4) titleStr="仁醫";
                scr_draw_text(nameX,nameY,"華 陀",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 12:
                if(heroLv==1) titleStr=""; 
                else if(heroLv==2) titleStr="";
                else if(heroLv==3) titleStr="";
                else if(heroLv==4) titleStr="疾風";
                scr_draw_text(nameX,nameY,"張 苞",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 13:
                if(heroLv==1) titleStr="南蠻"; 
                else if(heroLv==2) titleStr="南蠻";
                else if(heroLv==3) titleStr="南蠻";
                else if(heroLv==4) titleStr="狂暴";
                scr_draw_text(nameX,nameY,"孟 獲",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 14:
                if(heroLv==1) titleStr="夫人"; 
                else if(heroLv==2) titleStr="夫人";
                else if(heroLv==3) titleStr="夫人";
                else if(heroLv==4) titleStr="火神";
                scr_draw_text(nameX,nameY,"祝 融",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 15:
                if(heroLv==1) titleStr="伯約"; 
                else if(heroLv==2) titleStr="伯約";
                else if(heroLv==3) titleStr="伯約";
                else if(heroLv==4) titleStr="文武之德";
                scr_draw_text(nameX,nameY,"姜 維",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
            case 16:
                if(heroLv==1) titleStr="奉先"; 
                else if(heroLv==2) titleStr="奉先";
                else if(heroLv==3) titleStr="奉先";
                else if(heroLv==4) titleStr="天下無雙";
                scr_draw_text(nameX,nameY,"呂 布",c_white,font40,3,c_black);
                scr_draw_text(titleX,titleY,scr_make_ttitle_str(titleStr),c_white,font24,3,c_black);
            break;
        } 
    }
    else
    {
        scr_draw_text(nameX,nameY," ? ? ? ",c_white,font40,3,c_black);
    } 
    
    //objDBallCost.cost = 0;
    //objCoinCost.cost = 0;
    
    var nowLv = scr_get_hero_lv(global.nowHeroID);
    var pos = global.nowHeroID-1;
    if(pos >= 0)
    {
        if(!global.heroUnlock[pos])
        {        
            var cost = scr_get_unlock_cost(global.nowHeroID);        
    //        objDBallCost.cost = cost;
    //        scr_draw_text(objBtnUnlock.x-78, objBtnUnlock.y-20, "UNLOCK",c_white,fnt_nokia28,0,c_black); 
    //        scr_draw_text(objBtnSelect.x-78, objBtnSelect.y-20, "SELECT",c_white,fnt_nokia28,0,c_black);          
            scr_draw_text(objBtnUnlock.x-56, objBtnUnlock.y-30, "解    鎖",c_white,font30,1,c_black); 
            scr_draw_text(objBtnSelect.x-56, objBtnSelect.y-30, "決    定",c_white,font30,1,c_black);          
        }
        else
        {        
            if(nowLv < MAX_LEVEL)
            {
                var cost = scr_get_extra_cost(global.nowHeroID);
    //            objCoinCost.cost = cost;
            }
    //        scr_draw_text(objBtnUnlock.x-92, objBtnUnlock.y-20, "UPGRADE",c_white,fnt_nokia28,0,c_black);  
    //        scr_draw_text(objBtnSelect.x-78, objBtnSelect.y-20, "SELECT",c_white,fnt_nokia28,0,c_black);          
            scr_draw_text(objBtnUnlock.x-56, objBtnUnlock.y-30, "升    級",c_white,font30,1,c_black); 
            scr_draw_text(objBtnSelect.x-56, objBtnSelect.y-30, "決    定",c_white,font30,1,c_black);          
        }
    }
    
    if(!global.heroUnlock[pos])
    {
    }
    else
    {
        if(nowLv >= 4)
        {
    //        scr_draw_text(uiExp.x-226, uiExp.y-12, "Lv.MAX",c_white,fnt_nokia16,1,c_black);
            scr_draw_text(uiExp.x-202, uiExp.y-12, "Lv.最大",c_white,font16,0,c_black);
        }
        else
        {
    //        scr_draw_text(uiExp.x-184, uiExp.y-12, "Lv."+string(heroLv),c_white,fnt_nokia16,1,c_black);
            scr_draw_text(uiExp.x-180, uiExp.y-12, "Lv. "+string(heroLv),c_white,font16,0,c_black);
        }
    }
}
    
    
    
    
    
    
    
    

