//Collide with player
//should actually be the other way around for optimization
//but that doesn't matter here
//also obj_p2 should be a child of obj_p1
//if not just make them the same object entirely
//anyway

if (owner!=other.player && other.invincible==0){ //seriously?
    instance_destroy();
    other.hp-=1;
    instance_create(x,y,obj_explo);

    }
