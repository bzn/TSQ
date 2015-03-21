//
// check wall hit
//
if(!instance_exists(char0))
    return 0;
    
if(!scr_is_in_area(char0.x,char0.y))
{
    var isAutoTurn = false;
    if(scr_is_mudeki(char0) && char0.bornTimer<=0)
    {
        isAutoTurn = true;
    }
    else if(global.spBubble > 0)
    {
        isAutoTurn = true;
        global.spBubble = -1;
        scr_snd(snd_bubble);
        if(global.spMudeki < 10)
            global.spMudeki = 10;
    }
    
    if(isAutoTurn)
    {
        switch(char0.faceTo)
        {
            case FACE_U:
                char0.y += 10;
                char0.command = FACE_R;
            break;
            case FACE_D:
                char0.y -= 10;
                char0.command = FACE_L;
            break;
            case FACE_L:
                char0.x += 10;
                char0.command = FACE_U;
            break;
            case FACE_R:
                char0.x -= 10;
                char0.command = FACE_D;
            break;
        }
    }
    else
    {
        // gameover
        char0.isAlive = false;
    }
}
