#define array_get
//array_get(array:str,index:int)
var input,index,array,scope;
input   = argument0;
index   = argument1;
if(!is_string(input)){show_error("array_get: array input must be string!",0);}
array   = var_get_name(input);
scope   = var_get_scope(input);

with(scope){
  return(variable_local_array_get(array,index));
}
return(variable_global_array_get(array,index));

#define array_set
//array_set(array:str,index:int,value:int/str)
var input,index,value,array,scope;
input   = argument0;
index   = argument1;
value   = argument2;
if(!is_string(input)){show_error("array_set: array input must be string!",0);}
array   = var_get_name(input);
scope   = var_get_scope(input);

with(scope){
  return(variable_local_array_set(array,index,value));
}
return(variable_global_array_set(array,index,value));

#define array_add
//array_add(array:str,value:int/str)
var array,value;
array   = argument0;
value   = argument1;
if(!is_string(array)){show_error("array_add: array input must be string!",0);}

return(array_set(array,array_size(array),value));

#define array_insert
//array_insert(array:str,index:int,value:int/str)
var array,index,value,i;
array   = argument0;
index   = argument1;
value   = argument2;
if(!is_string(array)){show_error("array_insert: array input must be string!",0);}

for(i=array_size(array);i>index;i-=1){
  array_set(array,i+1,array_get(array,i));
}

return(array_set(array,index,value));

#define array_has
//array_has(array:str,value:str/int)
var array,value,length,i;
array   = argument0;
value   = argument1;
if(!is_string(array)){show_error("array_has: array input must be string!",0);}
length  = array_size(array);

i=0;
repeat(length){
  if(string(array_get(array,i))==string(value)){
    return(true);
  }
  i+=1;
}
return(false);


#define array_pos
//array_pos(array:str,value:str/int)
var array,value,length,i;
array   = argument0;
value   = argument1;
if(!is_string(array)){show_error("array_pos: array input must be string!",0);}
length  = array_size(array);

i=0;
repeat(length){
  if(string(array_get(array,i))==string(value)){
    return(i);
  }
  i+=1;
}
return(-1);

#define array_search
//array_search(array:str,value:str,[offset:int])
var argument_num;if(!variable_local_exists('argument_count')){var a,i;a=0;for(i=0;i<16;i+=1){if(string(argument[i])!="0"){a=i+1;}}argument_num=a;}else{argument_num=argument_count;}

var array,value,length,offset,i;
array     = argument0;
if(!is_string(array)){show_error("array_search: array input must be string!",0);}
value     = argument1;
length    = array_size(array);
offset    = 0;
if(argument_num>2){
  offset  = argument[2];
}

for(i=offset;i<length;i+=1){
  if(string_pos(value,string(array_get(array,i)))){
    return(i);
  }
}
return(-1);

#define array_clear
//array_clear(array:str)
var array,length,i;
array   = argument0;
if(!is_string(array)){show_error("array_clear: array input must be string!",0);}
length  = array_size(array);

for(i=0;i<length;i+=1){
  array_set(array,i,0);
}
return(true);

#define array_size_simple
//array_size_simple(array:str) // warning: ignores trailing zeroes
// (C) WBG
var array,sec,i,z;
array = argument0;
if(!is_string(array)){show_error("array_size: array input must be string!",0);}

// security
if(variable_global_exists("array_sec")){
  sec = array_sec;
}else{
  sec   = 16;
}

i   = 0; // index-counter
z   = 0; // zero-counter
while(i<32000){
  if(string(array_get(array,i))=="0"){ // if current value is zero
    if(z>=sec){ // if [sec] alligned zeroes are found...
      i-=z; // recalibrate index-counter
      break; // end loop
    } // if not...
    z+=1; // increase zero-counter
  }else{ // if current value is not zero
    z=0; // reset zero-counter
  } // in all (non-loop-breaking) cases:
  i+=1; // increase index-counter
}
return(i);

#define array_size
//array_size(array:str) // warning: ignores trailing zeroes
// (C) WBG
var input,array,scope,sec,i,z;
array = argument0;
if(!is_string(array)){show_error("array_size: array input must be string!",0);}
array   = var_get_name(input);
scope   = var_get_scope(input);
if(!scope){scope=self;}
with(scope){
  // security
  if(variable_global_exists("array_sec")){
    sec = array_sec;
  }else{
    sec   = 16;
  }
  
  i   = 0; // index-counter
  z   = 0; // zero-counter
  while(i<32000){
    if(string(array_get(array,i))=="0"){ // if current value is zero
      if(z>=sec){ // if [sec] alligned zeroes are found...
        i-=z; // recalibrate index-counter
        break; // end loop
      } // if not...
      z+=1; // increase zero-counter
    }else{ // if current value is not zero
      z=0; // reset zero-counter
    } // in all (non-loop-breaking) cases:
    i+=1; // increase index-counter
  }
  return(i);
}

