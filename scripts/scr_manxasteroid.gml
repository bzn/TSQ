//Bounce away unless bighugeman
if (bighugeman==0 && global.select[man-1]!=7){
    if (speed<5)
        speed=5;
    direction+=180;
    }

with (other)
    instance_destroy();
instance_create(other.x,other.y,obj_explo);
global.shakescreen+=10;
repeat(8)
    (instance_create(other.x,other.y,obj_debris)).image_single=2+floor(random(3));
