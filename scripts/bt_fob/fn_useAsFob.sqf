private ["_veh"];

_veh = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _veh) exitWith {["You have to specify a unit."] call BIS_fnc_error;};
if (_veh getVariable ["BT_fob_isFob", false]) exitWith {};
_veh setVariable ["BT_fob_addArsenal", [_this,1,false,[false]] call BIS_fnc_param, true];
_veh setVariable ["BT_fob_customFlag", [_this,2,"",[""]] call BIS_fnc_param, true];
_veh setVariable ["BT_fob_crates", [_this,3,[],[[]]] call BIS_fnc_param], true;
_veh setVariable ["BT_fob_createMarker", [_this,4,true,[true]] call BIS_fnc_param, true];
_veh setVariable ["BT_fob_createRespawn", [_this,5,false,[false]] call BIS_fnc_param, true];

_veh setVariable ["BT_fob_isFob", true, true];
_veh setVariable ["BT_fob_exists", false, true];
_veh setVariable ["BT_fob_working", false, true];
_veh setVariable ["BT_fob_objects", [], true];
_veh setVariable ["BT_fob_markerName", "", true];
_veh setVariable ["BT_fob_respawnPosition", [], true];
_veh setVariable ["BT_fob_hitEventHandler", -1, true];
_veh setVariable ["BT_fob_killedEventHandler", -1, true];
_veh setVariable ["BT_fob_side", (side _veh), true];

if (_veh getVariable ["BT_fob_addArsenal", false]) then {
	["AmmoboxInit",[_veh,true,{(_target getVariable ["BT_fob_exists", false]) AND !(_target getVariable ["BT_fob_working", false]) AND (alive _target)}]] call BIS_fnc_arsenal;
};

[_veh, "BT_fnc_addFobAction", true, true] call BIS_fnc_MP;
