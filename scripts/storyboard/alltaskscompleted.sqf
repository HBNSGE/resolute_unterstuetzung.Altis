/*

				Description:
				"taskw1" = Maintask for Blufor team
				"taskws1" = 1. subtask for Blufor team				
*/
if (["taskw3"] call BIS_fnc_taskCompleted) then 
	{
	["taskw4", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
	sleep 4;
	"EveryoneWon" call BIS_fnc_endMissionServer;
	}
	else
	{
	hint "Die Missionsziele wurden noch nicht erfuellt";
	};
