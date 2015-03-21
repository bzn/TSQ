var randomType = argument0;

if(!instance_exists(global.playerTrain))
    return ITEM_COIN_1;
    
//show_debug_message("randomType = " + string(randomType));

// ================================
// dragon ball kakuritsu(1/1000)
var kDBall      = 5;
//kOther      = 900;

// hero kakuritsu(1/1000)
var kHero       = 10;

var heroCounter = 0;
for(var i=0;i<MAX_HERO;i++)
{
    var heroID = i+1;
    if(scr_is_hero_in_map(heroID) || scr_is_hero_in_team(heroID))
    {
        heroCounter++;
    }
}

/*
if(heroCounter <= 1)
{
    kHero       = 400; 
}
else if(heroCounter <= 2)
    kHero       = 200; 
else if(heroCounter <= 3)
    kHero       = 120;    
else if(heroCounter <= 4)
    kHero       = 90;    
else if(heroCounter <= 5)
    kHero       = 70; 
else if(heroCounter <= 7)
    kHero       = 50;     
else if(heroCounter <= 9)
    kHero       = 30;         
else    
    kHero       = 1;
*/

kHero = scr_get_hero_kaku(global.nowStage, heroCounter);

//show_debug_message("kHero "+string(kHero)+" stage "+string(global.nowStage)+" cnt "+string(heroCounter));

//show_debug_message("ITEM:"+string(heroCounter)+"/"+string(kHero));
             
//kItem       = 900;

// item kakuritsu(1/1000)
kHeal       = 15;
kMagnet     = 15;
kBubble     = 15;
kBomb       = 15;
kSword      = 15;
kChest      = 15;

// coin kakuritsu(1/1000)
kGold       = 300;
//kSilver     = 800;

// ================================

// rand dragon ball
if(randomType == RAND_DBALL)
{
    var rdm = irandom(999);
    if(rdm < kDBall)
    {
        scr_snd(snd_dball);
        return ITEM_DBALL;
    }
    else
    {
        randomType = RAND_HERO;
    }
}

// rand hero
if(randomType == RAND_HERO)
{
    var isCanRandHero = false;            
        
    if(instance_exists(global.playerTrain))
    {
        var trainSize = ds_list_size(global.playerTrain.train);
        if(trainSize < global.unlockHeroCount)
        {
            for(var i=0;i<MAX_HERO;i++)
            {
                if(global.heroUnlock[i])
                {
                    var heroID = i+1;
                    if(!scr_is_hero_in_team(heroID) && !scr_is_hero_in_map(heroID))
                    {
                        isCanRandHero = true;
                        break;
                    }
                }
            }  
        }
    }
        
    if(isCanRandHero)
    {
        var rdm = irandom(999);
        if(rdm < kHero)
        {
            return ITEM_HERO;
        }
        else
        {
            randomType = RAND_ITEM;
        }
    }
    else
    {
        randomType = RAND_ITEM;
    }
}

// rand item
if(randomType == RAND_ITEM)
{
    var rdm = irandom(999);

    if(rdm < kHeal)
    {
        return ITEM_NIKUMAN;
    }
    else if(rdm < kHeal + kMagnet)
    {
        return ITEM_MAGNET;
    }
    else if(rdm < kHeal + kMagnet + kBubble)
    {
        return ITEM_BUBBLE;
    }
    else if(rdm < kHeal + kMagnet + kBubble + kBomb)
    {
        return ITEM_BOMB;
    }
    else if(rdm < kHeal + kMagnet + kBubble + kBomb + kSword)
    {
        return ITEM_SWORD;
    }
    else if(rdm < kHeal + kMagnet + kBubble + kBomb + kSword + kChest)
    {
        return ITEM_CHEST;
    }
    else
    {
        randomType = RAND_COIN;
    }
}

// rand coin
if(randomType == RAND_COIN)
{
    var rdm = irandom(999);
    if(rdm < kGold)
    {
        return ITEM_COIN_5;
    }
    else
    {
        return ITEM_COIN_1;
    }
}
