//Scripts run by server
if (isServer) then {
	nul = execVM "scripts\aconoff.sqf";						//Enable or disable the artillery computer
	nul = execVM "scripts\timeacc.sqf";						//Timeacceleration
	
	nul = execVM "scripts\storyboard\task1.sqf";    		//Tasks for WEST
	nul = execVM "scripts\spawnai\aispawnziel1.sqf";

	
	
	
};
//Scripts run by player
if (!isDedicated) then {
	nul = execVM "scripts\radio\radio1.sqf";
	

};
	_null = [] call BT_fnc_initBtFob;
