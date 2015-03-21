/*
// kill all member when train leader dead
if(!instance_exists(char0))
{
    var size = ds_list_size(train);
    for(i=1;i<size;i++)
    {
        var char = ds_list_find_value(train, i);
        char.isAlive = false;
    }
    instance_destroy();
    return 0;
}
*/

/*
// check train member is alive
var size = ds_list_size(train);
for(i=1;i<size;i++)
{
    var char = ds_list_find_value(train, i);
    if(!instance_exists(char))
        ds_list_delete(train,i);
}
*/

if(!instance_exists(char0))
{
    return 0;
}

// train leader throw Breadcrumb Trail
var size = ds_list_size(train);
for(i=1;i<size;i++)
{
    var char = ds_list_find_value(train, i);
    if(instance_exists(char))
    {
        ds_list_add(char.nodeXList,char0.x);
        ds_list_add(char.nodeYList,char0.y);
        ds_list_add(char.nodeDirList,char0.command);
    }
}

// speed up if front char was dead
var space = 60 / char0.moveSpeed;           // ....
var size = ds_list_size(train);
for(i=1;i<size;i++)
{
    var lastChar = ds_list_find_value(train, i-1);
    var char = ds_list_find_value(train, i);
    // front char Breadcrumb Trail
    var lastBreadCount = ds_list_size(lastChar.nodeXList);
    // self Breadcrumb Trail
    var breadCount = ds_list_size(char.nodeXList);
    
    // space of two char(space = 15)
    if(breadCount-lastBreadCount >= space)
    {
        char.x = ds_list_find_value(char.nodeXList,0);
        char.y = ds_list_find_value(char.nodeYList,0);        
        char.command = ds_list_find_value(char.nodeDirList,0);
        ds_list_delete(char.nodeXList,0);
        ds_list_delete(char.nodeYList,0);
        ds_list_delete(char.nodeDirList,0);
    }
    
    // double speed
    if(breadCount-lastBreadCount >= space+1)
    {
        char.x = ds_list_find_value(char.nodeXList,0);
        char.y = ds_list_find_value(char.nodeYList,0);        
        char.command = ds_list_find_value(char.nodeDirList,0);
        ds_list_delete(char.nodeXList,0);
        ds_list_delete(char.nodeYList,0);
        ds_list_delete(char.nodeDirList,0);
    }
}


 
