//Scripts run by server
if (isServer) then {
	nul = execVM "scripts\storyboard\task1.sqf";    //Tasks for WEST
	nul = execVM "scripts\aconoff.sqf";				//Enable or disable the artillery computer
	nul = execVM "scripts\spawnai\aispawnziel1.sqf";		//Spawn first enemies
};
//Scripts run by player
if (!isDedicated) then {
};
