if(global.pause == true)
{
    return 0;
}

if(!instance_exists(char0))
    return 0;

// forzen
if(forzenTimer > 0)
{
    forzenTimer--;
//    speed = 0;
    var size = ds_list_size(train);
    for(var i=0;i<size;i++)
    {
        var char = ds_list_find_value(train, i);
        char.image_speed = 0;
        char.moveSpeed = 0;
        char.hspeed = 0;
        char.vspeed = 0;
    }
    
    if(forzenTimer == 0)
    {
        // unforzen    
        scr_snd(snd_unforzen);
//        speed = 0;
        var size = ds_list_size(train);
        for(var i=0;i<size;i++)
        {
            var char = ds_list_find_value(train, i);
            char.image_speed = char.imageSpeedDefault;
            char.moveSpeed = char.moveSpeedDefault;
        }
        char0.hspeed = hspdTemp;
        char0.vspeed = vspdTemp;
    }
}

var size = ds_list_size(train);
for(var i=0;i<size;i++)
{
    var char = ds_list_find_value(train, i);
    // check axe effect
    if(char.isAxeHit)
    {   
        for(var j=0;j<size;j++)
        {
            var allChar = ds_list_find_value(train, j);
            allChar.delHP += char.axePower;
        }
        char.isAxeHit = false;
        char.axePower = 0;
        
        if(scr_is_kakusei(9))
        {
            var rnd = irandom(1);
            if(rnd == 1)
            {
                moveSlowDownTimer = 200;
            }
        }
        
        hspdTemp = char0.hspeed;
        vspdTemp = char0.vspeed;
    }    
    
    // check ice effect
    if(char.isIceHit)
    {   
        for(var j=0;j<size;j++)
        {
            var allChar = ds_list_find_value(train, j);
            allChar.delHP += char.icePower;
        }
        char.isIceHit = false;
        char.icePower = 0;
        
        if(scr_is_kakusei(8))
        {
            var rnd = irandom(1);
            if(rnd == 1)
            {
                forzenTimer = 200;
                scr_snd(snd_forzen);
            }
        }
        
        hspdTemp = char0.hspeed;
        vspdTemp = char0.vspeed;
    }  
    
    // check fire effect
    if(char.isFireHit)
    {   
        scr_snd(snd_fire2);
        char.isFireHit = false;
        for(var j=0;j<size;j++)
        {
            var allChar = ds_list_find_value(train, j);
            allChar.delHP += char.firePower;   
            
            allChar.effFire.timer = allChar.effFire.defaultTimer;
        }
        char.firePower = 0;
    }   
}

