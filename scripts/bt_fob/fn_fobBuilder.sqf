private ["_veh","_object","_var","_dist","_rad","_pos","_construct","_dir","_canCollide","_altBasePos"];

_veh = _this select 0;
_object = _this select 1;
_dist = _this select 2;
_rad = _this select 3;
_dir = [_this,4,0,[0]] call BIS_fnc_param;
_canCollide = [_this,5,false,[false]] call BIS_fnc_param;
_altBasePos = [_this,6,[],[[]]] call BIS_fnc_param;

if (count _altBasePos > 0) then {
	_pos = [_altBasePos,_dist,_rad] call BIS_fnc_relPos;
} else {
	_pos = [_veh,_dist,_rad] call BIS_fnc_relPos;
};

if (_canCollide) then {
	_construct = createVehicle [_object, _pos, [], 0, "CAN_COLLIDE"];
} else {
	_construct = _object createVehicle _pos;
};
_construct setDir _dir;
_construct setPos getPos _construct;
_var = _veh getVariable ["BT_fob_objects",[]];
_var = _var + [_construct];
_veh setVariable ["BT_fob_objects", _var, true];

// _deployMsgString = if (isLocalized "str_bt_fob_deploy_msg") then { localize "str_bt_fob_deploy_msg" } else { "Deployed %1 ..." };
systemChat format [(["str_bt_fob_deploy_msg", "Unloading %1 ..."] call BT_fnc_localize), getText (configFile >> "CfgVehicles" >> typeOf _construct >> "displayName")];
