#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;
#include animscripts\zombie_Utility;


main_start()
{
}


main_end()
{
	level thread luna_letters_spawn();
}

luna_letters_spawn()
{
	flag_wait("all_players_spawned");
	if (flag("solo_game"))
	{
		level.lander_letters[ "l" ].origin += (-400, 1000, -600);

		level.lander_letters[ "n" ].origin += (0, 100, 100);

		level.lander_letters[ "a" ].origin += (-1975, 1250, 100);

		IPrintLn(level.lander_letters[ "l" ].origin);
		IPrintLn(level.lander_letters[ "n" ].origin);
		IPrintLn(level.lander_letters[ "a" ].origin);
	}
}