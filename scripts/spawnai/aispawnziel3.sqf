//Zielposition ermittlen
_position = getmarkerpos "ziel3";
_positiont1 = getmarkerpos "tank1";
_positiont2 = getmarkerpos "tank2";

//Einheiten Spawnen
g4 = [_position, EAST, 8, [], [], [0.4,0.5]] call BIS_fnc_spawnGroup;
g5 = [_position, EAST, 10, [], [], [0.4,0.5]] call BIS_fnc_spawnGroup;
sleep 5;
g4f1 = [_positiont1 findEmptyPosition [10,250], random 360, "O_MBT_02_cannon_F", g4] call bis_fnc_spawnvehicle;
sleep 15;
g5f1 = [_positiont2 findEmptyPosition [10,250], random 360, "O_MBT_02_cannon_F", g5] call bis_fnc_spawnvehicle;
sleep 15;
g4f2 = [_position findEmptyPosition [10,250], random 360, "O_MRAP_02_gmg_F", g4] call bis_fnc_spawnvehicle;
sleep 15;
g5f2 = [_position findEmptyPosition [10,250], random 360, "O_MRAP_02_gmg_F", g5] call bis_fnc_spawnvehicle;
sleep 15;
g4f3 = [_position findEmptyPosition [10,250], random 360, "O_G_Offroad_01_armed_F", g4] call bis_fnc_spawnvehicle;
sleep 15;
g5f3 = [_position findEmptyPosition [10,250], random 360, "O_G_Offroad_01_armed_F", g5] call bis_fnc_spawnvehicle;

//Verhalten der KI, KI ist trotzdem daehhhhhmlich ;)
g4 setBehaviour "AWARE";
g4 setCombatMode "RED";
g5 setBehaviour "AWARE";
g5 setCombatMode "RED";