#define array_empty
//array_empty(array:str)
var array,sec,i;
array = argument0;
if(!is_string(array)){show_error("array_empty: array input must be string!",0);}

if(variable_global_exists("array_sec")){
  sec = array_sec;
}else{
  sec   = 16;
}

i=0;
if(var_is_local(array)){
  repeat(sec){
    if(string(variable_local_array_get(array,i))!="0"){
      return(false);
    }
  }
}else if(var_is_global(array)){
  repeat(sec){
    if(string(variable_global_array_get(array,i))!="0"){
      return(false);
    }
  }
}
return(true);

#define array_sort
//array_sort(array:str)
var input,array,scope,length,i,j,temp;
input   = argument0;
if(!is_string(input)){show_error("array_sort: array input must be string!",0);}
array   = var_get_name(input);
scope   = var_get_scope(input);

length  = array_size(array);
if(scope == noone || scope == global){
  for(i=1;i<length;i+=1){
    for(j=i;j>0;j-=1){
      if(variable_global_array_get(array,j)<variable_global_array_get(array,j-1)){
        temp = variable_global_array_get(array,j);
        variable_global_array_set(array,j,variable_global_array_get(array,j-1));
        variable_global_array_set(array,j-1,temp);
      }else{
        break;
      }
    }
  }
}else{
  with(scope){
    for(i=1;i<length;i+=1){
      for(j=i;j>0;j-=1){
        if(variable_local_array_get(array,j)<variable_local_array_get(array,j-1)){
          temp = variable_local_array_get(array,j);
          variable_local_array_set(array,j,variable_local_array_get(array,j-1));
          variable_local_array_set(array,j-1,temp);
        }else{
          break;
        }
      }
    }
  }
}
return(true);

#define array_shuffle
//array_shuffle(array:str)
var input,array,scope,list;
input   = argument0;
if(!is_string(input)){show_error("array_shuffle: array input must be string!",0);}
array   = var_get_name(input);
scope   = var_get_scope(input);
if(!scope){
  scope = self;
}
with(scope){
  list = array_to_list(array);
  ds_list_shuffle(list);
  ds_list_to_array(list,array);
  ds_list_destroy(list);
  return(true);
}
return(false);

#define array_copy
// array_copy(array:str,source:str)
var array,source,size,i;
array = argument0;
source = argument1;
if(!is_string(array) || !is_string(source)){
  show_error("array_copy: array input and source must be strings!",0);
}

size = array_size(source);
i = 0;
repeat(size){
  array_set(array,i,array_get(source,i));
  i += 1;
}
return(array);

#define array_implode
//array_implode(array:str,glue:str)
var array,glue,length,i,str;
array     = argument0;
if(!is_string(array)){show_error("array_implode: array input must be string!",0);}
glue      = argument1;
str       = "";

length  = array_size(array);
for(i=0;i<length-1;i+=1){
  str+=string(array_get(array,i))+glue;
}
str+=string(array_get(array,i));
return(str);

#define array_to_list
//array_to_list(array:str,[list:id])
var argument_num;if(variable_local_exists('argument_count')){argument_num=argument_count;}else{var i;argument_num=0;for(i=0;i<16;i+=1){if(string(argument[i])!="0"){argument_num=i+1;}}}

var input,array,scope,list,length,i;
input = argument0;
if(!is_string(array)){show_error("array_to_list: array input must be string!",0);}
array   = var_get_name(input);
scope   = var_get_scope(input);
if(!scope){
  scope = self;
}
if(argument_num>1){
  list = argument[1];
}else{
  list = ds_list_create();
}

with(scope){
  length = array_size(array);
  
  for(i=0;i<length;i+=1){
    ds_list_add(list,array_get(array,i));
  }
}

return(list);

#define ds_map_set
//ds_map_set(map:id,key:str/int,value:str/int)
var map, key, value;
map = argument0;
key = argument1;
value = argument2;

