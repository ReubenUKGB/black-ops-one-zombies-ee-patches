#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;
#include animscripts\zombie_Utility;


main_start()
{
	SetSavedDvar( "sm_sunShadowSmallScriptPS3OnlyEnable", true );
	
	PreCacheModel("collision_wall_256x256x10");
	PreCacheModel("collision_wall_512x512x10");
	PreCacheModel("collision_wall_128x128x10");
	PreCacheModel("p_zom_barrel_01_snow");
	
	level._use_choke_weapon_hints = 1;
	level._use_choke_blockers = 1;
	
	level thread residence_door_fix();
}


main_end()
{

	collision = spawn("script_model", (107, -789, 335));
	collision setmodel("collision_wall_256x256x10");
	collision.angles = (0, 307.2, 0);
	collision Hide();
	
	collision2 = spawn("script_model", (86, 954, 606));
	collision2 setmodel("collision_wall_512x512x10");
	collision2.angles = (0, 30.4, 0);
	collision2 Hide();
	
	collision3 = spawn("script_model", (237, 896, 966));
	collision3 setmodel("collision_wall_256x256x10");
	collision3.angles = (0, 295.2, 0);
	collision3 Hide();
	
	collision4 = spawn("script_model", (160, 861, 966));
	collision4 setmodel("collision_wall_256x256x10");
	collision4.angles = (0, 295.4, 0);
	collision4 Hide();	
	
	//residence_door
	collision5 = spawn("script_model", (-515, 769, 319));
	collision5 setmodel("collision_wall_128x128x10");
	collision5.angles = (0, 347.4, 0);
	collision5 Hide();		

	//ship debris
	collision6 = spawn("script_model", (-630, -1375, 403));
	collision6 setmodel("collision_wall_128x128x10");
	collision6.angles = (0, 281.6, 0);
	collision6 Hide();
	collision6_debris = spawn("script_model", (-634, -1417, 354.69));
	collision6_debris setmodel("p_zom_barrel_01_snow");
	collision6_debris.angles = (355.801, 281.688, -1.20149);

	sprintclip7 = spawn("script_model", (-714, 776, 563));
	sprintclip7 setmodel("collision_wall_128x128x10");
	sprintclip7.angles = (0, 0, 0);
	sprintclip7 Hide();	

	// sprint off lighthouse
	maps\_zombiemode::spawn_life_brush( (360, 616, 424), 256, 256 );

	sprintclip = spawn("script_model", (514, 772, 554));
	sprintclip setmodel("collision_wall_512x512x10");
	sprintclip.angles = (0, 26.6, 0);
	sprintclip Hide();	
	
}

residence_door_fix()
{
	door_clip = GetEntArray("script_brushmodel","classname");
	
	for ( i = 0; i < door_clip.size; i++ )
	{
		if(door_clip[i].origin == (-460, 752, 297))
		{
			door_clip[i].script_angles = (0, -160, 0);
		}
		if(door_clip[i].origin == (-460, 669, 297))
		{
			door_clip[i].script_angles = (0, 140, 0);
		}	 
	}		
}	