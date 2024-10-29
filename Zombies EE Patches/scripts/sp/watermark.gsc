#include common_scripts\utility;
#include maps\_utility;

main()
{
    switch (getdvar("mapname"))
	{
        case "zombie_coast":
		case "zombie_cosmodrome":
		case "zombie_temple":
		case "zombie_moon":
            thread on_player_connect();
            return;
	}
}

on_player_connect()
{
    enable_watermark = 1;

    for (;;)
    {
        if (enable_watermark == 1)
        {
            level waittill( "connected", player );

            enable_watermark = 0;

            player thread show_watermark();
        }    
        else
        {
            return;
        }
    }
}

show_watermark()
{
    flag_wait("all_players_connected");
    mod_info = NewClientHudElem(self);
    mod_info.foreground = true;
    mod_info.hidewheninmenu = true;
    mod_info.y = 0;
    mod_info.x = 5;
    mod_info.alignX = "left";
    mod_info.alignY = "bottom";
    mod_info.horzAlign = "left";
    mod_info.vertAlign = "bottom";
    mod_info.alpha = 0.5;
    mod_info SetText("Zombies EE Patches v1.1.2");
}