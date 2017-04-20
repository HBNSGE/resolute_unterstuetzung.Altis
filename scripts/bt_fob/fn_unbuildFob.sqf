private ["_veh","_objs","_marker","_killedEH","_hitEH","_unit","_vehFuel"];

_veh = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_unit = [_this,1,objNull,[objNull]] call BIS_fnc_param;

// _vehFuel = fuel _veh;
// _veh setFuel 0;

_unit moveInDriver _veh;
_veh enableSimulation false;
_veh setVariable ["BT_fob_working", true, true];

_objs = _veh getVariable ["BT_fob_objects", []];
_marker = _veh getVariable ["BT_fob_markerName",""];

_nearestName = _veh call BT_fnc_getNearestName;;

BT_FOB_startUnbuildingFob = [_veh,_unit]; publicVariable "BT_FOB_startUnbuildingFob";
systemChat format [(["str_bt_fob_you_start_unbuilding","You have begun dismantling the FOB near 1%."] call BT_fnc_localize), _nearestName];

if (_veh getVariable ["BT_fob_createRespawn", false]) then {
	(_veh getVariable ["BT_fob_respawnPosition", []]) call BIS_fnc_removeRespawnPosition;
};

if ((count _objs) > 0) then {

	{
		if (!isNull _x) then {
			sleep 2;
			deleteVehicle _x;
			systemChat format [(["str_bt_fob_redeploy_msg", "Loading %1 ..."] call BT_fnc_localize), getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName")];
		};
		
	} forEach _objs;

};


_veh setVariable ["BT_fob_objects", [], true];


if (_marker != "") then {
	deleteMarker _marker;
	_veh setVariable ["BT_fob_markerName", "", true];
};

_killedEH = _veh getVariable "BT_fob_killedEventHandler";
_hitEH = _veh getVariable "BT_fob_hitEventHandler";

if (isMultiplayer) then {
	_veh removeMPEventHandler ["MPKilled",_killedEH];
	_veh removeMPEventHandler ["MPHit",_hitEH];
} else {
	_veh removeEventHandler ["Killed",_killedEH];
	_veh removeEventHandler ["Hit",_hitEH];
};

// _veh setVariable ["BT_fob_killedEventHandler", _killedEH, true];
// _veh setVariable ["BT_fob_hitEventHandler", _hitEH, true];

_veh setVariable ["BT_fob_working", false, true];
_veh setVariable ["BT_fob_exists", false, true];

// [[_veh,false],"lock"] call BIS_fnc_MP;
systemChat format [(["str_bt_fob_you_finished_unbuilding","You have complete the dismantling of the FOB near 1%."] call BT_fnc_localize), _nearestName];
// _veh setFuel _vehFuel;
_veh enableSimulation true;
_veh lock false;

// [[_hq, format ["%1 dismounted the Forward Operating Base near %2.", name _unit, _nearestName]],"sideChat",side _unit] call BIS_fnc_MP;
BT_FOB_finishedUnbuildingFob = _veh; publicVariable "BT_FOB_finishedUnbuildingFob";
