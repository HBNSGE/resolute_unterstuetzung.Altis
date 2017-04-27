/*

				Description:
				"taskw1" = Maintask for Blufor team
				"taskws1" = 1. subtask for Blufor team				
*/

//main tasks
sleep 5;
[blufor,["taskw1"],["Erobern und befreien Sie die Stadt Syrta. Nutzen Sie die Artillerie zur Unterstützung.","Syrta befreien.",""],getMarkerPos "ziel1",1,2,true] call BIS_fnc_taskCreate;
[blufor,["taskw2"],["Erobern und befreien Sie die Stadt Abdera. Nutzen Sie die Artillerie zur Unterstützung.","Abdera befreien.",""],getMarkerPos "ziel2","CREATED",3,true] call BIS_fnc_taskCreate;
[blufor,["taskw3"],["Erobern Sie das Flugfeld und schalten Sie die restlichen Opfortruppen aus. Rufen Sie die Extraktionshelikopter über RADIO ALPHA (^), wenn alle Feinde auf dem Flugfeld vernichtet sind.","Flugfeld einnehmen.",""],getMarkerPos "ziel3","CREATED",3,true] call BIS_fnc_taskCreate;
sleep 5;
["taskw1", "ASSIGNED",true] spawn BIS_fnc_taskSetState;