if(ds_map_exists(map,key)){
  return(ds_map_replace(map,key,value));
}else{
  return(ds_map_add(map,key,value));
}

#define ds_map_get
//ds_map_get(map:id,key:str/int)
return(ds_map_find_value(argument0,argument1));

#define ds_map_index_get
//ds_map_index_get(map:id,pos:int)
var map,pos,key;
map = argument0;
pos = argument1;
if(pos > ds_map_size(map)){
  return(false);
}
key = ds_map_find_first(map);
repeat(pos){
  key = ds_map_find_next(map,key);
}
return(ds_map_find_value(map,key));

#define ds_map_shuffle
//ds_map_shuffle(map:id)

/* Shuffles values relative to their keys.
/* Copy the map data into a list, shuffle the list, 
/* and replace the map data with the shuffled list data.
/*/

//create
var list,map,key,i;
map   = argument0;
list  = ds_list_create();
//copy
key   = ds_map_find_first(map);
repeat(ds_map_size(map)){
  ds_list_add(list,ds_map_get(map,key));
  key = ds_map_find_next(map,key);
}
//shuffle
ds_list_shuffle(list);
//replace
key   = ds_map_find_first(map);
i=0;
repeat(ds_list_size(list)){
  ds_map_set(map,key,ds_list_get(list,i));
  key = ds_map_find_next(map,key);
  i  += 1;
}
//clean up
ds_list_destroy(list);

return(true);

#define ds_map_sort
//ds_map_sort(map:id,ascend:bool)

/* Copy the map data into a list, sort the list, 
/* and replace the map data with the sorted list data.
/*/

var map,list,key,ascend;
map=argument0;
ascend=argument1;
list=ds_list_create();
//copy
key=ds_map_find_first(map);
repeat(ds_map_size(map)){
  ds_list_add(list,ds_map_get(map,key));
  key=ds_map_find_next(map,key);
}
//sort
ds_list_sort(list,ascend);
//replace
key=ds_map_find_first(map);
i=0;
repeat(ds_map_size(map)){
  ds_map_set(map,key,ds_list_get(list,i));
  key=ds_map_find_next(map,key);
  i+=1;
}
//clean up
ds_list_destroy(list);

return(true);

#define ds_map_search
//ds_map_search(map:id,value:str,[offset:key])
var argument_num;if(!variable_local_exists('argument_count')){var a,i;a=0;for(i=0;i<16;i+=1){if(string(argument[i])!="0"){a=i+1;}}argument_num=a;}else{argument_num=argument_count;}

var map,value,length,offset,key;
map     = argument0;
value     = argument1;
length    = ds_map_size(map);
offset    = ds_map_find_first(map);
if(argument_num>2){
  offset  = argument[2];
}
key=offset;
repeat(length){
  if(string_pos(value,string(ds_map_get(map,key)))){
    return(key);
  }
  key=ds_map_find_next(map,key);
}
return(-1);

#define ds_map_implode
//ds_map_implode(map:id,glue1:str,glue2:str)
var map,glue1,glue2,str,key;
map   = argument0;
glue1 = argument1;
glue2 = argument2;
str   = "";
key   = ds_map_find_first(map);
repeat(ds_map_size(map)){
  str+= string(key)+glue1+string(ds_map_get(map,key))+glue2;
  key = ds_map_find_next(map,key);
}

return(str);

#define ds_map_to_list
// ds_map_to_list(map:id,[list:id])
var argument_num;if(variable_local_exists('argument_count')){argument_num=argument_count;}else{var i;argument_num=0;for(i=0;i<16;i+=1){if(string(argument[i])!="0"){argument_num=i+1;}}}
var map, list, key;
map = argument0;
if(argument_num > 1){
  list = argument[1];
}else{
  list = ds_list_create();
}
key   = ds_map_find_first(map);
repeat(ds_map_size(map)){
  ds_list_add(list,ds_map_get(map,key));
  key = ds_map_find_next(map,key);
}
return(list);

#define ds_map_to_array
// ds_map_to_array(map:id,array:str)
var map,array,list;
map = argument0;
array = argument1;

// call me lazy but this is easier
list = ds_map_to_list(map);
ds_list_to_array(list,array);
ds_list_destroy(list);

return(array);

#define ds_list_set
//ds_list_set(list:id,pos:int,value:str/int)
if(ds_list_size(argument0)>=argument1){
  return(ds_list_replace(argument0,argument1,argument2));
}else{
  repeat(ds_list_size(argument0)-argument1){
    ds_list_add(argument0,0);
  }
  return(ds_list_add(argument0,argument2));
}

