//Zielposition ermittlen
_position = getmarkerpos "ziel2";

//Einheiten Spawnen
g2 = [_position, EAST, 6, [], [], [0.4,0.5]] call BIS_fnc_spawnGroup;
g3 = [_position, EAST, 6, [], [], [0.4,0.5]] call BIS_fnc_spawnGroup;
sleep 5;
g2f1 = [_position findEmptyPosition [10,250], random 360, "O_APC_Tracked_02_AA_F", g3] call bis_fnc_spawnvehicle;
sleep 15;
g2f2 = [_position findEmptyPosition [10,250], random 360, "O_MRAP_02_gmg_F", g3] call bis_fnc_spawnvehicle;
sleep 15;
g3f1 = [_position findEmptyPosition [10,250], random 360, "O_MRAP_02_hmg_F", g3] call bis_fnc_spawnvehicle;
sleep 15;
g3f2 = [_position findEmptyPosition [10,250], random 360, "O_G_Offroad_01_armed_F", g3] call bis_fnc_spawnvehicle;
  	

//Verhalten der KI, KI ist trotzdem daehhhhhmlich ;)
g2 setBehaviour "AWARE";
g2 setCombatMode "RED";
g3 setBehaviour "AWARE";
g3 setCombatMode "RED";

_wpg6 =g2 addWaypoint [getmarkerpos "wp5", 6];
_wpg7 =g2 addWaypoint [getmarkerpos "wp6", 7];
_wpg8 =g2 addWaypoint [getmarkerpos "wp7", 8];
_wpg9 =g2 addWaypoint [getmarkerpos "wp8", 9];
_wpg10 =g2 addWaypoint [getmarkerpos "wp5", 10];

_wpg6 setWaypointType "MOVE";
_wpg7 setWaypointType "MOVE";
_wpg8 setWaypointType "MOVE";
_wpg9 setWaypointType "MOVE";
_wpg10 setWaypointType "CYCLE";

_wpg6 setWaypointBehaviour "AWARE";
_wpg7 setWaypointBehaviour "AWARE";
_wpg8 setWaypointBehaviour "AWARE";
_wpg9 setWaypointBehaviour "AWARE";
_wpg10 setWaypointBehaviour "AWARE";

_wpg6 setWaypointSpeed "NORMAL";
_wpg7 setWaypointSpeed "NORMAL";
_wpg8 setWaypointSpeed "NORMAL";
_wpg9 setWaypointSpeed "NORMAL";
_wpg10 setWaypointSpeed "NORMAL";

g2 setCurrentWaypoint [g2, 6];
