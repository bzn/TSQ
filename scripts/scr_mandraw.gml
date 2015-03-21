draw_set_color(cordcol);
draw_line(x,y,target.x,target.y);

drawmecol=c_white;
if (rainbow>0){
    if (rainbow mod 4 == 0) //yeah, this should be a CASE
        drawmecol=c_red;
    else if (rainbow mod 4 == 1)
        drawmecol=c_aqua;
    else if (rainbow mod 4 == 2)
        drawmecol=c_green;
    else if (rainbow mod 4 == 3)
        drawmecol=c_yellow;
    }
draw_sprite_ext(sprite_index,img,x,y,realdrawscale,realdrawscale,lookdir,drawmecol,1);
