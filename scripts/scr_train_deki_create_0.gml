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

// train leader create
var deki = instance_create(500, 1200, obj_de001);
deki.hp = 10;
ds_list_add(train, deki);
           
char0 = ds_list_find_value(train, 0);
char0.isLeader = true;

moveAlarm = 0;


