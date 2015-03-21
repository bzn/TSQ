if(global.pause)
{
    hspeed = 0;
    vspeed = 0;
    show_debug_message("spd="+string(spd));
    return 0;
}

if(spd>0)
{
    move_towards_point(targetX,targetY,spd);
}

if(!scr_is_in_map(x,y))
{
    instance_destroy();
    return 0;
}

if(!isAlive)
{
    instance_destroy();
}
