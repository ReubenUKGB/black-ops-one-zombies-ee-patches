#include common_scripts\utility;

main()
{
    switch (GetDvar("mapname"))
	{
        case "zombie_coast":
        case "zombie_cosmodrome":
        case "zombie_temple":
        case "zombie_moon":
            thread scripts\init_scripts::on_player_connect();
            break;
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
    mod_info SetText("BO1: Zombies EE Patches v1.2");

    for (;;)
    {
        if (getDvar("cg_renderWatermark") == "1")
        {
            mod_info.alpha = 0.5;
        }
        else if (getDvar("cg_renderWatermark") == "0")
        {
            mod_info.alpha = 0;
        }
        
        wait 0.1;
    }
}
