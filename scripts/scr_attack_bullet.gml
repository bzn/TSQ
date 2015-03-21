aChar = argument0;      // attack char
tChar = argument1;      // target char
bulletObj = argument2;

bulletSpd = aChar.bulletSpd/100;

bullet = instance_create(aChar.x,aChar.y-40,bulletObj);
bullet.isDeki = false;
bullet.targetX = aChar.atkCenterX + (tChar.x - aChar.x)*100;
bullet.targetY = aChar.atkCenterY + (tChar.y - aChar.y)*100;
bullet.image_angle = 90 + point_direction(bullet.targetX, bullet.targetY, bullet.x, bullet.y);
bullet.spd = bulletSpd;

bullet.atkPower = aChar.atkPower;

//ds_list_add(global.heroBulletList, bullet);
//show_debug_message("bullet="+string(bullet.type))
