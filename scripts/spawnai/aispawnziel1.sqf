//Zielposition ermittlen
_position = getmarkerpos "ziel1";
_positionextra = getmarkerpos "aispawnextra";

//Einheiten Spawnen
g1 = [_position, EAST, 8, [], [], [0.4,0.5]] call BIS_fnc_spawnGroup;
sleep 5;
g1f3 = [_position findEmptyPosition [10,250], random 360, "O_Truck_03_covered_F", g1] call bis_fnc_spawnvehicle;
sleep 15;
g1f2 = [_position findEmptyPosition [10,250], random 360, "O_MRAP_02_gmg_F", g1] call bis_fnc_spawnvehicle;
sleep 15;
g1f3 = [_position findEmptyPosition [10,250], random 360, "O_MRAP_02_hmg_F", g1] call bis_fnc_spawnvehicle;

//Verhalten der KI, KI ist trotzdem daehhhhhmlich ;)
g1 setBehaviour "AWARE";
g1 setCombatMode "RED";

_wpg1 =g1 addWaypoint [getmarkerpos "wp1", 1];
_wpg2 =g1 addWaypoint [getmarkerpos "wp2", 2];
_wpg3 =g1 addWaypoint [getmarkerpos "wp3", 3];
_wpg4 =g1 addWaypoint [getmarkerpos "wp4", 4];
_wpg5 =g1 addWaypoint [getmarkerpos "wp1", 5];

_wpg1 setWaypointType "MOVE";
_wpg2 setWaypointType "MOVE";
_wpg3 setWaypointType "MOVE";
_wpg4 setWaypointType "MOVE";
_wpg5 setWaypointType "CYCLE";

_wpg1 setWaypointBehaviour "AWARE";
_wpg2 setWaypointBehaviour "AWARE";
_wpg3 setWaypointBehaviour "AWARE";
_wpg4 setWaypointBehaviour "AWARE";
_wpg5 setWaypointBehaviour "AWARE";

_wpg1 setWaypointSpeed "NORMAL";
_wpg2 setWaypointSpeed "NORMAL";
_wpg3 setWaypointSpeed "NORMAL";
_wpg4 setWaypointSpeed "NORMAL";
_wpg5 setWaypointSpeed "NORMAL";

g1 setCurrentWaypoint [g1, 1];

//extraspawn
g1extra = [_positionextra, EAST, 5, [], [], [0.4,0.5]] call BIS_fnc_spawnGroup;
g1extra setBehaviour "SAFE";
g1extra setCombatMode "YELLOW";
