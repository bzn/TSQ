//
// clean: check train member is alive
//
var size = ds_list_size(train);
var isLeaderKilled = false;
var i=0;
while(i<size)
{
    var char = ds_list_find_value(train, i);
    if(!instance_exists(char))
    {        
        //show_debug_message("train"+string(i)+"CLEAN");
        //show_debug_message(string(ds_list_size(train)));
        ds_list_delete(train,i);
        size = ds_list_size(train);
        //show_debug_message(string(ds_list_size(train)));
        //break;
        if(i==0)
        {
            isLeaderKilled = true;
        }
    }
    else
    {
        i++;
    }
}

size = ds_list_size(train);
if(size == 0)
{
    //show_message("TRAIN KILL");
    instance_destroy();    
    return 0;
}

if(isLeaderKilled)
{     
    // new leader
    char0 = ds_list_find_value(train, 0);
    char0.isLeader = true;
    char0.nodeXList       = ds_list_create();           // ?��?移�?路�?
    char0.nodeYList       = ds_list_create();           // ?��?移�?路�?
    char0.nodeDirList     = ds_list_create();           // ?��?移�?路�?
    char0.command = char0.faceTo;
    char0.faceTo = -1;

    // delete last 14 bread
    size = ds_list_size(train);
    for(var i=1;i<size;i++)
    {
        char = ds_list_find_value(train, i);
        
        breadCount = ds_list_size(char.nodeXList);
        //show_message(string(breadCount));
        for(var j=0;j<28;j++)
        {
            // ....
            ds_list_delete(char.nodeXList,breadCount-j-1);
            ds_list_delete(char.nodeYList,breadCount-j-1);
            ds_list_delete(char.nodeDirList,breadCount-j-1);
        }
    }
}
