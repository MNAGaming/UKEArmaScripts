waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };
private ["_spawnType"];
_spawnID = _this select 0;
_spawnLoc = _this select 1;
_spawnName = _this select 2;

switch (_spawnID) do {
	case 1: {_spawnType = "B_Plane_Fighter_01_F";};
	case 2: {_spawnType = "B_Plane_Fighter_01_Stealth_F";};
	case 3: {_spawnType = "B_UAV_05_F";};
	case 4: {_spawnType = "B_Plane_CAS_01_dynamicLoadout_F";};
	case 5: {_spawnType = "B_UAV_02_dynamicLoadout_F";};
	case 6: {_spawnType = "B_T_UAV_03_dynamicLoadout_F";};
	case 7: {_spawnType = "B_Heli_Attack_01_dynamicLoadout_F";};
	case 8: {_spawnType = "B_Heli_Light_01_dynamicLoadout_F";};
	case 9: {_spawnType = "I_Heli_light_03_dynamicLoadout_F";};
	case 10: {_spawnType = "B_Heli_Transport_01_F";};
	default {};
};

	_firstloop = true;
	_spawnName = objNull;
	_saveduav = objNull;

	while { true } do {

		{
			if ( typeof _x == _spawnType && _x == _spawnName ) then {
				_saveduav = _x;
			};
		} foreach vehicles;

		if ( _firstloop && !isNull _saveduav ) then {
			_spawnName = _saveduav;
		} else {
			_spawnName = _spawnType createVehicle (getposATL _spawnLoc);
			_spawnName enableSimulationGlobal false;
			_spawnName allowdamage false;
			_spawnName setPosATL (getposATL _spawnLoc);
			_spawnName setDir (getDir _spawnLoc);
			if (unitIsUAV _spawnName) then {
				createVehicleCrew (_spawnName);
			};

			
		};

		_firstloop = false;

		
		publicVariable "_spawnName";
		clearWeaponCargoGlobal _spawnName;
		clearMagazineCargoGlobal _spawnName; 
		clearItemCargoGlobal _spawnName;
		clearBackpackCargoGlobal _spawnName;
		_spawnName setDamage 0;
		sleep 0.5;
		_spawnName enableSimulationGlobal true;
		_spawnName setDamage 0;
		_spawnName setVariable ["ace_medical_medicClass", 1, true];
		sleep 1.5;

		_spawnName setDamage 0;
		_spawnName allowdamage true;

		//if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] uav spawned by: %1", debug_source];_text remoteExec ["diag_log",2];};

		if ( alive _spawnName ) then {

			waitUntil {
				sleep 1;
				!alive _spawnName;
			};
			sleep 15;

		};

		if (_spawnName distance startbase < 500) then {
			deletevehicle _spawnName;
		};
		sleep 0.25;
	
};