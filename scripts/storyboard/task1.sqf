/*

				Description:
				"taskw1" = Maintask for Blufor team
				"taskws1" = 1. subtask for Blufor team				
*/

//main tasks
sleep 5;
[blufor,["taskw1"],["Erobern und befreien Sie die Stadt Syrta. Nutzen Sie die Artillerie zur Unterstützung.","Syrta befreien.",""],getMarkerPos "ziel1",1,2,true] call BIS_fnc_taskCreate;
[blufor,["taskw2"],["Erobern und befreien Sie die Stadt Abdera. Nutzen Sie die Artillerie zur Unterstützung.","Abdera befreien.",""],getMarkerPos "ziel2","CREATED",3,true] call BIS_fnc_taskCreate;
[blufor,["taskw3"],["Erobern Sie das Flugfeld und schalten Sie die restlichen Opfortruppen aus.","Flugfeld einnehmen.",""],getMarkerPos "ziel3","CREATED",3,true] call BIS_fnc_taskCreate;
sleep 5;
["taskw1", "ASSIGNED",true] spawn BIS_fnc_taskSetState;

/* //sub tasks
sleep 5;
[blufor,["taskws1","taskw1"],["Erreichen Sie Checkpoint Alpha","Checkpoint Alpha",""],getMarkerPos "alpha","CREATED",3,true] call BIS_fnc_taskCreate;
sleep 5;
*/








