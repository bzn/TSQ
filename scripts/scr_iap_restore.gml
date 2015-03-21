if(global.language == "chs")
    show_message_async("即将恢复您曾经购买的英雄");
else
    show_message_async("即將恢復您曾經購買的英雄");

if iap_status() == iap_status_available
{
    if ds_map_find_value(global.purchaseMap, product) == 0
    {
        iap_restore_all();
        // pause and wait for iap event
        global.loading.isActive = true;
    }               
    else
    {
        show_message_async("Map is not available.");
    }
}
else
{
    show_message_async("Store is not available.");
}


