#include common_scripts\utility;

on_player_connect()
{ 
    for (;;)
    {
        level waittill("connected", player);

        player setClientDvar("cg_drawWatermark", "1");
        
        player setClientDvar("cg_drawSpeedrunTimer", "1");

        player thread scripts\watermark::mod_watermark();
    }
}