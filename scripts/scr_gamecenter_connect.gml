if(global.isTryGamecenter)
    return 0;
    
global.isTryGamecenter = true;

if(os_type == os_ios)
{
    if(!achievement_login_status())
    {        
        achievement_login();
    }
}

