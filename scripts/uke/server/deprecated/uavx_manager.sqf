waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };

_spawnType = _this select 0;
_spawnLoc = _this select 1;
_spawnName = _this select 2;

[] call compileFinal preprocessFileLineNumbers "scripts\uke\server\uavarmamentmanager.sqf";
_id1 = objNull;
_id2 = objNull;
_id3 = objNull;

FNC_ACTIVATEUCAV = {
	_vehicle = _this select 0;

	_id1 = _vehicle addAction ["Load Mixed Armament",FNC_RemoteMixedUCAV,nil,1.5,false,true,"","",4];
	_id2 = _vehicle addAction ["Load GBU Armament",FNC_RemoteGBUUCAV,nil,1.5,false,true,"","",4];
	_id3 = _vehicle addAction ["Load ATGM Armament",FNC_RemoteATGMUCAV,nil,1.5,false,true,"","",4];

	_vehicle setVariable ["_id1",["321",_id1],false];
	_vehicle setVariable ["_id2",["321",_id2],false];
	_vehicle setVariable ["_id3",["321",_id3],false];

};
publicVariable "FNC_ACTIVATEUCAV";
FNC_REMOTE_ACTIVATE_UCAV = {
	_vehicle = _this select 0;
	[_vehicle] remoteExecCall ["FNC_ACTIVATEUCAV",0,"uavon"];
};	

FNC_REMOTE_DEACTIVATE_UCAV = {
	_vehicle = _this select 0;
	[_vehicle] remoteExecCall ["FNC_DEACTIVATEUCAV",0,"uavoff"];
};

FNC_DEACTIVATEUCAV = {
	_vehicle = _this select 0;
	_id1 = _vehicle getVariable ["_id1",["NOT SET",_var]] select 1;
	_id2 = _vehicle getVariable ["_id2",["NOT SET",_var]] select 1;
	_id3 = _vehicle getVariable ["_id3",["NOT SET",_var]] select 1;
	_vehicle removeAction _id1;
	_vehicle removeAction _id2;
	_vehicle removeAction _id3;
	
};
publicVariable "FNC_DEACTIVATEUCAV";
	firstloop = true;
	_spawnName = objNull;
	_saveduav = objNull;

	while { true } do {

		{
			if ( typeof _x == _spawnType && _x == _spawnName ) then {
				_saveduav = _x;
			};
		} foreach vehicles;

		if ( firstloop && !isNull _saveduav ) then {
			_spawnName = _saveduav;
		} else {
			_spawnName = _spawnType createVehicle (getposATL _spawnLoc);
			_spawnName enableSimulationGlobal false;
			_spawnName allowdamage false;
			_spawnName setPosATL (getposATL _spawnLoc);
			_spawnName setDir (getDir _spawnLoc);
			createVehicleCrew (_spawnName);

			

_trigger = createTrigger["EmptyDetector",_spawnName,true];
_trig = _trigger attachTo [_spawnName,[0,0,0]];
_trigger setTriggerArea[20,20,0,false,20];
uavx2 = _spawnName;
_trigger setTriggerActivation ["ANY","PRESENT",true];
_trigger setTriggerStatements["{_x isKindOf 'B_Slingload_01_Ammo_F'} count thisList > 0","[uavx2] call FNC_REMOTE_ACTIVATE_UCAV","[uavx2] call FNC_REMOTE_DEACTIVATE_UCAV"];

		};

		firstloop = false;

		
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