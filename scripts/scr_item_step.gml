if(randomType == RAND_UNKNOW)
{
    // need set random type
    return 0;
}

if(global.pause)
    return 0;

if(global.isZenmetsu)
    return 0;
    
if(randomType != RAND_END)
{    
    type = scr_item_random(randomType);
    
//    show_debug_message("ITEM = " + string(type));
    
    image_xscale = 1.0;
    image_yscale = 1.0;
    
    switch(type)
    {
        case ITEM_COIN_1:
            sprite_index = spr_silver;
            shadow.image_alpha = 0.5;
            shadow.image_xscale = 0.5;
            shadow.image_yscale = 0.5;
        break;
        case ITEM_COIN_5:
            sprite_index = spr_gold;
            shadow.image_alpha = 0.5;
            shadow.image_xscale = 0.5;
            shadow.image_yscale = 0.5;
        break;
        case ITEM_NIKUMAN:
            sprite_index = spr_itm_nikuman;
            shadow.image_alpha = 0.5;
            shadow.image_xscale = 0.8;
            shadow.image_yscale = 0.8;
        break;
        case ITEM_CHEST:
            sprite_index = spr_itm_chest;
            shadow.image_alpha = 0.0;
            shadow.image_xscale = 0.0;
            shadow.image_yscale = 0.0;
        break;
        case ITEM_MAGNET:
            sprite_index = spr_itm_magnet;
            shadow.image_alpha = 0.5;
            shadow.image_xscale = 0.8;
            shadow.image_yscale = 0.8;
        break;
        case ITEM_BUBBLE:
            sprite_index = spr_itm_bubble;
            shadow.image_alpha = 0.5;
            shadow.image_xscale = 0.8;
            shadow.image_yscale = 0.8;
        break;
        case ITEM_BOMB:
            sprite_index = spr_itm_bigbomb;
            shadow.image_alpha = 0.5;
            shadow.image_xscale = 0.8;
            shadow.image_yscale = 0.8;
        break;
        case ITEM_SWORD:
            sprite_index = spr_itm_sword;
            shadow.image_alpha = 0.5;
            shadow.image_xscale = 0.8;
            shadow.image_yscale = 0.8;
        break;
        case ITEM_DBALL:
            sprite_index = spr_itm_dball;                        
            shadow.image_alpha = 0.5;
            shadow.image_xscale = 0.8;
            shadow.image_yscale = 0.8;
        break;
        case ITEM_HERO:
            heroID = scr_random_unuse_hero_id();
            scr_add_hero_in_map(heroID);
            var heroLV = scr_get_hero_lv(heroID);
            
            switch(heroLV)
            {
                case 1:
                    if(heroID == 1) sprite_index = spr_sel_hr001_0;
                    else if(heroID == 2) sprite_index = spr_sel_hr002_0;
                    else if(heroID == 3) sprite_index = spr_sel_hr003_0;
                    else if(heroID == 4) sprite_index = spr_sel_hr004_0;
                    else if(heroID == 5) sprite_index = spr_sel_hr005_0;
                    else if(heroID == 6) sprite_index = spr_sel_hr006_0;
                    else if(heroID == 7) sprite_index = spr_sel_hr007_0;
                    else if(heroID == 8) sprite_index = spr_sel_hr008_0;
                    else if(heroID == 9) sprite_index = spr_sel_hr009_0;
                    else if(heroID == 10) sprite_index = spr_sel_hr010_0;
                    else if(heroID == 11) sprite_index = spr_sel_hr011_0;
                    else if(heroID == 12) sprite_index = spr_sel_hr012_0;
                    else if(heroID == 13) sprite_index = spr_sel_hr013_0;
                    else if(heroID == 14) sprite_index = spr_sel_hr014_0;
                    else if(heroID == 15) sprite_index = spr_sel_hr015_0;
                    else if(heroID == 16) sprite_index = spr_sel_hr016_0;   
                break;
                case 2:
                    if(heroID == 1) sprite_index = spr_sel_hr001_1;
                    else if(heroID == 2) sprite_index = spr_sel_hr002_1;
                    else if(heroID == 3) sprite_index = spr_sel_hr003_1;
                    else if(heroID == 4) sprite_index = spr_sel_hr004_1;
                    else if(heroID == 5) sprite_index = spr_sel_hr005_1;
                    else if(heroID == 6) sprite_index = spr_sel_hr006_1;
                    else if(heroID == 7) sprite_index = spr_sel_hr007_1;
                    else if(heroID == 8) sprite_index = spr_sel_hr008_1;
                    else if(heroID == 9) sprite_index = spr_sel_hr009_1;
                    else if(heroID == 10) sprite_index = spr_sel_hr010_1;
                    else if(heroID == 11) sprite_index = spr_sel_hr011_1;
                    else if(heroID == 12) sprite_index = spr_sel_hr012_1;
                    else if(heroID == 13) sprite_index = spr_sel_hr013_1;
                    else if(heroID == 14) sprite_index = spr_sel_hr014_1;
                    else if(heroID == 15) sprite_index = spr_sel_hr015_1;
                    else if(heroID == 16) sprite_index = spr_sel_hr016_1;  
                break;
                case 3:
                    if(heroID == 1) sprite_index = spr_sel_hr001_2;
                    else if(heroID == 2) sprite_index = spr_sel_hr002_2;
                    else if(heroID == 3) sprite_index = spr_sel_hr003_2;
                    else if(heroID == 4) sprite_index = spr_sel_hr004_2;
                    else if(heroID == 5) sprite_index = spr_sel_hr005_2;
                    else if(heroID == 6) sprite_index = spr_sel_hr006_2;
                    else if(heroID == 7) sprite_index = spr_sel_hr007_2;
                    else if(heroID == 8) sprite_index = spr_sel_hr008_2;
                    else if(heroID == 9) sprite_index = spr_sel_hr009_2;
                    else if(heroID == 10) sprite_index = spr_sel_hr010_2;
                    else if(heroID == 11) sprite_index = spr_sel_hr011_2;
                    else if(heroID == 12) sprite_index = spr_sel_hr012_2;
                    else if(heroID == 13) sprite_index = spr_sel_hr013_2;
                    else if(heroID == 14) sprite_index = spr_sel_hr014_2;
                    else if(heroID == 15) sprite_index = spr_sel_hr015_2;
                    else if(heroID == 16) sprite_index = spr_sel_hr016_2;  
                break;
                case 4:
                    if(heroID == 1) sprite_index = spr_sel_hr001_3;
                    else if(heroID == 2) sprite_index = spr_sel_hr002_3;
                    else if(heroID == 3) sprite_index = spr_sel_hr003_3;
                    else if(heroID == 4) sprite_index = spr_sel_hr004_3;
                    else if(heroID == 5) sprite_index = spr_sel_hr005_3;
                    else if(heroID == 6) sprite_index = spr_sel_hr006_3;
                    else if(heroID == 7) sprite_index = spr_sel_hr007_3;
                    else if(heroID == 8) sprite_index = spr_sel_hr008_3;
                    else if(heroID == 9) sprite_index = spr_sel_hr009_3;
                    else if(heroID == 10) sprite_index = spr_sel_hr010_3;
                    else if(heroID == 11) sprite_index = spr_sel_hr011_3;
                    else if(heroID == 12) sprite_index = spr_sel_hr012_3;
                    else if(heroID == 13) sprite_index = spr_sel_hr013_3;
                    else if(heroID == 14) sprite_index = spr_sel_hr014_3;
                    else if(heroID == 15) sprite_index = spr_sel_hr015_3;
                    else if(heroID == 16) sprite_index = spr_sel_hr016_3;  
                break;
            }
            
            image_xscale = 0.5;
            image_yscale = 0.5;
            
/*            
            if(heroID == 1) sprite_index = spr_itm_hr001;
            else if(heroID == 2) sprite_index = spr_itm_hr002;
            else if(heroID == 3) sprite_index = spr_itm_hr003;
            else if(heroID == 4) sprite_index = spr_itm_hr004;
            else if(heroID == 5) sprite_index = spr_itm_hr005;
            else if(heroID == 6) sprite_index = spr_itm_hr006;
            else if(heroID == 7) sprite_index = spr_itm_hr007;
            else if(heroID == 8) sprite_index = spr_itm_hr008;
            else if(heroID == 9) sprite_index = spr_itm_hr009;
            else if(heroID == 10) sprite_index = spr_itm_hr010;
            else if(heroID == 11) sprite_index = spr_itm_hr011;
            else if(heroID == 12) sprite_index = spr_itm_hr012;
            else if(heroID == 13) sprite_index = spr_itm_hr013;
            else if(heroID == 14) sprite_index = spr_itm_hr014;
            else if(heroID == 15) sprite_index = spr_itm_hr015;
            else if(heroID == 16) sprite_index = spr_itm_hr016;            
*/            
            shadow.image_alpha = 1.0;
            eatme.image_alpha = 1.0;
        break;
    }    
    
    randomType = RAND_END;
}


