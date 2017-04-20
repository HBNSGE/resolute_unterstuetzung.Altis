if (isDedicated) then {

	"BT_FOB_startBuildingFob" addPublicVariableEventHandler {
		private ["_array","_veh"];
		_array = _this select 1;
		_veh = _array select 0;
		_veh lock true;
	};
	
	"BT_FOB_finishedUnbuildingFob" addPublicVariableEventHandler {
		private ["_veh"];
		_veh = _this select 1;
		_veh lock false;
	};

} else {

	[] spawn {

		waitUntil {!isNull player};
		waitUntil {player == player};
		
		// data array -> 0: FOB vehicle, 1: building unit
		"BT_FOB_startBuildingFob" addPublicVariableEventHandler {
			private ["_array","_veh","_unit","_nearestName"];
			_array = _this select 1;
			_veh = _array select 0;
			_unit = _array select 1;
			_veh lock true;
			_nearestName = _veh call BT_fnc_getNearestName;
			[side _unit,"HQ"] sideChat (format [(["str_bt_fob_start_building","%1 starts to build up a Forward Operating Base near %2."] call BT_fnc_localize), name _unit, _nearestName]);
		};
		
		// data -> fob vehicle
		"BT_FOB_finishedBuildingFob" addPublicVariableEventHandler {
			private ["_veh","_nearestName","_side"];
			_veh = _this select 1;
			_nearestName = _veh call BT_fnc_getNearestName;
			_side = _veh getVariable ["BT_fob_side", side _veh];
			[_side,"HQ"] sideChat (format [(["str_bt_fob_finished_building","A Forward Operating Base has been built up near %1."] call BT_fnc_localize), _nearestName]);
		};
		
		// data array -> = 0: fob vehicle, 1: unbuilding unit
		"BT_FOB_startUnbuildingFob" addPublicVariableEventHandler {
			private ["_array","_veh","_unit","_nearestName","_side"];
			_array = _this select 1;
			_veh = _array select 0;
			_unit = _array select 1;
			_nearestName = _veh call BT_fnc_getNearestName;
			_side = _veh getVariable ["BT_fob_side", side _veh];
			[_side,"HQ"] sideChat (format [(["str_bt_fob_start_unbuilding","%1 starts to dismount the Forward Operating Base near %2."] call BT_fnc_localize), name _unit, _nearestName]);
		};
		
		// data -> fob vehicle
		"BT_FOB_finishedUnbuildingFob" addPublicVariableEventHandler {
			private ["_veh","_nearestName","_side"];
			_veh = _this select 1;
			_nearestName = _veh call BT_fnc_getNearestName;
			_side = _veh getVariable ["BT_fob_side", side _veh];
			_veh lock false;
			[_side,"HQ"] sideChat (format [(["str_bt_fob_finished_unbuilding","Your FOB near %1 has been dismounted."] call BT_fnc_localize),_nearestName]);
		};

	};
};