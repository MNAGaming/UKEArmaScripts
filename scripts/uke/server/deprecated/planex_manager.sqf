waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };

_spawnType = _this select 0;
_spawnLoc = _this select 1;
_spawnInstance = _this select 2;
_spawnName = _this select 3;
_spawnOBJ = ObjNull;

	_firstloop = true;
	_spawnInstance = objNull;
	_savedplane = objNull;

	while { true } do {

		{
			/* if ( typeof _x == _spawnType) then {
				_planename = _x getVariable "_UKEINSNAME";
				if (_planename == _spawnName ) then {
				_savedplane = _x;
				};
			}; */
				if ( !isNull _spawnInstance ) then {
					if ( typeof _x == plane_typename && _x == _spawnInstance ) then {
					_savedplane = _x;
				}
			};
		} foreach vehicles;

		if ( _firstloop && !isNull _savedplane ) then {
			_spawnInstance = _savedplane;
		} else {
			_spawnInstance = _spawnType createVehicle (getposATL _spawnLoc);
			_spawnInstance setVariable ["_UKEINSNAME",_spawnName,true];
			_spawnInstance enableSimulationGlobal false;
			_spawnInstance allowdamage false;
			_spawnInstance setPosATL (getposATL _spawnLoc);
			_spawnInstance setDir (getDir _spawnLoc);

		};

		_firstloop = false;
		_spawnOBJ = _spawnName;
		missionNamespace setVariable [format["%1",_spawnOBJ], _spawnInstance];
		//missionNamespace setVariable [_spawnName,_spawnInstance];
		//publicVariable "_spawnInstance";
		clearWeaponCargoGlobal _spawnInstance;
		clearMagazineCargoGlobal _spawnInstance; 
		clearItemCargoGlobal _spawnInstance;
		clearBackpackCargoGlobal _spawnInstance;
		_spawnInstance setDamage 0;
		sleep 0.5;
		_spawnInstance enableSimulationGlobal true;
		_spawnInstance setDamage 0;
		_spawnInstance setVariable ["ace_medical_medicClass", 1, true];
		sleep 1.5;

		_spawnInstance setDamage 0;
		_spawnInstance allowdamage true;

		//if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] plane spawned by: %1", debug_source];_text remoteExec ["diag_log",2];};

		if ( alive _spawnInstance ) then {

			waitUntil {
				sleep 1;
				!alive _spawnInstance;
			};
			sleep 15;

		};

		if (_spawnInstance distance startbase < 500) then {
			deletevehicle _spawnInstance;
		};
		sleep 0.25;
	
};