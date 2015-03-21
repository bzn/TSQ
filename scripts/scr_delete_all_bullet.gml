var sizeBullet = ds_list_size(global.heroBulletList);

show_debug_message("hero bullet size = "+string(sizeBullet));

for(var i=0;i<sizeBullet;i++)
{
    var bullet = ds_list_find_value(global.heroBulletList, i);
    bullet.isAlive = false;
}
ds_list_clear(global.heroBulletList);

var sizeDekiBullet = ds_list_size(global.dekiBulletList);

show_debug_message("deki bullet size = "+string(sizeDekiBullet));

for(var i=0;i<sizeBullet;i++)
{
    var bullet = ds_list_find_value(global.dekiBulletList, i);
    bullet.isAlive = false;
}
ds_list_clear(global.dekiBulletList);
