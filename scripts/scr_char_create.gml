//image_speed     = 0.1;                      // anim speer
faceTo          = -1;                       // direction
command         = -1;                       // player command
sprite_index    = spr_down;                 // default anim

isLeader        = false;                    // head of train
isAlive         = true;                     // destroy when false

isIceHit        = false;
icePower        = 0;
isFireHit       = false;
firePower       = 0;
isAxeHit       = false;
axePower       = 0;

atkCounter = 0;

buffLight = instance_create(x, y, obj_eff_light);
buffLight.depth = -9999;

buffIce = instance_create(x, y, obj_eff_ice);
buffIce.depth = -9999;

shadow = instance_create(x, y, obj_shadow);
shadow.image_alpha = 0.5;

nodeXList       = ds_list_create();           // ?��?移�?路�?
nodeYList       = ds_list_create();           // ?��?移�?路�?
nodeDirList     = ds_list_create();           // ?��?移�?路�?

addHP = 0;
delHP = 0;

bornTimer = 100;
flashTimer = 0;

showHpTimer = 0;

//swingX = x;
//swingY = y;
atkCenterX = x;
atkCenterY = y - 36;
swingAngle = 0;
swing = instance_create(atkCenterX,atkCenterY,obj_swing);
swing.image_alpha = 0.5;

if(global.spHeart > 0 && !isDeki)
{
    maxhp = maxhp * 1.2;
    hp = maxhp;
    show_debug_message("STRONGER!");
}

if(isDeki)
{
    //maxhp += global.dekiHpPlus;
    hp = maxhp;
}

// attack offset change with direction
atkOffsetNow = atkOffset;

effFire = instance_create(x, y, obj_part_fire);

objWeaponSwing = -1;
objWeaponSpear = -1;

if(!isDeki)
{
    if(charID == 1)
    {
        objWeaponSwing = instance_create(atkCenterX,atkCenterY,obj_weapon_swing);        
        objWeaponSwing.sprite_index = spr_weapon_1;
    }
    else if(charID == 2)
    {
        objWeaponSwing = instance_create(atkCenterX,atkCenterY,obj_weapon_swing);        
        objWeaponSwing.sprite_index = spr_weapon_2;
    }
    else if(charID == 3)
    {
        objWeaponSwing = instance_create(atkCenterX,atkCenterY,obj_weapon_swing);        
        objWeaponSwing.sprite_index = spr_weapon_3;
    }
    else if(charID == 4)
    {
        objWeaponSwing = instance_create(atkCenterX,atkCenterY,obj_weapon_swing);        
        objWeaponSwing.sprite_index = spr_weapon_4;
    }
    else if(charID == 5)
    {
        objWeaponSpear = instance_create(atkCenterX,atkCenterY,obj_weapon_spear);        
        objWeaponSpear.sprite_index = spr_weapon_5;
    }
    else if(charID == 10)
    {
        objWeaponSwing = instance_create(atkCenterX,atkCenterY,obj_weapon_swing);        
        objWeaponSwing.sprite_index = spr_weapon_2;
    }
    else if(charID == 12)
    {
        objWeaponSwing = instance_create(atkCenterX,atkCenterY,obj_weapon_swing);        
        objWeaponSwing.sprite_index = spr_weapon_3;
    }
    else if(charID == 15)
    {
        objWeaponSpear = instance_create(atkCenterX,atkCenterY,obj_weapon_spear);        
        objWeaponSpear.sprite_index = spr_weapon_15;
    }
    else if(charID == 16)
    {
        objWeaponSwing = instance_create(atkCenterX,atkCenterY,obj_weapon_swing);        
        objWeaponSwing.sprite_index = spr_weapon_16;
    }
}
else
{
    if(charID == 1)
    {
        objWeaponSwing = instance_create(atkCenterX,atkCenterY,obj_weapon_swing);        
        objWeaponSwing.sprite_index = spr_weapon_d1;
    }
    else if(charID == 3)
    {
        objWeaponSwing = instance_create(atkCenterX,atkCenterY,obj_weapon_swing);        
        objWeaponSwing.sprite_index = spr_weapon_d2;
    }
    else if(charID == 4)
    {
        objWeaponSpear = instance_create(atkCenterX,atkCenterY,obj_weapon_spear);                
        objWeaponSpear.sprite_index = spr_weapon_15;        
    }
}