#define ds_list_get
//ds_list_get(list:id,pos:int)
return(ds_list_find_value(argument0,argument1));

#define ds_list_search
//ds_list_search(list:id,value:str,[offset:int])
var argument_num;if(!variable_local_exists('argument_count')){var a,i;a=0;for(i=0;i<16;i+=1){if(string(argument[i])!="0"){a=i+1;}}argument_num=a;}else{argument_num=argument_count;}

var list,value,length,offset,i;
list      = argument0;
value     = argument1;
length    = ds_list_size(list);
offset    = 0;
if(argument_num>2){
  offset  = argument[2];
}

for(i=offset;i<length;i+=1){
  if(string_pos(value,string(ds_list_get(list,i)))){
    return(i);
  }
}
return(-1);

#define ds_list_implode
//ds_list_implode(list:id,glue:str)
var list,glue,length,i,str;
list      = argument0;
glue      = argument1;
str       = "";

length  = ds_list_size(list);
for(i=0;i<length;i+=1){
  str+=string(ds_list_get(list,i))+glue;
}
return(str);

#define ds_list_to_array
//ds_list_to_array(list:id,array:str)
var list,glue,length,i;
list      = argument0;
array     = argument1;

length  = ds_list_size(list);
for(i=0;i<length;i+=1){
  array_add(array,ds_list_get(list,i));
}
return(str);

#define ds_list_to_map
// ds_list_to_map(list:id,[map:id],[prefix:str],[suffix:str])
var argument_num;if(variable_local_exists('argument_count')){argument_num=argument_count;}else{var i;argument_num=0;for(i=0;i<16;i+=1){if(string(argument[i])!="0"){argument_num=i+1;}}}
var list, map, prefix, suffix, i;
list = argument0;
if(argument_num > 1){
  map = argument[1];
}else{
  map = ds_map_create();
}
prefix = "";
if(argument_num > 2){
  prefix = argument[2];
}
suffix = "";
if(argument_num > 3){
  suffix = argument[3];
}

i=0;
repeat(ds_list_size(list)){
  ds_map_set(map,prefix+string(i)+suffix,ds_list_get(list,i));
  i  += 1;
}
return(map);

#define str_after
//str_after(input:str,from:str/int)
var str,from,len;
str             = argument0;
from            = argument1;
len             = 1;

if(is_string(from)){//normalise
  len=string_length(from);
  from=string_pos(from,str);
}

return(string_copy(str,from+len,string_length(str)-from));

#define str_after_ext
//str_after_ext(input:str,from:str/int,offset:str/int,escape:str/bool)
var str,from,len,offset,escape;
str           = argument0;
from          = argument1;
offset        = argument2;
escape        = argument3;
len           = 1;

if(is_string(from)){//normalise
  len=string_length(from);
  from=str_find_ext(str,from,offset,escape);
}

return(string_copy(str,from+len,string_length(str)-from));

#define str_after_last
//str_after_last(input:str,from:str/int,escape:str/bool)
var str,from,len,escape,i;
str     = argument0;
from    = argument1;
escape  = argument2;
len     = 1;

if(is_string(from)){//normalise
  len   = string_length(from);
  i     = 0;
  while(str_find_ext(str,from,i,escape)){
    i   = str_find_ext(str,from,i,escape);
  }
  from  = i;
}

return(string_copy(str,from+len,string_length(str)-from));

#define str_before
//str_before(input:str,to:str/int)
var str,to;
str = argument0;
to  = argument1;

//normalise
if(is_string(to)){
  to=string_pos(to,str);
}

//get all if no limit found
if(not to){
  to=string_length(str)+1;
}

return(string_copy(str,1,to-1));

#define str_before_ext
//str_before_ext(input:str,to:str/int,offset:str/int,escape:str/bool)
var str,to,offset,escape;
str         = argument0;
to          = argument1;
offset      = argument2;
escape      = argument3;

//normalise
if(is_string(to)){
  to=str_find_ext(str,to,offset,escape);
}

if(not to){
  to=string_length(str)+1;
}

return(string_copy(str,1,to-1));

#define str_before_last
//str_before_last(input:str,to:str/int,escape:str/bool)
var str,to,i;
str     = argument0;
to      = argument1;
escape  = argument2;

