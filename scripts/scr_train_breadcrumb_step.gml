// 
// Breadcrumb
//
if(global.pause == true)
{
    return 0;
}

if(!instance_exists(char0))
    return 0;

if(forzenTimer > 0)
    return 0;    
    
// train leader throw Breadcrumb Trail
var size = ds_list_size(train);
for(var i=1;i<size;i++)
{
    var char = ds_list_find_value(train, i);
    if(instance_exists(char))
    {
        ds_list_add(char.nodeXList,char0.x);
        ds_list_add(char.nodeYList,char0.y);
        ds_list_add(char.nodeDirList,char0.command);
    }
}

/*
// speed up if char has bread
var leaderBread = ds_list_size(char0.nodeXList);
if(leaderBread>0)
{
    //show_message(string(leaderBread));
    char0.x = ds_list_find_value(char0.nodeXList,0);
    char0.y = ds_list_find_value(char0.nodeYList,0);        
    char0.command = ds_list_find_value(char0.nodeDirList,0);
    ds_list_delete(char0.nodeXList,0);
    ds_list_delete(char0.nodeYList,0);
    ds_list_delete(char0.nodeDirList,0);
    
    leaderBread = ds_list_size(char0.nodeXList);
    if(leaderBread>0)
    {
        show_message(string(leaderBread));
        char0.x = ds_list_find_value(char0.nodeXList,0);
        char0.y = ds_list_find_value(char0.nodeYList,0);        
        char0.command = ds_list_find_value(char0.nodeDirList,0);
        ds_list_delete(char0.nodeXList,0);
        ds_list_delete(char0.nodeYList,0);
        ds_list_delete(char0.nodeDirList,0);
    }
    
    leaderBread = ds_list_size(char0.nodeXList);
    if(leaderBread==0)
    {
        char0.faceTo = -1;
        show_message("bread clear");
        //show_message(string(char0.isLeader));
        //show_message(string(char0.command));
        var char = ds_list_find_value(train, 1);
        bread = ds_list_size(char.nodeXList);
        show_message(string(bread));
    }
}
*/

/*
// speed up if front char was dead
var spd = char0.moveSpeed;
if(char0.moveSpeedUpTimer > 0)
{
    spd = spd * 1.5;
}
if(char0.moveSlowDownTimer > 0)
{
    spd = spd * 0.5;
}
*/

if(char0.moveSpeed != 0)
{
    var space = 60 / char0.moveSpeed;           // ....
    var size = ds_list_size(train);
    for(var i=1;i<size;i++)
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
}


 
