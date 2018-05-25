waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };
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
	firstloop4 = true;
	uav = objNull;
	_saveduav = objNull;

	while { true } do {

		//{
		//	if ( typeof _x == uav_typename && _x !=uav2 ) then {
		//		_saveduav = _x;
		//	};
		//} foreach vehicles;

		if ( firstloop4 && !isNull _saveduav ) then {
			uav = _saveduav;
		} else {
			uav = uav_typename createVehicle (getposATL uavspawn_0);
			uav enableSimulationGlobal false;
			uav allowdamage false;
			uav setPosATL (getposATL uavspawn_0);
			uav setDir (getDir uavspawn_0);
			createVehicleCrew (uav);

			

_trigger = createTrigger["EmptyDetector",uav,true];
_trig = _trigger attachTo [uav,[0,0,0]];
_trigger setTriggerArea[20,20,0,false,20];
_trigger setTriggerActivation ["ANY","PRESENT",true];
_trigger setTriggerStatements["{_x isKindOf 'B_Slingload_01_Ammo_F'} count thisList > 0","[uav] call FNC_REMOTE_ACTIVATE_UCAV","[uav] call FNC_REMOTE_DEACTIVATE_UCAV"];

		};

		firstloop4 = false;

		
		publicVariable "uav";
		clearWeaponCargoGlobal uav;
		clearMagazineCargoGlobal uav; 
		clearItemCargoGlobal uav;
		clearBackpackCargoGlobal uav;
		uav setDamage 0;
		sleep 0.5;
		uav enableSimulationGlobal true;
		uav setDamage 0;
		uav setVariable ["ace_medical_medicClass", 1, true];
		sleep 1.5;

		uav setDamage 0;
		uav allowdamage true;

		//if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] uav spawned by: %1", debug_source];_text remoteExec ["diag_log",2];};

		if ( alive uav ) then {

			waitUntil {
				sleep 1;
				!alive uav;
			};
			sleep 15;

		};

		if (uav distance startbase < 500) then {
			deletevehicle uav;
		};
		sleep 0.25;
	
};