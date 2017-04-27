/*

				Description:
				"taskw1" = Maintask for Blufor team
				"taskws1" = 1. subtask for Blufor team				
*/

//main tasks
["taskw3", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;

[blufor,["taskw4"],["Kehren Sie mit den Hubschraubern zur Basis zurück.","Extraktion.",""],getMarkerPos "respawn_west",1,2,true] call BIS_fnc_taskCreate;

