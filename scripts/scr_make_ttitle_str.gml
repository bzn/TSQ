var str = argument0;
var len = string_length(str);
var newname = "";
if(len == 2)
    newname = string_copy(str, 1, 1) + "                " + string_copy(str, 2, 1);
else if(len == 3)
    newname = string_copy(str, 1, 1) + "      " + string_copy(str, 2, 1) + "      " + string_copy(str, 3, 1);
else if(len == 4)
    newname = string_copy(str, 1, 1) + "  " + string_copy(str, 2, 1) + "    " + string_copy(str, 3, 1) + "  " + string_copy(str, 4, 1);
return newname;
