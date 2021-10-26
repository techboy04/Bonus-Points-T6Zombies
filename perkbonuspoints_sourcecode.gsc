#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;

init()
{
    level thread onPlayerConnect();
    setBonusPoints();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
    self endon("disconnect");
	level endon("game_ended");
    for(;;)
    {
        self waittill("spawned_player");
		self iprintln("^4Perk Machine Bonus Points ^7created by ^1techboy04gaming");
    }
}

perk_trigger(x,y,z)
{
	trigger = spawn( "trigger_radius", ( x,y,z ), 1, 50, 50 );
	while(1)
	{
		trigger waittill( "trigger", i );
		if ( i GetStance() == "prone" )
		{
			i.score += 100;
			i playsound( "zmb_cha_ching" );
			trigger delete();
			break;
		}
	}
}

setBonusPoints()
{
	if ( getDvar( "g_gametype" ) == "zgrief" || getDvar( "g_gametype" ) == "zstandard" )
	{
		if(getDvar("mapname") == "zm_prison") //mob of the dead grief
		{
			level thread perk_trigger(2811,9306,1336); //deadshot
			level thread perk_trigger(-500,8645,1336); //speedcola
			level thread perk_trigger(1164,9675,1545); //doubletap
			level thread perk_trigger(1768,10656,1336); //juggernog
			level thread perk_trigger(371,10652,1336); //phd
		}
		else if(getDvar("mapname") == "zm_buried") //buried grief
		{
			level thread perk_trigger(1429,2267,16); //quickrevive
			level thread perk_trigger(-131,-357,144); //speedcola
			level thread perk_trigger(2326,975,88); //doubletap
			level thread perk_trigger(-663,1030,8); //juggernog
			level thread perk_trigger(762,1503,-6); //staminup
			level thread perk_trigger(-712,-1210,144); //mulekick
		}
		else if(getDvar("mapname") == "zm_nuked") //nuketown
		{
			level thread perk_trigger(764,-71,-63); //perk 1
			level thread perk_trigger(1581,947,-60); //perk 2
			level thread perk_trigger(679,43,79); //perk 3
			level thread perk_trigger(2028,192,-63); //perk 4
			level thread perk_trigger(-2018,255,-61); //perk 5
			level thread perk_trigger(-1676,954,-63); //perk 6
			level thread perk_trigger(-124,725,-63); //perk 7
			level thread perk_trigger(1347,626,-57); //perk 8
			level thread perk_trigger(-427,664,-63); //perk 9
			level thread perk_trigger(-857,100,-55); //perk 10
		}
		else if(getDvar("mapname") == "zm_transit") //transit grief and survival
		{
			level thread perk_trigger(1850,141,88); //quickrevive
			level thread perk_trigger(835,85,-39); //speedcola
			level thread perk_trigger(2072,-1372,-49); //doubletap
			level thread perk_trigger(1046,-1521,128); //juggernog
			level thread perk_trigger(1745,479,-55); //staminup
			level thread perk_trigger(1752,-1097,-55); //tombstone

			level thread perk_trigger(8050,-5497,40); //quickrevive
			level thread perk_trigger(8136,-6340,117); //speedcola
			level thread perk_trigger(8037,-4632,264); //doubletap
			level thread perk_trigger(8183,-6430,245); //juggernog
		}
	}
	else
	{
		if(getDvar("mapname") == "zm_prison") //mob of the dead
		{
			level thread perk_trigger(4019,9526,1528); //deadshot
			level thread perk_trigger(-495,8646,1336); //speedcola
			level thread perk_trigger(325,9100,1132); //doubletap
			level thread perk_trigger(513,6646,208); //juggernog
			level thread perk_trigger(1146,9671,1545); //electric
		}
		else if(getDvar("mapname") == "zm_buried") //buried
		{
			level thread perk_trigger(-923,-255,288); //quickrevive
			level thread perk_trigger(142,636,176); //speedcola
			level thread perk_trigger(2426,48,88); //doubletap
			level thread perk_trigger(-664,1030,8); //juggernog
			level thread perk_trigger(6984,389,108); //staminup
			level thread perk_trigger(-712,-1210,144); //mulekick
			level thread perk_trigger(1432,2267,16); //vultureaid
		}
		else if(getDvar("mapname") == "zm_transit") //transit
		{
			level thread perk_trigger(-6707,5031,-55); //quickrevive
			level thread perk_trigger(-5508,-7857,0); //speedcola
			level thread perk_trigger(8043,-4632,264); //doubletap
			level thread perk_trigger(1047,-1521,128); //juggernog
			level thread perk_trigger(1848,475,-55); //staminup
			level thread perk_trigger(10907,8311,-407); //tombstone
		}
		else if(getDvar("mapname") == "zm_tomb") //origins
		{
			level thread perk_trigger(2358,5048,-303); //quickrevive
			level thread perk_trigger(885,3249,-170); //speedcola
			level thread perk_trigger(-2,-441,-493); //mulekick
			level thread perk_trigger(2327,-193,139); //juggernog
			level thread perk_trigger(-2381,-8,234); //staminup
		}
	}
}

