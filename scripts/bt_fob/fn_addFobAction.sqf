private ["_actionApplied"];

_actionApplied = _this getVariable ["BT_fob_actionApplied",false];

if (!_actionApplied) then {
	
	if (!isDedicated) then {

	_this addAction [(["str_bt_fob_build_fob","Build FOB"] call BT_fnc_localize),{_this spawn BT_fnc_buildFob},nil,0,false,true,"","!(_target getVariable [""BT_fob_exists"", false]) AND !(_target getVariable [""BT_fob_working"", false]) AND (alive _target) AND (_this == driver _target)"];

	_this addAction [(["str_bt_fob_unbuild_fob","Unbuild FOB"] call BT_fnc_localize),{_this spawn BT_fnc_unbuildFob},nil,0,false,true,"","(_target getVariable [""BT_fob_exists"", false]) AND !(_target getVariable [""BT_fob_working"", false]) AND (alive _target)"];
	
	_this setVariable ["BT_fob_actionApplied",true];
	};
};