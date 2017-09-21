waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };
[] call compileFinal preprocessFileLineNumbers "scripts\uke\planearmamentmanager.sqf";
_id1 = objNull;_id2 = objNull;
_id3 = objNull;
_id4 = objNull; 
FNC_ACTIVATE = {
	params["_vehicle"];

	_id1 = plane2 addAction ["Load Cluster Armament",FNC_RemoteClusters,nil,1.5,false,true,"","",4];
	_id2 = plane2 addAction ["Load GBU Armament",FNC_RemoteGBU,nil,1.5,false,true,"","",4];
	_id3 = plane2 addAction ["Load ATGM Armament",FNC_RemoteATGM,nil,1.5,false,true,"","",4];
    _id4 = _vehicle addAction ["Load Interceptor Armament",FNC_RemoteIA,nil,1.5,false,true,"","",4];
};
publicVariable "FNC_ACTIVATE";
FNC_REMOTE_ACTIVATE = {
	_vehicle = _this select 0;
	[_vehicle] remoteExecCall ["FNC_ACTIVATE",0,"plane2on"];
	

FNC_REMOTE_DEACTIVATE = {
	_vehicle = _this select 0;
	[_vehicle] remoteExecCall ["FNC_DEACTIVATE",0,"plane2off"];
};

FNC_DEACTIVATE = {
	params[_vehicle];
	_vehicle removeAction _id1;
	_vehicle removeAction _id2;
	_vehicle removeAction _id3;
	_vehicle removeAction _id4;
	
};
publicVariable "FNC_DEACTIVATE";
	firstloop2 = true;
	plane2 = objNull;
	_savedplane = objNull;

	while { true } do {

		{
			if ( typeof _x == plane_typename && _x !=plane ) then {
				_savedplane = _x;
			};
		} foreach vehicles;

		if ( firstloop && !isNull _savedplane ) then {
			plane2 = _savedplane;
		} else {
			plane2 = plane_typename createVehicle (getposATL planespawn_1);
			plane2 enableSimulationGlobal false;
			plane2 allowdamage false;
			plane2 setPosATL (getposATL planespawn_1);
			plane2 setDir (getDir planespawn_1);

			

_trigger = createTrigger["EmptyDetector",plane2,true];
_trig = _trigger attachTo [plane2,[0,0,0]];
_trigger setTriggerArea[20,20,0,false,20];
_trigger setTriggerActivation ["ANY","PRESENT",true];
_trigger setTriggerStatements["ammocrate in thisList","[plane2] call FNC_REMOTE_ACTIVATE","[plane2] call FNC_REMOTE_DEACTIVATE"];

		};

		firstloop2 = false;

		planeammo2 = "false";
		publicVariable "planeammo2";
		publicVariable "plane2";
		clearWeaponCargoGlobal plane2;
		clearMagazineCargoGlobal plane2; 
		clearItemCargoGlobal plane2;
		clearBackpackCargoGlobal plane2;
		plane2 setDamage 0;
		sleep 0.5;
		plane2 enableSimulationGlobal true;
		plane2 setDamage 0;
		plane2 setVariable ["ace_medical_medicClass", 1, true];
		sleep 1.5;

		plane2 setDamage 0;
		plane2 allowdamage true;

		if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] plane2 spawned by: %1", debug_source];_text remoteExec ["diag_log",2];};

		if ( alive plane2 ) then {

			waitUntil {
				sleep 1;
				!alive plane2;
			};
			sleep 15;

		};

		if (plane2 distance startbase < 500) then {
			deletevehicle plane2;
		};
		sleep 0.25;
	
};