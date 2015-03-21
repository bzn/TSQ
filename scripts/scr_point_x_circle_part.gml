// scr_point_x_circle_part(cx:Number, cy:Number, rad:Number, startAng:Number, endAng:Number, px:Number, py:Number)
var cicrleX, circleY, radius, startAng, endAng, pointX, pointY;
pointX     = argument0;
pointY     = argument1;
radius     = argument2;
startAng   = argument3;
endAng     = argument4;
circleX    = argument5;
circleY    = argument6;

// rect collision
if(pointX <= circleX - radius)
    return -1;
if(pointX >= circleX + radius)
    return -1;
if(pointY <= circleY - radius)
    return -1;
if(pointY >= circleY + radius)
    return -1;

// check distance
var dist = point_distance(pointX, pointY, circleX, circleY);
if(dist > radius)
    return -1;
if(dist == 0)
    return dist;
    
// check angle
px = pointX - circleX;
py = -(pointY - circleY);

if(px == 0)
{
    if(py>0)        pa = 90;
    else if(py<0)   pa = 270;
    if(py==0)       return dist;    // impossible
}
else
{
    pa = abs(arctan (py/px) * 180 / pi);
}

if(px >= 0 && py >= 0)
    pa = pa;
else if(px <= 0 && py >= 0)
    pa = 180 - pa;
else if(px <= 0 && py <= 0)
    pa += 180;
else if(px >= 0 && py <= 0)
    pa = 360 - pa;
    
if(pa >= startAng && pa <= endAng)
    return dist;    
    
return -1;    
