var val = ds_map_find_value(iap_data, "type");
switch (val)
{
    case iap_ev_restore:
        var status = ds_map_find_value(iap_data, "result");
        show_message_async("Purchase Restore Status = " + string(status));
    break;

    case iap_ev_purchase:
        var map = ds_map_create();
        var purchase_id = ds_map_find_value(iap_data, "index");
        iap_purchase_details(purchase_id, map);
        if ds_map_find_value(map, "status") == iap_purchased
        {
            var product_id = ds_map_find_value(map, "product");
            ds_map_replace(global.purchaseMap, product_id, 1);
            switch(product_id)
            {
                case "h04": scr_unlock_hero_free(4); global.shine.isShine = true; break;
                case "h05": scr_unlock_hero_free(5); global.shine.isShine = true; break;
                case "h06": scr_unlock_hero_free(6); global.shine.isShine = true; break;
                case "h07": scr_unlock_hero_free(7); global.shine.isShine = true; break;
                case "h08": scr_unlock_hero_free(8); global.shine.isShine = true; break;
                case "h09": scr_unlock_hero_free(9); global.shine.isShine = true; break;
                case "h10": scr_unlock_hero_free(10); global.shine.isShine = true; break;
                case "h11": scr_unlock_hero_free(11); global.shine.isShine = true; break;
                case "h12": scr_unlock_hero_free(12); global.shine.isShine = true; break;
                case "h13": scr_unlock_hero_free(13); global.shine.isShine = true; break;
                case "h14": scr_unlock_hero_free(14); global.shine.isShine = true; break;
                case "h15": scr_unlock_hero_free(15); global.shine.isShine = true; break;
                case "h16": scr_unlock_hero_free(16); global.shine.isShine = true; break;    

                case "3wc":               
                case "12wc":
                case "10db":
                case "40db":
                case "vp":
                    iap_consume(product_id);
                break;               
            }
        }
        ds_map_destroy(map);
        
    break;
    
    case iap_ev_consume:
        var product_id = ds_map_find_value(iap_data, "product");
        if ds_map_find_value(iap_data, "consumed")
        {
            ds_map_replace(global.purchaseMap, product_id, 0);
            
            switch(product_id)
            {
                case "3wc":     
                    global.nowCoin += 30000;   
                    if(global.language == "chs")
                        show_message_async("成功购买 30,000 银币");        
                    else
                        show_message_async("成功購買 30,000 銀幣");                  
                    global.shine.isShine = true;
                    scr_snd(snd_buy);
                break;
                case "12wc":    
                    global.nowCoin += 120000;   
                    if(global.language == "chs")
                        show_message_async("成功购买 120,000 银币");        
                    else
                        show_message_async("成功購買 120,000 銀幣");
                    global.shine.isShine = true;
                    scr_snd(snd_buy);
                break;
                case "10db":
                    global.nowDBall += 10;   
                    if(global.language == "chs")
                        show_message_async("成功购买 10 龙珠");        
                    else
                        show_message_async("成功購買 10 龍珠");                  
                    global.shine.isShine = true;
                    scr_snd(snd_buy);
                break;
                case "40db":
                    global.nowDBall += 40;      
                    if(global.language == "chs")
                        show_message_async("成功购买 40 龙珠");        
                    else
                        show_message_async("成功購買 40 龍珠");                  
                    global.shine.isShine = true;
                    scr_snd(snd_buy);
                break;
                case "vp":
                    global.nowDBall += 100;
                    global.nowCoin += 300000;

                    if(global.language == "chs")
                        show_message_async("成功购买 超值组合包");        
                    else
                        show_message_async("成功購買 超值組合包");
                    global.shine.isShine = true;
                    scr_snd(snd_buy);
                break;
            }
        }
        //global.shine.isShine = true;
    break;
}
ds_map_secure_save(global.purchaseMap, "iap_data.json");

global.loading.isActive = false;

//scr_save_game();
scr_save_only_iap();
