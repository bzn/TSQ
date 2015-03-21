var x1 = argument0;
var y1 = argument1;
var buffer = 0;

if(x1-buffer < 0)
{
    return false;
}
if(x1+buffer > MAP_SIZE)
{
    return false;
}
if(y1-buffer < 0)
{
    return false;
}
if(y1+buffer > MAP_SIZE)
{
    return false;
}
return true;
