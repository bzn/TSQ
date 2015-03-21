// set type to active item
// -1:need set, 0:randomed, 1:coin, 2:mix
randomType = RAND_UNKNOW;

image_speed = 0.1;
depth = -y;
timer   = 600;     // 600->800->700->640->600
type = -1;

// draw eatme arrow
eatme = instance_create(x, y-30, obj_eatme);
eatme.image_alpha = 0;

// draw shadow
shadow = instance_create(x, y, obj_shadow);
shadow.image_alpha = 0;

isAlive = true;