// randomed
if(randomType == RAND_END)
{
    if(timer > 0)
    {
        timer--;
        if(timer < 200)
        {
            temp = timer%10;
            if(temp < 5)
            {
                image_alpha = 0;
                shadow.image_alpha = 0.0;
            }
            else
            {
                image_alpha = 1;
                shadow.image_alpha = 0.5;
            }
        }
        else if(timer < 400)
        {
            temp = timer%30;
            if(temp < 15)
            {
                image_alpha = 0;
                shadow.image_alpha = 0.0;
            }
            else
            {
                image_alpha = 1;
                shadow.image_alpha = 0.5;
            }
        }   
        
        if(global.spMagnet > 0 && (type == ITEM_COIN_1 || type == ITEM_COIN_5))
        {
            var dis = point_distance(global.pTrainX,global.pTrainY,x,y);
            var spd = 0;
            if(dis > 500)
                spd = 2;
            else if(dis > 300)
                spd = 3;
            else if(dis > 150)
                spd = 4;
            else
                spd = 5;
            move_towards_point(global.pTrainX,global.pTrainY,spd);
            shadow.x = x;
            shadow.y = y;
        }
        else
        {
            // stop magnetic
            speed = 0;
        }
    }
    else
    {        
        if(type == ITEM_HERO)
        {
            scr_del_hero_in_map(heroID);
        }
        eatme.isAlive = false;
        shadow.isAlive = false;
        instance_destroy();
    }
}

if(!isAlive)
{
    instance_create(x,y-20,obj_part_sparkle);
    eatme.isAlive = false;
    shadow.isAlive = false;
    instance_destroy();   
}
