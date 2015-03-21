// load save data
ini_open("savedata.ini"); //ini_open(string) where string is the file name (must be *.ini) 
coin = ini_read_real("userdata", "coin", 0 );
ini_write_real("userdata", "coin", coin);

// default hero
global.heroUnlock[0] = ini_read_real("userdata", "hero1", 0 );
global.heroUnlock[1] = ini_read_real("userdata", "hero2", 0 );
global.heroUnlock[2] = ini_read_real("userdata", "hero3", 0 );
global.heroUnlock[3] = ini_read_real("userdata", "hero4", 0 );
global.heroUnlock[4] = ini_read_real("userdata", "hero5", 0 );
global.heroUnlock[5] = ini_read_real("userdata", "hero6", 0 );
global.heroUnlock[6] = ini_read_real("userdata", "hero7", 0 );

show_debug_message("COIN="+string(coin));
ini_close(); //Closes the current open ini file. Be sure to do this!
