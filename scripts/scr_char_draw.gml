// char attack box(debug)
if(atkSpeedDefault > 0)
{
    var extraRadius = 0;

    if(!isDeki && scr_is_kakusei(10))
    {
        extraRadius = floor(atkRadius*0.1);
    }
/*
    // show attack area
    switch(faceTo)
    {
        case FACE_U:
            scr_draw_circle_part(atkCenterX,atkCenterY,atkRadius+extraRadius,atkAngle,atkOffsetNow,false);
        break;
        case FACE_D:
            scr_draw_circle_part(atkCenterX,atkCenterY,atkRadius+extraRadius,atkAngle,atkOffsetNow,false);
        break;
        case FACE_R:
            scr_draw_circle_part(atkCenterX,atkCenterY,atkRadius+extraRadius,atkAngle,atkOffsetNow,false);
        break;
        case FACE_L:
            scr_draw_circle_part(atkCenterX,atkCenterY,atkRadius+extraRadius,atkAngle,atkOffsetNow,false);
        break;
    }    
*/
    
    if(objWeaponSwing != -1)
    { 
        objWeaponSwing.x = atkCenterX;
        objWeaponSwing.y = atkCenterY;
    }
    if(objWeaponSpear != -1)
    { 
        objWeaponSpear.x = atkCenterX;
        objWeaponSpear.y = atkCenterY;
    }
}
    
if(flashTimer > 0)
{
    w = sprite_get_width(sprite_index);
    h = sprite_get_height(sprite_index);
    left = x-w/2;
    right = x+w/2;
    top = y-h;
    bottom = y;
    
    draw_set_blend_mode_ext(bm_inv_dest_color,bm_zero);
    draw_rectangle_color(left,top,right,bottom,c_white,c_white,c_white,c_white,false); //Draw rectancle the size of the sprite
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,image_alpha); //Draw sprite
    draw_set_blend_mode_ext(bm_inv_dest_color,bm_zero);
    draw_rectangle_color(left,top,right,bottom,c_white,c_white,c_white,c_white,false); //Draw rectancle the size of the sprite
    draw_set_blend_mode(bm_normal);
}
else
{
    // char self
    alpha2 = (100-bornTimer)*0.01*0.7;
//    alpha2 = 1.0;
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, -1, 0.3 + alpha2);
}    
    
if(showHpTimer > 0)
{
    showHpTimer--;
}
// char hp
var hpAlpha = showHpTimer/100;
draw_set_alpha(hpAlpha);
scr_draw_hpbar(x-24, y-90, 40, 6, hp, maxhp, c_lime, c_green);
draw_set_alpha(1.0);

// char atk bar
//scr_draw_hpbar(x-24, y-80, 40, 6, atkSpeedDefault-atkSpeed, atkSpeedDefault, c_white, c_gray);

/*
// collison box(debug)
draw_set_alpha(0.5);
draw_set_color(c_white);
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false);
draw_set_alpha(1);
*/
