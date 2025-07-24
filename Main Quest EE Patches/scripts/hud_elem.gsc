#include common_scripts\utility;

speedrunTimer_enabled()
{
    return getDvarInt("cg_drawSpeedrunTimer") == 1;
}

fade_hud(hudElem, time, alpha)
{
    hudElem FadeOverTime(time);
    hudElem.alpha = alpha;

    wait(time);
}

easter_egg_speedrun_timer_text_started()
{
    easter_egg_speedrun_timer_text_started = NewClientHudElem(self);
    easter_egg_speedrun_timer_text_started.foreground = true;
    easter_egg_speedrun_timer_text_started.hidewheninmenu = true;
    easter_egg_speedrun_timer_text_started.y = 0;
    easter_egg_speedrun_timer_text_started.x = 5;
    easter_egg_speedrun_timer_text_started.alignX = "left";
    easter_egg_speedrun_timer_text_started.alignY = "middle";
    easter_egg_speedrun_timer_text_started.horzAlign = "left";
    easter_egg_speedrun_timer_text_started.vertAlign = "middle";
    easter_egg_speedrun_timer_text_started SetText("EE Speedrun Time Elapsed:");
    easter_egg_speedrun_timer_text_started.alpha = 0;

    for (;;)
    {
        if (speedrunTimer_enabled())
        {
            fade_hud(easter_egg_speedrun_timer_text_started, 0.5, 1);
        }
        else
        {   
            fade_hud(easter_egg_speedrun_timer_text_started, 0.5, 0);
        }
        
        wait 0.1;
    }
}

easter_egg_speedrun_timer_count_started()
{

    easter_egg_speedrun_time = 0;

    level.easter_egg_speedrun_started_time = GetTime();

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
    level.easter_egg_speedrun_timer_count_started SetTimerUp(easter_egg_speedrun_time);
    level.easter_egg_speedrun_timer_count_started.alpha = 0;

    for (;;)
    {
        if (speedrunTimer_enabled())
        {
            fade_hud(level.easter_egg_speedrun_timer_count_started, 0.5, 1);
        }
        else
        {   
            fade_hud(level.easter_egg_speedrun_timer_count_started, 0.5, 0);
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

    easter_egg_speedrun_timer_count_finished = NewClientHudElem(self);
    easter_egg_speedrun_timer_count_finished.foreground = true;
    easter_egg_speedrun_timer_count_finished.hidewheninmenu = true;
    easter_egg_speedrun_timer_count_finished.y = 0;
    easter_egg_speedrun_timer_count_finished.x = 117;
    easter_egg_speedrun_timer_count_finished.alignX = "left";
    easter_egg_speedrun_timer_count_finished.alignY = "middle";
    easter_egg_speedrun_timer_count_finished.horzAlign = "left";
    easter_egg_speedrun_timer_count_finished.vertAlign = "middle";
    easter_egg_speedrun_timer_count_finished.color = (255, 255, 0); 
    easter_egg_speedrun_timer_count_finished SetText(easter_egg_speedrun_formatted_time);
    easter_egg_speedrun_timer_count_finished.alpha = 0;

    for (;;)
    {
        if (speedrunTimer_enabled())
        {
            fade_hud(easter_egg_speedrun_timer_count_finished, 0.5, 1);
        }
        else
        {   
            fade_hud(easter_egg_speedrun_timer_count_finished, 0.5, 0);
        }
        
        wait 0.1;
    }
}

mod_watermark()
{
    mod_info = NewClientHudElem(self);
    mod_info.foreground = true;
    mod_info.hidewheninmenu = true;
    mod_info.y = 0;
    mod_info.x = 5;
    mod_info.alignX = "left";
    mod_info.alignY = "bottom";
    mod_info.horzAlign = "left";
    mod_info.vertAlign = "bottom";
    mod_info SetText("Black Ops: Zombies Main Quest EE Patches v1.4.2");
    mod_info.alpha = 0; 

    for (;;)
    {

        watermark = getDvarInt("cg_drawWatermark");

        if (watermark == 1)
        {
            fade_hud(mod_info, 0.5, 0.5);
        }
        else if (watermark == 0)
        {   
            fade_hud(mod_info, 0.5, 0);
        }
        
        wait 0.1;
    }
}
