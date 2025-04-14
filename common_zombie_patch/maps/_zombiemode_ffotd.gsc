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
}

points()
{
	flag_wait("all_players_connected");
}

main_end()
{
	level thread onPlayerConnect();
}

onPlayerConnect()
{
	for ( ;; )
	{
		level waittill( "connecting", player );

		player thread claymore_to_notsolid();

		player thread scripts\easter_egg_speedrun_timer::main();
		
		player thread scripts\watermark::main();
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
