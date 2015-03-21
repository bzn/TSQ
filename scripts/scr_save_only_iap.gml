// save data
ini_open("savedata.ini");

// now own
ini_write_real("recorddata", "now_coin", global.nowCoin);
ini_write_real("recorddata", "now_dball", global.nowDBall);

// load user data
ini_write_real("userdata", "hero1", global.heroUnlock[0]);
ini_write_real("userdata", "hero2", global.heroUnlock[1]);
ini_write_real("userdata", "hero3", global.heroUnlock[2]);
ini_write_real("userdata", "hero4", global.heroUnlock[3]);
ini_write_real("userdata", "hero5", global.heroUnlock[4]);
ini_write_real("userdata", "hero6", global.heroUnlock[5]);
ini_write_real("userdata", "hero7", global.heroUnlock[6]);
ini_write_real("userdata", "hero8", global.heroUnlock[7]);
ini_write_real("userdata", "hero9", global.heroUnlock[8]);
ini_write_real("userdata", "hero10", global.heroUnlock[9]);
ini_write_real("userdata", "hero11", global.heroUnlock[10]);
ini_write_real("userdata", "hero12", global.heroUnlock[11]);
ini_write_real("userdata", "hero13", global.heroUnlock[12]);
ini_write_real("userdata", "hero14", global.heroUnlock[13]);
ini_write_real("userdata", "hero15", global.heroUnlock[14]);
ini_write_real("userdata", "hero16", global.heroUnlock[15]);

ini_close(); //Closes the current open ini file. Be sure to do this!

scr_gamecenter_update();

