//This was moved out of load(), since choosing "ignore"
//on the error will break out of scr_load()

//Generate file if it's missing
//If you corrupt it you'll have to suit yourself :p
if (generate==1){
    fileid=file_text_open_write("options.txt");
    file_text_write_string(fileid,"Set the following line to 1 to disable gamepads");
    file_text_writeln(fileid);
    file_text_write_string(fileid,"0");
    file_text_writeln(fileid);
    file_text_write_string(fileid,"Set the following line to 1 to disable music");
    file_text_writeln(fileid);
    file_text_write_string(fileid,"0");
    file_text_writeln(fileid);
    file_text_write_string(fileid,"Set the following line to 1 to disable sound effects");
    file_text_writeln(fileid);
    file_text_write_string(fileid,"0");
    file_text_writeln(fileid);
    file_text_write_string(fileid,"Set the following line to 1 to disable asteroids");
    file_text_writeln(fileid);
    file_text_write_string(fileid,"0");
    file_text_writeln(fileid);
    file_text_write_string(fileid,"Set the following line to 1 to disable items");
    file_text_writeln(fileid);
    file_text_write_string(fileid,"0");
    file_text_writeln(fileid);
    file_text_write_string(fileid,"Cheat: set the following line to 1 to instantly unlock secret character");
    file_text_writeln(fileid);
    file_text_write_string(fileid,"0");
    file_text_writeln(fileid);
    file_text_close(fileid);
    }
