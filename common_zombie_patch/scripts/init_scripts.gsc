#include common_scripts\utility;

on_player_connect()
{ 
    for (;;)
    {
        level waittill("connected", player);

        player setClientDvar("cg_renderWatermark", "1");
        
        player setClientDvar("cg_renderSpeedrunTimer", "1");

        player thread scripts\watermark::mod_watermark();
    }
}