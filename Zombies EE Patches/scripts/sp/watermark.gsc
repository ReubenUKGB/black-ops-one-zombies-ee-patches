#include common_scripts\utility;
#include maps\_utility;

main()
{
    switch (GetDvar("mapname"))
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
    for (;;)
    {
        level waittill("connected", player);

        player thread show_watermark();
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
