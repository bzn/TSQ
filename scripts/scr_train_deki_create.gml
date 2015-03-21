// deki
isDeki = true;

forzenTimer = 0;
moveSpeedUpTimer = 0;
moveSlowDownTimer = 0;

// char0 speed temp for forzen effect
hspdTemp    = 0;
vspdTemp    = 0;

// train
train = ds_list_create();

// train leader position (leave player train along)
var saveW = 300;
var saveH = 300;
defaultX = irandom_range(global.mapLeft+40,global.mapRight-40-saveW);
defaultY = irandom_range(global.mapUp+40,global.mapDown-40-saveH);
// player Train Size
var pTrainSize = 0;
if(instance_exists(global.playerTrain))
{
    pTrainSize = ds_list_size(global.playerTrain.train);
}
if(pTrainSize > 0)
{
    pChar = ds_list_find_value(global.playerTrain.train, 0);
    if(defaultX > (pChar.x-saveW*0.5))
        defaultX += saveW;
    if(defaultY > (pChar.y-saveH*0.5))
        defaultY += saveH;    
}

// train leader create
seed = irandom(global.dekiTotalK-1);
if(seed < global.dekiKakuritsu[0])
    ds_list_add(train, instance_create(defaultX, defaultY, obj_de001));
else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1])
    ds_list_add(train, instance_create(defaultX, defaultY, obj_de002));
else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2])    
    ds_list_add(train, instance_create(defaultX, defaultY, obj_de003));
else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3])    
    ds_list_add(train, instance_create(defaultX, defaultY, obj_de004)); 
else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3] + global.dekiKakuritsu[4])    
    ds_list_add(train, instance_create(defaultX, defaultY, obj_de005)); 
else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3] + global.dekiKakuritsu[4] + global.dekiKakuritsu[5])    
    ds_list_add(train, instance_create(defaultX, defaultY, obj_de006)); 
else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3] + global.dekiKakuritsu[4] + global.dekiKakuritsu[5] + global.dekiKakuritsu[6])    
    ds_list_add(train, instance_create(defaultX, defaultY, obj_de007)); 
else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3] + global.dekiKakuritsu[4] + global.dekiKakuritsu[5] + global.dekiKakuritsu[6] + global.dekiKakuritsu[7])    
    ds_list_add(train, instance_create(defaultX, defaultY, obj_de008)); 
else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3] + global.dekiKakuritsu[4] + global.dekiKakuritsu[5] + global.dekiKakuritsu[6]+ global.dekiKakuritsu[7]+ global.dekiKakuritsu[8])    
    ds_list_add(train, instance_create(defaultX, defaultY, obj_de009));                     
else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3] + global.dekiKakuritsu[4] + global.dekiKakuritsu[5] + global.dekiKakuritsu[6]+ global.dekiKakuritsu[7]+ global.dekiKakuritsu[8]+ global.dekiKakuritsu[9])    
    ds_list_add(train, instance_create(defaultX, defaultY, obj_de010));
           
char0 = ds_list_find_value(train, 0);
char0.isLeader = true;

moveAlarm = 0;

/*
//1,2,3 people

// random train member
memberCount = irandom_range(0,2);

if(global.stageDekiCounter + memberCount + 1 > global.stageMaxDeki)
{
    memberCount = global.stageMaxDeki - global.stageDekiCounter - 1;
}

for(i=0;i<memberCount;i++)
{
    seed = irandom(global.dekiTotalK-1);
    if(seed < global.dekiKakuritsu[0])
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de001));
    else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1])
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de002));
    else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2])    
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de003));
    else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3])    
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de004)); 
//    ds_list_add(train, instance_create(defaultX, defaultY, obj_de001));
    char = ds_list_find_value(train, i+1);
    char.command = FACE_U;
}
*/

var rnd = irandom(4);       // 20% chance have a group
memberCount = 0;
if(rnd == 0)
    memberCount = 2;
        
if(global.stageDekiCounter + 3 > global.stageMaxDeki)
{
    memberCount = 0;
}

for(var i=0;i<memberCount;i++)
{
    seed = irandom(global.dekiTotalK-1);
    if(seed < global.dekiKakuritsu[0])
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de001));
    else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1])
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de002));
    else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2])    
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de003));
    else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3])    
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de004)); 
    else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3] + global.dekiKakuritsu[4])    
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de005));     
    else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3] + global.dekiKakuritsu[4] + global.dekiKakuritsu[5])    
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de006));     
    else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3] + global.dekiKakuritsu[4] + global.dekiKakuritsu[5] + global.dekiKakuritsu[6])    
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de007));     
    else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3] + global.dekiKakuritsu[4] + global.dekiKakuritsu[5] + global.dekiKakuritsu[6] + global.dekiKakuritsu[7])    
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de008));     
    else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3] + global.dekiKakuritsu[4] + global.dekiKakuritsu[5] + global.dekiKakuritsu[6] + global.dekiKakuritsu[7] + global.dekiKakuritsu[8])    
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de009));     
    else if(seed < global.dekiKakuritsu[0] + global.dekiKakuritsu[1] + global.dekiKakuritsu[2] + global.dekiKakuritsu[3] + global.dekiKakuritsu[4] + global.dekiKakuritsu[5] + global.dekiKakuritsu[6] + global.dekiKakuritsu[7] + global.dekiKakuritsu[8] + global.dekiKakuritsu[9])    
        ds_list_add(train, instance_create(defaultX, defaultY, obj_de010));                                     
        
    char = ds_list_find_value(train, i+1);
    char.command = FACE_U;
}

global.stageDekiCounter += (memberCount+1);

/*
//測試多人
// char1
ds_list_add(train, instance_create(defaultX, defaultY, obj_ch001));
char1 = ds_list_find_value(train, 1);
char1.command = FACE_U;

// char2
ds_list_add(train, instance_create(defaultX, defaultY, obj_ch001));
char2 = ds_list_find_value(train, 2);
char2.command = FACE_U;
*/