//normalise
if(is_string(to)){
  i = 0;
  while(str_find_ext(str,to,i,escape)){
    i = str_find_ext(str,to,i,escape);
  }
  to = i;
}

//get all if no limit found
if(not to){
  to=string_length(str);
}

return(string_copy(str,1,to-1));

#define str_between
//str_between(input:str,from:str/int,to:str/int)
var str,from,to,len;
str         = argument0;
from        = argument1;
to          = argument2;

//prepare recalibration & validate
if(is_string(from)){
  len=string_pos(from,str);
  if(!len){//fail if 'from' wasnt found
    return("");
  }
}else{
  len=from;
}

//first cut
str=str_after(str,from);

//recalibrate & fail if to<from
if(!is_string(to)){
  if(to>=len){
    to-=len;
  }else if(to){
    return("");
  }
}

//second cut
str=str_before(str,to);

return(str);

#define str_between_ext
//str_between_ext(input:str,from:str/int,to:str/int,offset:str/int,escape:str/bool,match:bool)
var str,from,to,escape,match,len,str_temp,i,c,fl,tl;
str           = argument0;
from          = argument1;
to            = argument2;
offset        = argument3;
escape        = argument4;
match         = argument5;

//prepare recalibration
if(is_string(from)){
  len=str_find_ext(str,from,offset,escape);
  if(!len){//fail if 'from' wasnt found
    return("");
  }
}else{
  len=from;
}

//first cut
str=str_after_ext(str,from,offset,escape);

//if it needs to match...
if(match) if(is_string(from)) if(is_string(to)) if(from!=to){
  str_temp=str;
  i=len;
  fl=string_length(from)-1;
  tl=string_length(to)-1;
  c=str_is_first_ext(str_temp,from,to,0,escape);
  if(c){
    while(c){
      if(str_is_first_ext(str_temp,from,to,0,escape)){
        c+=1;
        i+=str_find_ext(str_temp,from,0,escape)+fl;
        str_temp=str_after_ext(str_temp,from,0,escape);
      }else{
        c-=1;
        i+=str_find_ext(str_temp,to,0,escape)+tl;
        str_temp=str_after_ext(str_temp,to,0,escape);
      }
      if(c) if(!string_pos(from,str_temp)) if(!string_pos(to,str_temp)){
        i=to;
        show_debug_message("Datafunctions Said: Error matching "+from+" to "+to+" in "+argument0);
        break;
      }
    }
    to=i;
  }
}

//recalibrate & fail if to<from
if(!is_string(to)){
  if(to>=len){
    to-=len;
  }else if(to){
    return("");
  }
}

//second cut
str=str_before_ext(str,to,0,escape);
return(str);

#define str_outside
//str_outside(input:str,from:str/int,to:str/int)
var input,output,from,to,len;
input       = argument0;
from        = argument1;
to          = argument2;

//prepare recalibration & validate
if(is_string(from)){
  len=string_pos(from,input);
  if(!len){//fail if 'from' wasnt found
    return("");
  }
}else{
  len=from;
}

//first cut
output  = str_before(input,from);
input   = str_after(input,from);

//recalibrate & fail if to<from
if(!is_string(to)){
  if(to>=len){
    to-=len;
  }else if(to){
    return("");
  }
}

//second cut
output+=str_after(input,to);

return(output);

#define str_outside_ext
//str_outside_ext(input:str,from:str/int,to:str/int,offset:str/int,escape:str/bool,match:bool)
//to do: ,include_delimiters:bool)
var input,output,from,to,len,incdel,fl,tl;
input       = argument0;
from        = argument1;
to          = argument2;
offset      = argument3;
escape      = argument4;
match       = argument5;
//incdel      = argument6;

//prepare recalibration & validate
if(is_string(from)){
  len=str_find_ext(input,from,offset,escape);
  if(!len){//fail if 'from' wasnt found
    return("");
  }
}else{
  len=from;
}

//first cut
output  = str_before_ext(input,from,offset,escape);
input   = str_after_ext(input,from,offset,escape);

