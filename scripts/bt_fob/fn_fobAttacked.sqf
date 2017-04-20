private ["_fob","_side"];

_fob = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (isNull _fob) exitWith {["You have to specify a unit."] call BIS_fnc_error;};

_side = _fob getVariable ["BT_fob_side", side _fob];

// [[[_side, "HQ"], format ["Your FOB at %1 is under attack.", mapGridPosition _fob]],"sideChat",_side] call BIS_fnc_MP;

[_side, "HQ"] sideChat (format ["Your FOB at %1 is under attack.", mapGridPosition _fob]);