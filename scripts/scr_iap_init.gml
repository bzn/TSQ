var map_create = false;
if file_exists("iap_data.json")
{
    show_debug_message("had json");
    global.purchaseMap = ds_map_secure_load("iap_data.json");
    if ds_exists(global.purchaseMap, ds_type_map)
    {
        for(var i=3;i<16;i++)
        {
            var heroID = i+1;
            var product = "";
            if(heroID >= 10)
                product = "h"+string(heroID);
            else
                product = "h0"+string(heroID);            
            if ds_map_exists(global.purchaseMap, product)
            {
                if ds_map_find_value(global.purchaseMap, product) == 1
                {
                    scr_unlock_hero_free(heroID);
                } 
            }
        }
    }
    else 
    {
        map_create = true;
    }
}
else 
{
    show_debug_message("create json");
    map_create = true;
}

if map_create
{
    global.purchaseMap = ds_map_create();
    for(var i=3;i<16;i++)
    {
        var heroID = i+1;
        var product = "";
        if(heroID >= 10)
            product = "h"+string(heroID);
        else
            product = "h0"+string(heroID);
        ds_map_add(global.purchaseMap, product, 0);
    }
    ds_map_secure_save(global.purchaseMap, "iap_data.json");
}

// ====


var productList = ds_list_create();

var pHero4 = ds_map_create(); ds_map_add(pHero4, "id", "h04"); ds_map_add(pHero4, "title", "hero 4"); ds_map_add(pHero4, "type", "Non-Consumable"); ds_list_add(productList, pHero4);
var pHero5 = ds_map_create(); ds_map_add(pHero5, "id", "h05"); ds_map_add(pHero5, "title", "hero 5"); ds_map_add(pHero5, "type", "Non-Consumable"); ds_list_add(productList, pHero5);
var pHero6 = ds_map_create(); ds_map_add(pHero6, "id", "h06"); ds_map_add(pHero6, "title", "hero 6"); ds_map_add(pHero6, "type", "Non-Consumable"); ds_list_add(productList, pHero6);
var pHero7 = ds_map_create(); ds_map_add(pHero7, "id", "h07"); ds_map_add(pHero7, "title", "hero 7"); ds_map_add(pHero7, "type", "Non-Consumable"); ds_list_add(productList, pHero7);
var pHero8 = ds_map_create(); ds_map_add(pHero8, "id", "h08"); ds_map_add(pHero8, "title", "hero 8"); ds_map_add(pHero8, "type", "Non-Consumable"); ds_list_add(productList, pHero8);
var pHero9 = ds_map_create(); ds_map_add(pHero9, "id", "h09"); ds_map_add(pHero9, "title", "hero 9"); ds_map_add(pHero9, "type", "Non-Consumable"); ds_list_add(productList, pHero9);
var pHero10 = ds_map_create(); ds_map_add(pHero10, "id", "h10"); ds_map_add(pHero10, "title", "hero 10"); ds_map_add(pHero10, "type", "Non-Consumable"); ds_list_add(productList, pHero10);
var pHero11 = ds_map_create(); ds_map_add(pHero11, "id", "h11"); ds_map_add(pHero11, "title", "hero 11"); ds_map_add(pHero11, "type", "Non-Consumable"); ds_list_add(productList, pHero11);
var pHero12 = ds_map_create(); ds_map_add(pHero12, "id", "h12"); ds_map_add(pHero12, "title", "hero 12"); ds_map_add(pHero12, "type", "Non-Consumable"); ds_list_add(productList, pHero12);
var pHero13 = ds_map_create(); ds_map_add(pHero13, "id", "h13"); ds_map_add(pHero13, "title", "hero 13"); ds_map_add(pHero13, "type", "Non-Consumable"); ds_list_add(productList, pHero13);
var pHero14 = ds_map_create(); ds_map_add(pHero14, "id", "h14"); ds_map_add(pHero14, "title", "hero 14"); ds_map_add(pHero14, "type", "Non-Consumable"); ds_list_add(productList, pHero14);
var pHero15 = ds_map_create(); ds_map_add(pHero15, "id", "h15"); ds_map_add(pHero15, "title", "hero 15"); ds_map_add(pHero15, "type", "Non-Consumable"); ds_list_add(productList, pHero15);
var pHero16 = ds_map_create(); ds_map_add(pHero16, "id", "h16"); ds_map_add(pHero16, "title", "hero 16"); ds_map_add(pHero16, "type", "Non-Consumable"); ds_list_add(productList, pHero16);


var pShop1 = ds_map_create(); ds_map_add(pShop1, "id", "10db"); ds_map_add(pShop1, "title", "30,000 coin"); ds_map_add(pShop1, "type", "Consumable"); ds_list_add(productList, pShop1);
var pShop2 = ds_map_create(); ds_map_add(pShop2, "id", "40db"); ds_map_add(pShop2, "title", "120,000 coin"); ds_map_add(pShop2, "type", "Consumable"); ds_list_add(productList, pShop2);
var pShop3 = ds_map_create(); ds_map_add(pShop3, "id", "3wc"); ds_map_add(pShop3, "title", "10 dball"); ds_map_add(pShop3, "type", "Consumable"); ds_list_add(productList, pShop3);
var pShop4 = ds_map_create(); ds_map_add(pShop4, "id", "12wc"); ds_map_add(pShop4, "title", "40 dball"); ds_map_add(pShop4, "type", "Consumable"); ds_list_add(productList, pShop4);
var pShop5 = ds_map_create(); ds_map_add(pShop5, "id", "vp"); ds_map_add(pShop5, "title", "value pack"); ds_map_add(pShop5, "type", "Consumable"); ds_list_add(productList, pShop5);


iap_activate(productList);

ds_map_destroy(pHero4); ds_map_destroy(pHero5); ds_map_destroy(pHero6); ds_map_destroy(pHero7); ds_map_destroy(pHero8); ds_map_destroy(pHero9); ds_map_destroy(pHero10); ds_map_destroy(pHero11); ds_map_destroy(pHero12); ds_map_destroy(pHero13); ds_map_destroy(pHero14); ds_map_destroy(pHero15); ds_map_destroy(pHero16);
ds_map_destroy(pShop1); ds_map_destroy(pShop2); ds_map_destroy(pShop3); ds_map_destroy(pShop4); ds_map_destroy(pShop5);
ds_list_destroy(productList);


/*
var productList = ds_list_create();

var purchase1 = ds_map_create();
ds_map_add(purchase1, "id", "h04");
ds_map_add(purchase1, "title", "hero 4");
ds_map_add(purchase1, "type", "Non-Consumable");
ds_map_add(purchase1, "description", "Unlock this hero");
ds_map_add(purchase1, "price", "$1.99");
ds_list_add(productList, purchase1);

var purchase2 = ds_map_create();
ds_map_add(purchase2, "id", "h05");
ds_map_add(purchase2, "title", "hero 5");
ds_map_add(purchase2, "type", "Non-Consumable");
ds_map_add(purchase2, "description", "Unlock this hero");
ds_map_add(purchase2, "price", "$1.99");
ds_list_add(productList, purchase2);

iap_activate(productList);

ds_map_destroy(purchase1);
ds_map_destroy(purchase2);
ds_list_destroy(productList);
*/
