#define RADIUS 14
#define ENINGE_OFF_MSG "Engine has to be off and vehicle has to be stopped to build up FOB."

private ["_veh","_vel","_customFlag","_unit","_boxes","_boxesBasePos","_markerStr","_markerColor","_respawnPos","_side","_hitEH","_killedEH","_nearestName","_faction","_vehClass","_vehFuel"];

_veh = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (count crew _veh > 1) exitWith {hint (["str_bt_fob_units_have_to_disembark", "All units except the driver must have left the vehicle in order to build the FOB."] call BT_fnc_localize);};

if (isEngineOn _veh) exitWith {hint (["str_bt_fob_engine_has_to_be_off", "The engine must be switched off and the vehicle has to be stopped to build up the FOB."] call BT_fnc_localize);;};

_vel = velocity _veh;
if ((abs (_vel select 0) + abs (_vel select 1) + abs (_vel select 2)) > 1) exitWith {hint (["str_bt_fob_engine_has_to_be_off", "The engine must be switched off and the vehicle has to be stopped to build up the FOB."] call BT_fnc_localize);};

_unit = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_side = side _unit;
_faction = faction _unit;
_vehClass = typeOf _veh;

_veh setVariable ["BT_fob_side", _side, true];

_veh lock true;
// _vehFuel = fuel _veh;
// _veh setFuel 0;
_veh enableSimulation false;
_nearestName = _veh call BT_fnc_getNearestName;

BT_FOB_startBuildingFob = [_veh, _unit]; publicVariable "BT_FOB_startBuildingFob";

systemChat format [(["str_bt_fob_you_start_building","You have started the construction of a FOB near %1."] call BT_fnc_localize), _nearestName];

_veh setVariable ["BT_fob_working", true, true];

_customFlag = _veh getVariable ["BT_fob_customFlag", ""];

_boxes = _veh getVariable ["BT_fob_crates",[]];

if (_boxes isEqualTo []) then {

	_boxes = switch (_faction) do {
		case "BLU_G_F";
		case "BLU_F": { ["Box_NATO_Ammo_F","Box_NATO_AmmoOrd_F","Box_NATO_Grenades_F","Box_NATO_Support_F"] };
		case "OPF_G_F";
		case "OPF_F": { ["Box_East_Ammo_F","Box_East_AmmoOrd_F","Box_East_Grenades_F","Box_East_Support_F"] };
		case "IND_G_F";
		case "IND_F": { ["Box_IND_Ammo_F","Box_IND_AmmoOrd_F","Box_IND_Grenades_F","Box_IND_Support_F"] };
		case "CIV_F";
		default { [] };
	};
};


if (!(_boxes isEqualTo [])) then {
	_boxesBasePos = [_veh,4,((getDir _veh) + 90)] call BIS_fnc_relPos;

	{
		sleep 2;
		[_veh,_x,(1.5 * _forEachIndex),((getDir _veh) + 180),0,true,_boxesBasePos] spawn BT_fnc_fobBuilder;
		
	} forEach _boxes;
};


if (!(_vehClass in ["I_Heli_Transport_02_F","B_Heli_Transport_03_F"])) then {
sleep 2;
[_veh,"CamoNet_BLUFOR_big_F",0,0,0,true] spawn BT_fnc_fobBuilder;
};
sleep 2;
[_veh,"Land_BagBunker_Small_F",RADIUS,0,180] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagFence_Long_F",RADIUS,30,30] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagFence_Long_F",RADIUS,45,45] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagFence_Long_F",RADIUS,60,60] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagBunker_Small_F",RADIUS,90,-90] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagFence_Long_F",RADIUS,120,120] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagFence_Long_F",RADIUS,135,135] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagFence_Long_F",RADIUS,150,150] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagBunker_Small_F",RADIUS,180,0] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagFence_Long_F",RADIUS,210,210] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagFence_Long_F",RADIUS,225,225] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagFence_Long_F",RADIUS,240,240] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagBunker_Small_F",RADIUS,270,90] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagFence_Long_F",RADIUS,300,300] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagFence_Long_F",RADIUS,315,315] spawn BT_fnc_fobBuilder;
sleep 2;
[_veh,"Land_BagFence_Long_F",RADIUS,330,330] spawn BT_fnc_fobBuilder;


sleep 2;

if (_customFlag != "") then {

	private ["_flag","_var"];
	
	_flag = "FlagPole_F" createVehicle ([_veh,4,100] call BIS_fnc_relPos);

	_flag setFlagTexture _customFlag;

	_var = _veh getVariable ["BT_fob_objects",[]];
	_var = _var + [_flag];
	_veh setVariable ["BT_fob_objects", _var, true];

} else {

	_customFlag = switch (_faction) do {
		case "BLU_F": { "Flag_NATO_F" };
		case "OPF_F": { "Flag_CSAT_F" };
		case "IND_F": { "Flag_AAF_F" };
		case "BLU_G_F";
		case "OPF_G_F";
		case "IND_G_F": { "Flag_FIA_F" };
		case "CIV_F": { "Flag_White_F" };
		default { "Flag_BI_F" };
	};
	
	[_veh,_customFlag,4,100] spawn BT_fnc_fobBuilder;
};


if (_veh getVariable ["BT_fob_createMarker",true]) then {
	private ["_markerSalt"];
	
	_markerSalt = (random(100) + random(100));
	
	_markerColor = switch (_side) do {
		case blufor;
		case west: { "ColorBLUFOR" };
		case opfor;
		case east: { "ColorOPFOR" };
		case independent;
		case resistance: { "ColorIndependent" };
		default { "Default" };
	};
	
	_markerStr = createMarker [format ["markerFOB-%1",_markerSalt],getPos _veh];
	_markerStr setMarkerText format ["FOB near %1", _nearestName];	
	_markerStr setMarkerShape "ICON";
	_markerStr setMarkerType "u_installation";
	_markerStr setMarkerColor _markerColor;
	
	_veh setVariable ["BT_fob_markerName", _markerStr, true];
	
	if (_veh getVariable ["BT_fob_createRespawn",false]) then {
		_respawnPos = [side _unit, _markerStr] call BIS_fnc_addRespawnPosition;
		_veh setVariable ["BT_fob_respawnPosition", _respawnPos, true];
	};
};

_veh setVariable ["BT_fob_working", false, true];
_veh setVariable ["BT_fob_exists", true, true];

sleep 1;

BT_FOB_finishedBuildingFob = _veh; publicVariable "BT_FOB_finishedBuildingFob";

systemChat format [(["str_bt_fob_you_finished_building","You have completed the construction of a FOB near %1."] call BT_fnc_localize), _nearestName];

moveOut _unit;
// _veh setFuel _vehFuel;
_veh enableSimulation true;

if (isMultiplayer) then {
	_killedEH = _veh addMPEventHandler ["MPKilled", {_this call BT_fnc_fobDestroyed}];
	_hitEH = _veh addMPEventHandler ["MPHit", {_this call BT_fnc_fobAttacked}];
} else {
	_killedEH = _veh addEventHandler ["Killed", {_this call BT_fnc_fobDestroyed}];
	_hitEH = _veh addEventHandler ["Hit", {_this call BT_fnc_fobAttacked}];	
};

_veh setVariable ["BT_fob_killedEventHandler", _killedEH, true];
_veh setVariable ["BT_fob_hitEventHandler", _hitEH, true];