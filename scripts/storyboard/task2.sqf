/*

				Description:
				"taskw1" = Maintask for Blufor team
				"taskws1" = 1. subtask for Blufor team				
*/

//main tasks
["taskw1", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
["taskw2", "ASSIGNED",true] spawn BIS_fnc_taskSetState;

if (isServer) then {
	nul = execVM "scripts\spawnai\aispawnziel2.sqf";				//Enable or disable the artillery computer
};