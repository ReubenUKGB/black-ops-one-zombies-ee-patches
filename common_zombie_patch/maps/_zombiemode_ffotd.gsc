#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;
#include animscripts\zombie_Utility;


main_start()
{
	//This will turn off the new path method if added
	//level.calc_closest_player_using_paths = false;
	
	
	//Disable friends list and dev list from spaceman name if we want
	//setsaveddvar( "r_zombieNameAllowFriendsList", "1" );
	//setsaveddvar( "r_zombieNameAllowDevList", "1" );
	
	//We can disable additional primary machines here on a per map basis
	//just set level.zombie_additionalprimaryweapon_machine_origin to undefined and it will ignore it
	
	//Turn off 3 weapon perk machines for other maps based on dvars
	disable_additionalprimaryweapon_machine_locations();
}


main_end()
{
	level thread onPlayerConnect();
}


disable_additionalprimaryweapon_machine_locations()
{
	enabled = 0;

	switch ( Tolower( GetDvar( #"mapname" ) ) )
	{
	case "zombie_theater":
		enabled = GetDvarInt( #"scr_zm_extra_perk_theater" );
		break;
	case "zombie_pentagon":
		enabled = GetDvarInt( #"scr_zm_extra_perk_pentagon" );
		break;
	case "zombie_cosmodrome":
		enabled = GetDvarInt( #"scr_zm_extra_perk_cosmodrome" );
		break;
	case "zombie_coast":
		enabled = GetDvarInt( #"scr_zm_extra_perk_coast" );
		break;
	case "zombie_temple":
		enabled = GetDvarInt( #"scr_zm_extra_perk_temple" );
		break;
	case "zombie_moon":
		enabled = 1;
		break;
	case "zombie_cod5_prototype":
		enabled = GetDvarInt( #"scr_zm_extra_perk_cod5_prototype" );
		break;
	case "zombie_cod5_asylum":
		enabled = GetDvarInt( #"scr_zm_extra_perk_cod5_asylum" );
		break;
	case "zombie_cod5_sumpf":
		enabled = GetDvarInt( #"scr_zm_extra_perk_cod5_sumpf" );
		break;
	case "zombie_cod5_factory":
		enabled = GetDvarInt( #"scr_zm_extra_perk_cod5_factory" );
		break;
	}

	if ( GetDvarInt( #"scr_zm_extra_perk_all" ) )
	{
		enabled = 1;
	}

	if ( !enabled )
	{
		level.zombie_additionalprimaryweapon_machine_origin = undefined;
	}
}


onPlayerConnect()
{
	for ( ;; )
	{
		level waittill( "connecting", player );

		player thread claymore_to_notsolid();

		switch (GetDvar("mapname"))
		{
			case "zombie_coast":
			case "zombie_cosmodrome":
			case "zombie_temple":
			case "zombie_moon":
				player thread show_watermark();
				break;
		}	
	}
}


claymore_to_notsolid()
{
	self endon( "disconnect" );

	for ( ;; )
	{
		self waittill( "grenade_fire", claymore, weapname );
		if ( weapname == "claymore_zm" || weapname == "spikemore_zm" )
		{
			claymore NotSolid();
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
    mod_info SetText("Black Ops 1: Zombies EE Patches v1.1.3");
}

//Cheaters logic added here because its a small file (for any ffotd updates)
//TODO: Next game move to its own file
nazizombies_checking_for_cheats()
{
//WIP - PETER
// 	players = get_players();		
// 	for( i = 0; i < players.size; i++ )
// 	{
// 		total_kills = players[i].stats["kills"];
// 		total_points = players[i].stats["score"];
// 		total_rounds = (level.round_number - 1); // rounds survived
// 		total_downs = players[i].stats["downs"];
// 		total_revives = players[i].stats["revives"];
// 		total_perks = players[i].stats["perks"];
// 		total_headshots = players[i].stats["headshots"];
// 		total_zombie_gibs = players[i].stats["zombie_gibs"];
// 	}


	return false;  // no cheater found
}
