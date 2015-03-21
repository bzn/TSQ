var product = argument0;
       
if iap_status() == iap_status_available
{
    if ds_map_find_value(global.purchaseMap, product) == 0
    {
        iap_acquire(product, "");
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
