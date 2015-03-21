posX        = argument0;
posY        = argument1;
str         = argument2;
color1      = argument3;
font        = argument4;
designSize  = argument5;
color2      = argument6;

draw_set_font(font);

size = 1;
for(var i=0;i<designSize;i++)
{
    draw_set_color(color2);
    draw_text(posX+size,posY+size,str);
    draw_text(posX+size,posY-size,str);
    draw_text(posX-size,posY+size,str);
    draw_text(posX-size,posY-size,str);
    size++;
}

draw_set_color(color1);
draw_text(posX,posY,str);

