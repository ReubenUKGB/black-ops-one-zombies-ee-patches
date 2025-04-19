#include common_scripts\utility;

main()
{
    switch (GetDvar("mapname"))
	{
        case "zombie_cosmodrome":
        case "zombie_coast":
        case "zombie_temple":
        case "zombie_moon":
            thread on_player_connect();
            break;
	}
}

on_player_connect()
{ 
    for (;;)
    {
        level waittill("connected", player);

        player setClientDvar("cg_drawWatermark", "1");
        
        player setClientDvar("cg_drawSpeedrunTimer", "1");

        player thread scripts\hud_elem::mod_watermark();
    }
}