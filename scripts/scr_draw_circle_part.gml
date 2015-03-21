//return 0;
/* draw_circle_part(x,y,r,ang,off,outline) */
var X,Y,r,ang,off,outline,i;
i=0;
X=argument0; //x position
Y=argument1; //y position
r=argument2; // radius
ang=argument3; // angle of the circle drawn
off=argument4; // offset angle to draw the part
outline=argument5; // whether to only draw an outline T/F 

if(ang == 360)
{
    draw_set_alpha(0.2);
    draw_circle_color(X, Y, r, c_fuchsia, c_fuchsia, outline);
    draw_set_alpha(1.0);   
    return 0; 
}

if!(outline)
{
    draw_primitive_begin(pr_trianglefan);
    draw_vertex_color(X,Y,c_fuchsia,0.2);
} 
else
{
    draw_primitive_begin(pr_linestrip);
}

draw_vertex(X+lengthdir_x(r,off),Y+lengthdir_y(r,off));

repeat(abs(ang)mod 360)
{
    draw_vertex_color(X+lengthdir_x(r,i+off),Y+lengthdir_y(r,i+off),c_fuchsia,0.2);
    i+=1*sign(ang);
}

//draw_line(x,y);

draw_primitive_end();
