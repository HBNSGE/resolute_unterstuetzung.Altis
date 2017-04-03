/*

				Description:
				"taskw1" = Maintask for Blufor team
				"taskws1" = 1. subtask for Blufor team				
*/

//main tasks
["taskw3", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
sleep 4;
"EveryoneWon" call BIS_fnc_endMissionServer;
