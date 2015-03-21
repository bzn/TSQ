//these script names are getting ridiculous
//wait a minute, this is identical to scr_manonasteroidaction
//now it's not

//Bounce away
direction+=180;
if (speed<5)
    speed=5;
if (other.speed<5)
    other.speed=5;
with (other)
    instance_destroy();
hp-=5;
invincible=10;
instance_create(x,y,obj_explo);

global.shakescreen+=20;
repeat(8)
    (instance_create(other.x,other.y,obj_debris)).image_single=2+floor(random(3));
