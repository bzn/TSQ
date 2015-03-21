//
// mouse control
//

if(!instance_exists(char0))
    return 0;

/*
// touch problem test  
if(mouse_check_button_pressed(mb_left))
{
    if(char0.command==FACE_U)
        char0.command = FACE_L;
    else
        char0.command = FACE_U;
}
*/

var isMoveCommand = false;  
if(mouse_check_button(mb_left) && isCanCommand)
{    
    effectDistance = 40;            // binnkanndo
    xDistance = mouse_x - touchX;
    yDistance = mouse_y - touchY;
    
    if(char0.faceTo == FACE_U || char0.faceTo == FACE_D)
    {
        if(abs(xDistance) >= effectDistance)
        {
            isMoveCommand = true;
            if(xDistance > 0)
            {
                char0.command = FACE_R;
                isCanCommand = false;
            }
            else
            {
                char0.command = FACE_L;                
                isCanCommand = false;
            }
        }
    }
    
    if(char0.faceTo == FACE_L || char0.faceTo == FACE_R)
    {
        if(abs(yDistance) >= effectDistance)
        {
            isMoveCommand = true;        
            if(yDistance > 0)
            {
                char0.command = FACE_D;
                isCanCommand = false;
            }
            else
            {
                char0.command = FACE_U;                
                isCanCommand = false;
            }
        }
    }
}

if(mouse_check_button_pressed(mb_left) && !isMoveCommand)
{
    touchX = mouse_x;
    touchY = mouse_y;
    
//    show_debug_message(string(touchX)+","+string(touchY));

    if(global.isDebug)
    {    
        // add hero (debug)
        if(touchX>=view_xview && touchX<=view_xview+120 && touchY >=view_yview && touchY <= view_yview+120)
        {
            var heroID = scr_random_unuse_hero_id();
            if(heroID > 0)
            {
                scr_add_hero(heroID);
            }
        }
        
        // kill all (debug)
        if(touchX>=view_xview+global.deviceW-120 && touchX<=view_xview+global.deviceW && touchY >=view_yview && touchY <= view_yview+120)
        {
            var sizeDTrainList = ds_list_size(global.dekiTrainList);
            for(var i=0;i<sizeDTrainList;i++)
            {
                var dekiTrain = ds_list_find_value(global.dekiTrainList, i);
                var sizeDTrain = ds_list_size(dekiTrain.train);
                for(var j=0;j<sizeDTrain;j++)
                {
                    dChar = ds_list_find_value(dekiTrain.train, j);
                    dChar.hp = 0;
                }
            }
        }
    
        if(touchX>=view_xview+global.deviceW-120 && touchX<=view_xview+global.deviceW && touchY >=view_yview+global.deviceH-120 && touchY <= view_yview+global.deviceH)
        {
            scr_next_stage();
        }
    }
    
    // pause button
    if(touchX>=view_xview && touchX<=view_xview+120 && touchY >=view_yview+global.deviceH-120 && touchY <= view_yview+global.deviceH)
    {        
        if(global.pause = true)
        {
            global.pause = false;
            scr_snd(snd_unpause);
            scr_bgm_resume();
        }
        else
        {
            global.pause = true;
            scr_snd(snd_pause);
            scr_bgm_pause();
        }
    }
    else
    {
        if(global.pause == false)
            isCanCommand = true;
    }
}


 
if(mouse_check_button_released(mb_left))
{    
    isCanCommand = false;
    touchX = -1;
    touchY = -1;
}
