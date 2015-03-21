var aChar = argument0;      // attack char
var tChar = argument1;      // target char
var type = argument2;
var isDeki = argument3;

var bulletSpd = aChar.bulletSpd/100;

var bullet;
if(!isDeki)
    bullet = instance_create(aChar.x,aChar.y-40,obj_bullet_hero);
else
    bullet = instance_create(aChar.x,aChar.y-40,obj_bullet_deki);
    
bullet.type = type;

bullet.isDeki = isDeki;
bullet.targetX = aChar.atkCenterX + (tChar.x - aChar.x)*100;
bullet.targetY = aChar.atkCenterY + (tChar.y - aChar.y)*100;
if(type != BULL_BOMB)
{
    bullet.image_angle = 90 + point_direction(bullet.targetX, bullet.targetY, bullet.x, bullet.y);
}
else
{
    bullet.targetX = tChar.x;
    bullet.targetY = tChar.y;
}
bullet.spd = bulletSpd;

bullet.atkPower = aChar.atkPower;

/*
if(!isDeki)
{
    ds_list_add(global.heroBulletList, bullet);
}
else
{
    ds_list_add(global.dekiBulletList, bullet);
}
*/
