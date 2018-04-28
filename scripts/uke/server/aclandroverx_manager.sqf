waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };

_spawnType = _this select 0;
_spawnLoc = _this select 1;
_spawnName = _this select 2;

firstloop3 = true;
_spawnName = objNull;
_savedrover = objNull;

while { true } do {

	{
		if ( typeof _x == rover_typename && _x == _spawnName ) then {
			_savedrover = _x;
		};
	} foreach vehicles;

	if ( firstloop && !isNull _savedrover ) then {
		_spawnName = _savedrover;
	} else {
		_spawnName = _spawnType createVehicle (getposATL _spawnLoc);
		_spawnName enableSimulationGlobal false;
		_spawnName allowdamage false;
		_spawnName setPosATL (getposATL _spawnLoc);
		_spawnName setDir (getDir _spawnLoc);
		_trigger = createTrigger["EmptyDetector",_spawnName,true];
	_trig = _trigger attachTo [_spawnName,[0,0,0]];
	_trigger setTriggerArea[0,0,0,false,20];
	_trigger setTriggerActivation ["ANY","PRESENT",true];
	_trigger setTriggerStatements["underwater _spawnName","_spawnName setDamage 1",""];
	};

	firstloop3 = false;

	//rover AnimateDoor ["Door_rear_source", 1, true];
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

	//if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] rover spawned by: %1", debug_source];_text remoteExec ["diag_log",2];};

	if ( alive _spawnName ) then {
		
		waitUntil {
			sleep 1;
			(!alive _spawnName);
		};
		//stats_spartan_respawns = stats_spartan_respawns + 1;
		sleep 15;

	};

	if (_spawnName distance startbase < 500) then {
		deletevehicle _spawnName;
	};
	sleep 0.25;


};