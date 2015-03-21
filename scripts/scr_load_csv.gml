// csv_read(fname)
var fname, file, rowlist, collist;
fname = argument0;
file = file_text_open_read(working_directory + fname);
rowlist = ds_list_create();

while(!file_text_eof(file)){
  collist = ds_list_create();
  ds_list_add(rowlist, collist);
  str_to_list(file_text_read_string(file), ",", collist);
  file_text_readln(file);
}
file_text_close(file);
return(rowlist);