//if it needs to match...
if(match) if(is_string(from)) if(is_string(to)) if(from!=to){
  str_temp=input;
  i=len;
  fl=string_length(from)-1;
  tl=string_length(to)-1;
  c=str_is_first_ext(str_temp,from,to,0,escape);
  if(c){
    while(c){
      if(str_is_first_ext(str_temp,from,to,0,escape)){
        c+=1;
        i+=str_find_ext(str_temp,from,0,escape)+fl;
        str_temp=str_after_ext(str_temp,from,0,escape);
      }else{
        c-=1;
        i+=str_find_ext(str_temp,to,0,escape)+tl;
        str_temp=str_after_ext(str_temp,to,0,escape);
      }
      if(c) if(!string_pos(from,str_temp)) if(!string_pos(to,str_temp)){
        i=to;
        show_debug_message("Datafunctions Said: Error matching "+from+" to "+to+" in "+argument0);
        break;
      }
    }
    to=i;
  }
}

//recalibrate & fail if to<from
if(!is_string(to)){
  if(to>=len){
    to-=len;
  }else if(to){
    return("");
  }
}

//second cut
output+=str_after_ext(input,to,0,escape);

return(output);

#define str_is_first
//str_is_first(input:str,substr:str,substr:str)
var input,pos1,pos2;
input     = argument0;
pos1      = argument1;
pos2      = argument2;
//find who is first
if(is_string(pos1)){
  pos1=str_find(input,pos1);
}
if(is_string(pos2)){
  pos2=str_find(input,pos2);
}
return(pos1 && (pos1<pos2 || !pos2));

#define str_is_first_ext
//str_is_first_ext(input:str,substr:str,substr:str,offset:int,escape:str/bool)
var str0,str1,str2,escape_txt,ind1,ind2;
str0        = argument0;
str1        = argument1;
str2        = argument2;
offset      = argument3;//if set, ignore content before this point
escape      = argument4;//if true, filter escaped results
//find who is first
ind1=str_find_ext(str0,str1,offset,escape);
ind2=str_find_ext(str0,str2,offset,escape);

return(ind1 && (ind1<ind2 || !ind2));

#define str_is_escaped
//str_is_escaped(input:str,subject:str/int,escape:str/bool)
var subject,input,escape,escape_len,escaping,i;
input         = argument0;
subject       = argument1;
escape        = argument2;
escape_len    = 1;

//normalise
if(!is_string(escape)){
  if(!escape){
    return(false);
  }
  escape      = "\";
}else{
  escape_len    = string_length(escape);
}
if(is_string(subject)){
  subject     = str_find(input,subject);
}

//count preceding escape chars
i             = escape_len;
escaping      = false;
while(i<subject && string_copy(input,subject-i,escape_len)==escape){
  escaping    =!escaping;
  i          += escape_len;
}
return(escaping)

#define str_is_numeric
// str_is_numeric(input:str)

/* BlueMoonProductions
##
## argument0 = de string
##
## kijkt of een string veilig kan om worden gezet met real(x) (true of false)
*/

if is_real(argument0)
 return true

var i,n,c,dot;

n = string_length(argument0);
if n=0 then return false;

c = string_char_at(argument0,1);
if c="+" or c="-" then i = 2;
else i = 1;

if n<i then return false;

dot = false;
while i<=n {
    c = string_char_at(argument0,i);
    if c="." {
        if dot then return false;
        dot = true;
    } else if ord(c)<48 or ord(c)>57 {
        return false;
    }
    i += 1;
}

return true;

#define str_first
//str_first(input:str,substr:str,substr:str)
var input,pos1,pos2;
input     = argument0;
pos1      = argument1;
pos2      = argument2;
//find who is first
if(is_string(pos1)){
  pos1=str_find(input,pos1);
}
if(is_string(pos2)){
  pos2=str_find(input,pos2);
}
if(pos1 && (pos1<pos2 || !pos2)){
  return(argument1);
}else if(pos2){
  return(argument2);
}else{
  return("");
}

#define str_unescape
//str_unescape(input:str,escape:str/bool)
var input,output,len,escape,esc_len,i,d;
input         = argument0;
escape        = argument1;
output        = input;
len           = string_length(input);

if(!is_string(escape)){
  if(escape){
    escape    = "\";
  }else{
    return(false);
  }
}
esc_len       = string_length(escape)

//delete escaping characters
d=0;//deletion counter
for(i=0;i<len;i+=1){
  if(str_is_escaped(i,input,escape)){
    output=string_delete(output,i-d-esc_len,esc_len);
    d+=esc_len;
  }
}

return(output);

#define str_line_resize
//str_line_resize(input:str,width:int,[ellipsis:str],[words:bool])
var argument_num;if(!variable_local_exists('argument_count')){var a,i;a=0;for(i=0;i<16;i+=1){if(string(argument[i])!="0"){a=i+1;}}argument_num=a;}else{argument_num=argument_count;}

