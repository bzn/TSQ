var x1     = argument0;
var y1     = argument1;
var x2     = argument2;
var y2     = argument3;
var color  = argument4;

draw_set_alpha(0.5);
draw_set_color(color);
draw_rectangle(x1,y1,x2,y2, true);
draw_set_alpha(1);
