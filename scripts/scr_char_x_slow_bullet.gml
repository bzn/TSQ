//delHP += other.atkPower;

global.playerTrain.moveSlowDownTimer = 200;

with(other)
{
    instance_create(other.x,other.y,obj_part_slow_boom);
    isAlive = false;
}