var s,w,e,word;
s = argument0;
w = argument1;
e = "...";
word = false;
if(argument_num > 2){
  e = argument[2];
}
if(argument_num > 3){
  word = argument[3];
}

if(string_width(s) > w){ // if width exceeds maximum:
  if(w < string_width(e)){ // fail on not enough places for ellipsis
    return("");
  }
  if(word){
    // shorten string by a word until it fits with ellipsis
    while(string_width(s + e) > w){
      s = str_before_last(s, " ", false);
    }
  }
  // shorten string by a character until it fits with ellipsis
  while(string_width(s + e) > w){
    s = string_copy(s, 0, string_length(s) - 1);
  }
  s += e;
}

return(s);

#define str_resize
//str_resize(input:str,width:int,height:int,start:int)
var str,w,h,start,list;
str   = argument0;
w     = argument1;
h     = argument2;
start = argument3;

list  = ds_list_create()
str_to_list(str,"#",list);

// HORIZONTAL
for(i=0;i<ds_list_size(list);i+=1){
  line = ds_list_get(list,i);
  if(string_width(line)>w) if(w>=0){ // if width exceeds maximum:
    add = 0;
    // shorten line by a word until it fits
    while(string_width(line)>w && string_pos(" ",line)){
      line = str_before_last(line," ",0);
      add = 1;
    }
    // shorten line by a character until it fits
    while(string_width(line)>w){
      line = string_copy(line,0,string_length(line)-1);
    }
    // copy the rest of the line into a new one
    ds_list_insert(list,i+1,str_after(ds_list_get(list,i),string_length(line)+add));
    ds_list_set(list,i,line);
  }
}

//VERTICAL
length  = ds_list_size(list);
str = "";
for(i=start;i<length;i+=1){
  if(string_height(str+"test#")<h || h<0){
    str+=ds_list_get(list,i)+"#";
  }else{
    break;
  }
}
  
return(str);

#define str_compress
//str_compress(input:str)
var str;
str=argument0;

//clean up leading spaces
while(string_char_at(str,1)==" "){
  str = string_delete(str,1,1);
}

//convert tabs to spaces
str=string_replace_all(str,chr(9)," ");

//clean up newlines
str=string_replace_all(str,chr(10),"");
str=string_replace_all(str,chr(13),"");

//clean up double spaces
while(string_pos("  ",str)){
  str=string_replace_all(str,"  "," ");
}

return(str);

#define str_find
//str_find(input:str,target:str)
return(string_pos(argument1,argument0));

#define str_find_ext
//str_find_ext(input:str,target:str,offset:str/int,escape:str/bool)
var target,input,offset,escape,i,s;
input           = argument0;
target          = argument1;
offset          = argument2;
escape          = argument3;

//normalise escape
if(!is_string(escape)){
  if(escape){
    escape      = "\";
  }else{
    escape      = "0";
  }
}

//normalise offset
if(is_string(offset)){
  offset        = str_find_ext(input,offset,0,escape)+string_length(offset);
}
//cut offset
if(offset){
  input         = str_after(input,offset);
}

//keep it simple or go to the loop?
if(escape=="0"){
  //simple search
  i = string_pos(target,input);
}else{
  //extended search: keep searching for targets until an unescaped one is found
  i = 0; // index
  s = 0; // security
  do{
    i  = str_find_ext(input,target,i,0);
    s += 1;
  }until(i==0 || !str_is_escaped(input,i,escape) || s>99);
  if(s>99){i = 0;}
}
//paste offset (in case of succes)
if(i){i += offset;}
return(i);

#define str_explode
//str_explode(input:str,seperator:str,array:str)
var input,sep,array,scope,i;
input = argument0;
sep   = argument1;
scope = var_get_scope(argument2);
array = var_get_name (argument2);
i=0;
//local
with(scope){
  while(str_find(sep,input)){
    variable_local_array_set(array,i,str_before(input,sep));
    input=str_after(input,sep);
    i+=1;
  }
  variable_local_array_set(array,i,input);
  return(i+1);
}
//global
while(str_find(sep,input)){
  variable_global_array_set(array,i,str_before(input,sep));
  input=str_after(input,sep);
  i+=1;
}
variable_global_array_set(array,i,input);
return(i+1);

