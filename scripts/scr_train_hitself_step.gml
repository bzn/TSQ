//
// hit self
// check self collision(do NOT collision with 2nd char)
//
var size = ds_list_size(train);
for(var i=2;i<size;i++)
{
    if(instance_exists(ds_list_find_value(train, i)))
    {
        var char = ds_list_find_value(train, i);
    
        if(instance_exists(char) && !scr_is_mudeki(char) && char.bornTimer<=0 && collision_rectangle(char.bbox_left,char.bbox_top,char.bbox_right,char.bbox_bottom,char0,true,false))
        {
            if(global.spBubble > 0)
            {
                global.spBubble = -1;
                scr_snd(snd_bubble);
                if(global.spMudeki < 100)
                    global.spMudeki = 100;
            }
            else
            {
                //show_message(string(char.pos));
                ds_list_delete(train,i);
                char.isAlive = false;    
                if(global.spMudeki < 10)
                    global.spMudeki = 10;    
                break;
            }
        }
    }
}
