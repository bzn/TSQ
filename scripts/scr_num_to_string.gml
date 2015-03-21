var num = argument0;
var str = "";
while(1)
{
    var numA = num/1000;
    var numB = num%1000;
            
    str = string(numB) + str;
    num = floor(numA);
    
    if(num > 0)
    {
        if(numB < 10)
            str = "00"+str
        else if(numB < 100)
            str = str + "0";    
            
        str = ","+str;
    }
    else
    {
        break;
    }
}

return str;
