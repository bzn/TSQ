var dChar = argument0;
var type = argument1;

var pChar;
var tChar;

var isFindTarget = false;
var distance = 999999; 
var sizePTrain = ds_list_size(global.playerTrain.train);
for(var k=0;k<sizePTrain;k++)
{
    pChar = ds_list_find_value(global.playerTrain.train, k);
    var dist = scr_square_x_circle_part(dChar,pChar);
    if(dist >= 0)
    {
        var disTemp = dist;
        // only attack minimal distance deki char
        if(distance > disTemp)
        {                                        
            isFindTarget = true;
            tChar = dChar;
            distance = disTemp;
        }
    }
}

if(isFindTarget)
{
    // reset attack speed
    dChar.atkSpeed = dChar.atkSpeedDefault;

    // bullet    
    aChar = dChar;      // attack char
    tChar = pChar;      // target char
    
    scr_attack_bullet_ex(aChar, tChar, type, true);
}
