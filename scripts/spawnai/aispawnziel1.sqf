//Zielposition ermittlen
_position = getmarkerpos "ziel1";

//Einheiten Spawnen
g1 = [_position, EAST, 8, [], [], [0.4,0.5]] call BIS_fnc_spawnGroup;
sleep 5;
g1f = [_position findEmptyPosition [10,250], random 360, "O_MBT_02_cannon_F", g1] call bis_fnc_spawnvehicle;
sleep 15;
g1f3 = [_position findEmptyPosition [10,250], random 360, "O_Truck_03_covered_F", g1] call bis_fnc_spawnvehicle;
sleep 15;
g1f2 = [_position findEmptyPosition [10,250], random 360, "O_MRAP_02_gmg_F", g1] call bis_fnc_spawnvehicle;
sleep 15;
g1f3 = [_position findEmptyPosition [10,250], random 360, "O_MRAP_02_gmg_F", g1] call bis_fnc_spawnvehicle;

//Verhalten der KI, KI ist trotzdem daehhhhhmlich ;)
g1 setBehaviour "AWARE";
g1 setCombatMode "YELLOW";
