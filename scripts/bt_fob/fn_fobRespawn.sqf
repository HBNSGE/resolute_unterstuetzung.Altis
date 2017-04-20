private ["_new","_old","_addArsenal","_customFlag","_crates","_markerText","_createRespawn"];

_new = _this select 0;
_old = _this select 1;

// if (local _old) then {

_addArsenal = _old getVariable ["BT_fob_addArsenal", false];
_customFlag = _old getVariable ["BT_fob_customFlag", ""];
_crates = _old getVariable ["BT_fob_crates", []];
_markerText = _old getVariable ["BT_fob_markerText", ""];
_createRespawn = _old getVariable ["BT_fob_createRespawn", false];

[_new,_addArsenal,_customFlag,_crates,_markerText,_createRespawn] call BT_fnc_useAsFob;

// };