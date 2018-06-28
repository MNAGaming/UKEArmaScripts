waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };

_spawnType = _this select 0;
_spawnLoc = _this select 1;
_spawnName = _this select 2;


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
			createVehicleCrew (_spawnName);

			
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