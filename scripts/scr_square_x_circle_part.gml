var atkChar = argument0;
var defChar = argument1;

var extraRadius = 0;

if(!atkChar.isDeki && scr_is_kakusei(10))
{
    extraRadius = floor(atkChar.atkRadius*0.1);
}

var dist = scr_point_x_circle_part(defChar.x,defChar.y,atkChar.atkRadius+extraRadius,atkChar.atkOffsetNow,atkChar.atkOffsetNow+atkChar.atkAngle,atkChar.atkCenterX,atkChar.atkCenterY);
return dist;

/*
// test
if(scr_point_x_circle_part(defChar.bbox_left,defChar.bbox_top,atkChar.atkRadius+extraRadius,atkChar.atkOffsetNow,atkChar.atkOffsetNow+atkChar.atkAngle,atkChar.atkCenterX,atkChar.atkCenterY))
    return true;
if(scr_point_x_circle_part(defChar.bbox_left,defChar.bbox_bottom,atkChar.atkRadius+extraRadius,atkChar.atkOffsetNow,atkChar.atkOffsetNow+atkChar.atkAngle,atkChar.atkCenterX,atkChar.atkCenterY))
    return true;
if(scr_point_x_circle_part(defChar.bbox_right,defChar.bbox_top,atkChar.atkRadius+extraRadius,atkChar.atkOffsetNow,atkChar.atkOffsetNow+atkChar.atkAngle,atkChar.atkCenterX,atkChar.atkCenterY))
    return true;
if(scr_point_x_circle_part(defChar.bbox_right,defChar.bbox_bottom,atkChar.atkRadius+extraRadius,atkChar.atkOffsetNow,atkChar.atkOffsetNow+atkChar.atkAngle,atkChar.atkCenterX,atkChar.atkCenterY))
    return true;            
*/
    
/*    
if(scr_point_x_circle_part(atkChar.x,atkChar.y,atkChar.atkRadius,atkChar.atkOffset,atkChar.atkOffset+atkChar.atkAngle,defChar.bbox_left,defChar.bbox_top))
    return true;    
if(scr_point_x_circle_part(atkChar.x,atkChar.y,atkChar.atkRadius,atkChar.atkOffset,atkChar.atkOffset+atkChar.atkAngle,defChar.bbox_right,defChar.bbox_bottom))
    return true;    
if(scr_point_x_circle_part(atkChar.x,atkChar.y,atkChar.atkRadius,atkChar.atkOffset,atkChar.atkOffset+atkChar.atkAngle,defChar.bbox_right,defChar.bbox_top))
    return true;
if(scr_point_x_circle_part(atkChar.x,atkChar.y,atkChar.atkRadius,atkChar.atkOffset,atkChar.atkOffset+atkChar.atkAngle,defChar.bbox_left,defChar.bbox_bottom))
    return true;
*/    

//return false;