#define str_to_list
//str_to_list(input:str,seperator:str,list:id)
var input,sep,list;
input = argument0;
sep   = argument1;
list  = argument2;

while(string_pos(sep,input)){
  ds_list_add(list,str_before(input,sep));
  input=str_after(input,sep);
}
ds_list_add(list,input);
return(list);


#define var_get
//var_get(variable:str)
var v;v=argument0;

if(var_is_local(v)){
  if(string_pos("[",v)){
    return(variable_local_array_get(str_before(v,"["),real(str_between(v,"[","]"))));
  }
  return(variable_local_get(v));
}
if(var_is_global(v)){
  if(string_pos("[",v)){
    return(variable_global_array_get(str_before(v,"["),real(str_between(v,"[","]"))));
  }
  return(variable_global_get(v));
}
if(str_find(".", v)){ with(var_get_scope(v)){
  return(var_get(var_get_name(v)));
}}
return(false);

#define var_set
//var_set(variable:str,value:str/int)
var vr;vr=argument0;
var vl;vl=argument1;

if(str_find(vr,".")){
  if(str_before(vr,".")=="global"){
    vr=var_get_name(vr);
    if(string_pos("[",vr)){
      return(variable_global_array_set(
        str_before(vr,"["),
        real(str_between(vr,"[","]")),
        vl
      ));
    }else{
      return(variable_global_set(vr,vl));
    }
  }
  with(var_get_scope(vr)){
    return(var_set(var_get_name(vr),vl));
  }
}
return(variable_local_set(vr,vl));

#define var_get_name
//var_get_name(variable:str)
if(string_pos(".",argument0)){
  return(str_after_last(argument0,".",false));
}else{
  return(argument0);
}

#define var_get_scope
//var_get_scope(variable:str)
var v, s, scope, d;
v = argument0;

//find scope
d = string_pos(".",  v);
if(d){ // if a dot is in the input, split input into:
  s = str_before(v, d); // scope (all before 1st dot)
  if(s == "global"){
    return(noone); // noone instead of global to avoid with statement errors
  }
  v = str_after(v, d); // variable (all after 1st dot)
  if(var_is_local(s)){ // if scope is existent
    scope = var_get(s); // get scope value
    if(!is_string(scope)){ // if scope is integer
      if(!scope)if(string_digits(s) == s){
        scope=real(s); // if scope is not a varname but instance id, use that
      }
      if(instance_exists(scope)){ // if scope ended up to be an instance or object id
        with(scope){ // go to that instance, repeat these steps
          return(var_get_scope(v));//recursively repeat [amount of dots in input] times
        }
      }
    }
  }
}else if(var_is_global(v)){
  return(noone); // noone instead of global to avoid with statement errors
}

with(id){ // return in with statement to avoid object ids
  return(id); // if no dot / global scope, return id
}

//ultimately, this returns the id of the instance that holds the actual variable we're talking about
//example: var_get_scope("parent.firstchild.nextsibling.lastchild.somevariable")
//this function would return the second sibling's last child's id, assuming the vars are set correctly

#define var_is_set
//var_is_set(variable:str)
return(var_is_local(argument0) || var_is_global(argument0));


#define var_is_set_ext
//var_is_set_ext(variable:str)
var v,s;
v=argument0;

//check local
if(var_is_local(v)){
  return(true);
}
//check global
if(var_is_global(v)){
  return(true);
}
//check scope
if(str_find(v,".")){
  with(var_get_scope(v)){
    return(var_is_set(var_get_name(v)));
  }
}

return(false);

#define var_is_empty
//var_is_empty(variable:str)
var vr,vl,sc;
vr=argument0;

//check local
vl=variable_local_get(vr);
if(string(vl)!="0" || string(vl)!=""){
  return(false);
}
//check global
vl=variable_global_get(vr);
if(string(vl)!="0" || string(vl)!=""){
  return(false);
}
//check scope
if(str_find(vr,".")){
  with(var_get_scope(vr)){
    return(var_is_empty(var_get_name(vr)));
  }
}

return(true);

#define var_is_local
//var_is_local(variable:str)
if(string_pos("[",argument0)){
  return(variable_local_exists(str_before(argument0,"[")));
}
return(variable_local_exists(argument0));

#define var_is_global
//var_is_global(variable:str)
if(string_pos("[",argument0)){
  return(variable_global_exists(str_before(argument0,"[")));
}
return(variable_global_exists(argument0));

