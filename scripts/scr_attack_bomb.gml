aChar = argument0;      // attack char
tChar = argument1;      // target char
bulletObj = argument2;

bulletSpd = aChar.bulletSpd/100;

bullet = instance_create(aChar.x,aChar.y-40,bulletObj);
bullet.isDeki = false;
bullet.targetX = tChar.x;
bullet.targetY = tChar.y;
//bullet.image_angle = 90 + point_direction(bullet.targetX, bullet.targetY, bullet.x, bullet.y);
bullet.spd = bulletSpd;

bullet.atkPower = aChar.atkPower;
