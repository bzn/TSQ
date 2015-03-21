// load hero data
var rows, columns, value;
rows = scr_load_csv("\herodata.csv");
var rowSize = ds_list_size(rows);
for(var i=1;i<rowSize;i++)
{
    columns = ds_list_get(rows,i);
    global.heroData[i-1] = columns;
}

for(var i=0;i<MAX_HERO*MAX_LEVEL;i++)
{
    heroData = global.heroData[i];
    global.upgradeExp[i] = real(ds_list_get(heroData,13));
//    global.heroName[i] = string(ds_list_get(heroData,14));
//    show_debug_message(global.heroName[i]);
}

// load deki data
rows = scr_load_csv("\dekidata.csv");
var rowSize = ds_list_size(rows);
global.maxStage = rowSize;
for(var i=1;i<rowSize;i++)
{
    columns = ds_list_get(rows,i);
    global.dekiData[i-1] = columns;
}

// load stage data
rows = scr_load_csv("\stagedata.csv");
var rowSize = ds_list_size(rows);
for(var i=1;i<rowSize;i++)
{
    columns = ds_list_get(rows,i);
    global.stageData[i-1] = columns;
}

