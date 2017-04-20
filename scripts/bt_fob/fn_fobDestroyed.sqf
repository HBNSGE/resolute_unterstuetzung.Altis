private ["_fob","_marker","_respawnPosition","_side"];

_fob = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (isNull _fob) exitWith {["You have to specify a unit."] call BIS_fnc_error;};

_side = _fob getVariable ["BT_fob_side", side _fob];

[_side, "HQ"] sideChat (format ["Your FOB at %1 has been destroyed.", mapGridPosition _fob]);

if (local _fob) then {

	_respawnPosition = _fob getVariable ["BT_fob_respawnPosition", []];
	_marker = _fob getVariable ["BT_fob_markerName", ""];

	if (_marker != "") then {
		deleteMarker _marker;
	};

	if (!(_respawnPosition isEqualTo [])) then {
		_respawnPosition call BIS_fnc_removeRespawnPosition;
	};
	
	_killedEH = _fob getVariable "BT_fob_killedEventHandler";
	_hitEH = _fob getVariable "BT_fob_hitEventHandler";

	if (isMultiplayer) then {
		_veh removeMPEventHandler ["MPKilled",_killedEH];
		_veh removeMPEventHandler ["MPHit",_hitEH];
	} else {
		_veh removeEventHandler ["Killed",_killedEH];
		_veh removeEventHandler ["Hit",_hitEH];
	};

};