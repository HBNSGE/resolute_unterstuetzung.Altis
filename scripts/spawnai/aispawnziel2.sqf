//Zielposition ermittlen
_position = getmarkerpos "ziel2";

//Einheiten Spawnen
g2 = [_position, EAST, 6, [], [], [0.4,0.5]] call BIS_fnc_spawnGroup;
g3 = [_position, EAST, 6, [], [], [0.4,0.5]] call BIS_fnc_spawnGroup;
sleep 5;
g2f1 = [_position findEmptyPosition [10,250], random 360, "O_APC_Tracked_02_AA_F", g2] call bis_fnc_spawnvehicle;
sleep 15;
g2f2 = [_position findEmptyPosition [10,250], random 360, "O_MRAP_02_gmg_F", g2] call bis_fnc_spawnvehicle;
sleep 15;
g3f1 = [_position findEmptyPosition [10,250], random 360, "O_MRAP_02_gmg_F", g3] call bis_fnc_spawnvehicle;
sleep 15;
g3f2 = [_position findEmptyPosition [10,250], random 360, "O_G_Offroad_01_armed_F", g3] call bis_fnc_spawnvehicle;
  	

//Verhalten der KI, KI ist trotzdem daehhhhhmlich ;)
g2 setBehaviour "AWARE";
g2 setCombatMode "RED";
g3 setBehaviour "AWARE";
g3 setCombatMode "RED";
