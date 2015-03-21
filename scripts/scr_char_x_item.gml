return 0;

if(isLeader && !isDeki && isAlive && other.randomType == RAND_END)
{   
    //show_debug_message(string(other.type));
    
    // item type
    switch(other.type)
    {
        case ITEM_COIN_1:
            scr_add_coin(1);
            scr_snd(snd_coin1);
        break;
        case ITEM_COIN_5:
            scr_add_coin(5);
            scr_snd(snd_coin5);
        break;
        case ITEM_NIKUMAN:
            global.addHP += 50;
            scr_snd(snd_heal);
        break;
        case ITEM_CHEST:
            // many coins
            scr_snd(snd_eat);

            if(scr_is_kakusei(14))
                coin = irandom(3);
            else
                coin = irandom(4);
            for(var i=0;i<15;i++)
            {
                for(var j=0;j<15;j++)
                {
                    rdm = global.coinArray[i,j];
                    if(rdm == coin)
                    {
                        itemObj = instance_create(global.mapLeft+40+i*80,global.mapUp+40+j*80,obj_item);
                        itemObj.randomType = RAND_COIN;         
                    }
                }
            }
        break;
        case ITEM_MAGNET:
            global.spMagnet = 1000;
            scr_snd(snd_eat);
        break;
        case ITEM_BUBBLE:
            global.spBubble = 3;
            scr_snd(snd_eat);
        break;
        case ITEM_BOMB:
//            ds_list_add(global.bombXList, other.x);
//            ds_list_add(global.bombYList, other.y-40);  
            if(scr_is_kakusei(13))
            {
                //scr_add_boom(other.x, other.y-40, 400);
                //ds_list_add(global.bombRangeList, 360);
//                ds_list_add(global.bombRangeList, 400);
//                instance_create(other.x, other.y-40, obj_part_bigbomb); 
            }
            else
            {
                //scr_add_boom(other.x, other.y-40, 300);
                //ds_list_add(global.bombRangeList, 240);
//                ds_list_add(global.bombRangeList, 300);
//                instance_create(other.x, other.y-40, obj_part_bomb); 
            }
//            ds_list_add(global.bombPowerList, 200);                                  
        break;
        case ITEM_HERO:
            global.addNPC = other.heroID;
            // ????
            
            show_debug_message("========0========")
            var sizePTrain = ds_list_size(global.playerTrain.train);
            for(var i=0;i<sizePTrain;i++)
            {
                pChar = ds_list_find_value(global.playerTrain.train, i);
                show_debug_message("pos"+string(i)+"id"+string(pChar.charID));
            }

            scr_add_hero(other.heroID);
            
            //show_debug_message("add hero = "+  string(other.heroID));
            
            show_debug_message("========4========")
            var sizePTrain = ds_list_size(global.playerTrain.train);
            for(var i=0;i<sizePTrain;i++)
            {
                pChar = ds_list_find_value(global.playerTrain.train, i);
                show_debug_message("pos"+string(i)+"id"+string(pChar.charID));
            }
            
            scr_snd(snd_eat);
        break;  
        case ITEM_SWORD:
            global.atkSpeedUp = 1000;
            scr_snd(snd_powerup);
        break;  
        case ITEM_DBALL:
            global.totalDBall += 1;
            global.nowDBall += 1;
            scr_snd(snd_eatdball);
        break;      
        default:
        break;
    }
    
    //instance_create(other.x,other.y-20,obj_sparkle);
    instance_create(other.x,other.y-20,obj_part_sparkle);
    other.eatme.isAlive = false;
    other.shadow.isAlive = false;
    with (other)
    {        
        instance_destroy();           
    }
}
