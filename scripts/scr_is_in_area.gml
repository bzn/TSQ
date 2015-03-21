var x1 = argument0;
var y1 = argument1;
var buffer = 10;

if(x1-buffer < global.mapLeft)
{
    return false;
}
if(x1+buffer > global.mapRight)
{
    return false;
}
if(y1-buffer < global.mapUp)
{
    return false;
}
if(y1+buffer > global.mapDown)
{
    return false;
}
return true;
