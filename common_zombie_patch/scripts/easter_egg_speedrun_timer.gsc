#include common_scripts\utility;

main()
{   
    level.easter_egg_speedrun_time = 0;

    level.easter_egg_speedrun_timer_text_started = undefined;

    level.easter_egg_speedrun_timer_count_started = undefined;
    
    level.easter_egg_speedrun_timer_count_finished = undefined;
}

easter_egg_speedrun_timer_text_started()
{
    level.easter_egg_speedrun_timer_text_started = NewClientHudElem(self);
    level.easter_egg_speedrun_timer_text_started.foreground = true;
    level.easter_egg_speedrun_timer_text_started.hidewheninmenu = true;
    level.easter_egg_speedrun_timer_text_started.y = 0;
    level.easter_egg_speedrun_timer_text_started.x = 5;
    level.easter_egg_speedrun_timer_text_started.alignX = "left";
    level.easter_egg_speedrun_timer_text_started.alignY = "middle";
    level.easter_egg_speedrun_timer_text_started.horzAlign = "left";
    level.easter_egg_speedrun_timer_text_started.vertAlign = "middle";
    level.easter_egg_speedrun_timer_text_started SetText("EE Speedrun Time Elapsed:");

    for (;;)
    {
        if (getDvar("cg_renderSpeedrunTimer") == "1")
        {
            level.easter_egg_speedrun_timer_text_started.alpha = 1;
        }
        else if (getDvar("cg_renderSpeedrunTimer") == "0")
        {
            level.easter_egg_speedrun_timer_text_started.alpha = 0;
        }
        
        wait 0.1;
    }
}

easter_egg_speedrun_timer_count_started()
{
    level.easter_egg_speedrun_timer_count_started = NewClientHudElem(self);
    level.easter_egg_speedrun_timer_count_started.foreground = true;
    level.easter_egg_speedrun_timer_count_started.hidewheninmenu = true;
    level.easter_egg_speedrun_timer_count_started.y = 0;
    level.easter_egg_speedrun_timer_count_started.x = 117;
    level.easter_egg_speedrun_timer_count_started.alignX = "left";
    level.easter_egg_speedrun_timer_count_started.alignY = "middle";
    level.easter_egg_speedrun_timer_count_started.horzAlign = "left";
    level.easter_egg_speedrun_timer_count_started.vertAlign = "middle";
    level.easter_egg_speedrun_timer_count_started.color = (255, 255, 0); 
    level.easter_egg_speedrun_timer_count_started SetTimerUp(level.easter_egg_speedrun_time);

    for (;;)
    {
        if (getDvar("cg_renderSpeedrunTimer") == "1")
        {
            level.easter_egg_speedrun_timer_count_started.alpha = 1;
        }
        else if (getDvar("cg_renderSpeedrunTimer") == "0")
        {
            level.easter_egg_speedrun_timer_count_started.alpha = 0;
        }
        
        wait 0.1;
    }

    level.easter_egg_speedrun_started_time = GetTime();
}

easter_egg_speedrun_timer_count_finished()
{
    easter_egg_speedrun_finished_time = GetTime();

    easter_egg_speedrun_elapsed_milliseconds = easter_egg_speedrun_finished_time - level.easter_egg_speedrun_started_time;

    easter_egg_speedrun_elapsed_seconds = int(easter_egg_speedrun_elapsed_milliseconds / 1000);

    easter_egg_speedrun_in_hours = int(easter_egg_speedrun_elapsed_seconds / 3600);
    easter_egg_speedrun_in_minutes = int((easter_egg_speedrun_elapsed_seconds % 3600) / 60);
    easter_egg_speedrun_in_seconds = easter_egg_speedrun_elapsed_seconds % 60;

    if (easter_egg_speedrun_in_hours < 10)
    {
        easter_egg_speedrun_in_hours_string = "0" + easter_egg_speedrun_in_hours;
    }
    else
    {
        easter_egg_speedrun_in_hours_string = easter_egg_speedrun_in_hours;
    }
        
    if (easter_egg_speedrun_in_minutes < 10)
    {
        easter_egg_speedrun_in_minutes_string = "0" + easter_egg_speedrun_in_minutes;
    } 
    else
    {
        easter_egg_speedrun_in_minutes_string = easter_egg_speedrun_in_minutes;
    }

    if (easter_egg_speedrun_in_seconds < 10)
    {
        easter_egg_speedrun_in_seconds_string = "0" + easter_egg_speedrun_in_seconds;
    }
    else
    {
        easter_egg_speedrun_in_seconds_string = easter_egg_speedrun_in_seconds;
    }

    easter_egg_speedrun_formatted_time = easter_egg_speedrun_in_hours_string + ":" + easter_egg_speedrun_in_minutes_string + ":" + easter_egg_speedrun_in_seconds_string;

    level.easter_egg_speedrun_timer_count_finished = NewClientHudElem(self);
    level.easter_egg_speedrun_timer_count_finished.foreground = true;
    level.easter_egg_speedrun_timer_count_finished.hidewheninmenu = true;
    level.easter_egg_speedrun_timer_count_finished.y = 0;
    level.easter_egg_speedrun_timer_count_finished.x = 117;
    level.easter_egg_speedrun_timer_count_finished.alignX = "left";
    level.easter_egg_speedrun_timer_count_finished.alignY = "middle";
    level.easter_egg_speedrun_timer_count_finished.horzAlign = "left";
    level.easter_egg_speedrun_timer_count_finished.vertAlign = "middle";
    level.easter_egg_speedrun_timer_count_finished.color = (255, 255, 0); 
    level.easter_egg_speedrun_timer_count_finished SetText(easter_egg_speedrun_formatted_time);

    for (;;)
    {
        if (getDvar("cg_renderSpeedrunTimer") == "1")
        {
            level.easter_egg_speedrun_timer_count_finished.alpha = 1;
        }
        else if (getDvar("cg_renderSpeedrunTimer") == "0")
        {
            level.easter_egg_speedrun_timer_count_finished.alpha = 0;
        }
        
        wait 0.1;
    }
}