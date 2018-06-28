private ["_classname" , "_object"];
_classname = _this select 0;
_object = _this select 1;

if (isServer) then {
	switch (_classname) do {

	case "B_Truck_01_ammo_F": {_menu = [_object] spawn GOM_fnc_addAircraftLoadoutToObject;};
	case "B_Slingload_01_Ammo_F": {_menu = [_object] spawn GOM_fnc_addAircraftLoadoutToObject;
			_ammo = [_object,900,100000,0,0] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\gom_object_refresh.sqf";};
	
	case "B_Truck_01_fuel_F": {_menu = [_object] spawn GOM_fnc_addAircraftLoadoutToObject;};
	case "B_Slingload_01_Fuel_F": {_menu = [_object] spawn GOM_fnc_addAircraftLoadoutToObject;
			_fuel = [_object,900,0,100000,0] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\gom_object_refresh.sqf";};

	case "B_Truck_01_Repair_F": {_menu = [_object] spawn GOM_fnc_addAircraftLoadoutToObject;};
	case "B_Slingload_01_Repair_F": {_menu = [_object] spawn GOM_fnc_addAircraftLoadoutToObject;
			_repair = [_object,900,0,0,100000] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\gom_object_refresh.sqf";};
	default {};
	
	};
};