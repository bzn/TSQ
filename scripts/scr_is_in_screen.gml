var obj = argument0;
var buffer = 100;

if(obj.x < view_xview - buffer)
{
    return false;
}
if(obj.x > view_xview + global.deviceW + buffer)
{
    return false;
}
if(obj.y < view_yview - buffer)
{
    return false;
}
if(obj.y > view_yview + global.deviceH + buffer)
{
    return false;
}
return true;
