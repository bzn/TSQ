swordY = global.deviceH*0.4;

if(sword.y < swordY)
{
    sword.y+= 4;
    if(!isTouch && mouse_check_button_released(mb_left))
    {
        sword.y = swordY;
        isTouch = true;
        touch.alphaType = 2;
        shine.isShine = true;

        scr_snd(snd_title);
    }
}
else
{
    if(!isTouch && mouse_check_button_released(mb_left))
    {
        isTouch = true;
        touch.alphaType = 2;
        shine.isShine = true;        
      
        scr_snd(snd_title);
    }
}

if(isTouch)
{
    sleepTimer--;
    if(sleepTimer <= 0)
    {
        if(global.isTeached)
            room_goto(rom_select);
        else
            room_goto(rom_0);
    }
}
