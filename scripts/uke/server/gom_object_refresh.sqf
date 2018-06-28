private ["_object" , "_time", "_ammo" , "_fuel" , "_repair"];
_object = _this select 0;
_time = _this select 1;
_ammo = _this select 2;
_fuel = _this select 3;
_repair = _this select 4;

if (isServer) then {
	while { true } do {
	if (_ammo > 0) then {
		[_object,_ammo] call GOM_fnc_setAmmoCargo;
	};

	if (_fuel > 0 ) then {
		[_object,_fuel] call GOM_fnc_setFuelCargo;
	};

	if (_repair > 0) then {
		[_object,_repair] call GOM_fnc_setRepairCargo;
	};

	sleep _time;
	};
};