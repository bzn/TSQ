//Menu sabot draw

//Character select screen
if (state==1){
    //Draw options
//    draw_sprite(spr_onoff,global.nomusic,221*2,211*2);
//    draw_sprite(spr_onoff,global.nosound,221*2,225*2);
    draw_sprite(spr_onoff,global.noasteroids,221*2,239*2);
    draw_sprite(spr_onoff,global.noitems,221*2,253*2);
    
    //Draw char names and traits
    draw_set_color(c_white);
    draw_set_font(global.font);
    draw_text(192-string_length(global.charname[global.select[0]])*12,320,global.charname[global.select[0]]);
    draw_set_font(global.font2);
    draw_text(612-string_length(global.charname[global.select[1]])*12,320,global.charname[global.select[1]]);
    
    draw_set_font(global.font3);
    draw_text(196-string_length(global.chartrait[global.select[0]])*7,358,global.chartrait[global.select[0]]);
    draw_set_font(global.font4);
    draw_text(616-string_length(global.chartrait[global.select[1]])*7,358,global.chartrait[global.select[1]]);
    
    
    //Draw start text
    starttextcyc+=1;
    if (starttextcyc==8)
        starttextcyc=0;
    if (starttextcyc mod 8 < 4)
        draw_set_font(global.font3);
    else
        draw_set_font(global.font4);
        draw_set_font(global.font3);
    temptext1="ENTER<=<MULTIPLAYER";
    temptext2="P<=<SINGLEPLAYER";
    draw_text(408-string_length(temptext1)*7,561,temptext1);
    draw_text(408-string_length(temptext2)*7,586,temptext2);

    //Set font back to normal
    draw_set_font(global.font);
    
    //Draw char icons
    for (i=0;i<4;i+=1){
        for (j=0;j<2;j+=1){
            draw_sprite(spr_portraits,i+j*4,floor(room_width/2)-48-96+i*96,128+j*96);
            if (i==3 && j==1 && !global.unlock)
                draw_sprite(spr_portraits,8,floor(room_width/2)-48-96+i*96,128+j*96);
            }
        }
    draw_sprite(spr_portraits,9,floor(room_width/2)-48-96+4*96,128+96);
    //locked
    //Draw player selection markers
    selectimgcyc+=1;
    if (selectimgcyc==2){
        selectimgcyc=0;
        selectimg1+=1;
        selectimg2+=1;
        if (selectimg1==4)
            selectimg1=0;
        if (selectimg2==4)
            selectimg2=0;
        }
    //hack for random character
    if (global.select[1]==8)
        draw_sprite(spr_marker,selectimg2+4,floor(room_width/2)-48+96*3-1+floor(random(3)),128+96-1+floor(random(3)));
    else
        draw_sprite(spr_marker,selectimg2+4,floor(room_width/2)-48-96+(global.select[1] mod 4)*96-1+floor(random(3)),128+floor(global.select[1]/4)*96-1+floor(random(3)));
    //more hack
    if (global.select[0]==8)
        draw_sprite(spr_marker,selectimg1,floor(room_width/2)-48+96*3-1+floor(random(3)),128+96-1+floor(random(3)));
    else
        draw_sprite(spr_marker,selectimg1,floor(room_width/2)-48-96+(global.select[0] mod 4)*96-1+floor(random(3)),128+floor(global.select[0]/4)*96-1+floor(random(3)));
    
    //Select characters
    scr_mangraphics();
    //Dancing men on character select
    cyc+=1;
    if (cyc mod 16<4)
        victorydance=0;
    else if (cyc mod 16<8)
        victorydance=1;
    else if (cyc mod 16<12)
        victorydance=2;
    else
        victorydance=3;
    //Draw random or regular char
    if (global.select[0]==8)
        draw_sprite_ext(spr_questionmark,0,192+16-1+floor(random(3)),floor((room_height/4)*3)+24-1+floor(random(3)),4,4,0,c_white,1);
    else
        draw_sprite_ext(global.man1victory,victorydance,192+16,floor((room_height/4)*3)+24,-4,4,0,c_white,1);
    if (global.select[1]==8)
        draw_sprite_ext(spr_questionmark,0,624-16-1+floor(random(3)),floor((room_height/4)*3)+24-1+floor(random(3)),4,4,0,c_white,1);
    else
        draw_sprite_ext(global.man2victory,victorydance,624-16,floor((room_height/4)*3)+24,4,4,0,c_white,1);
    }
