waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };
[] call compileFinal preprocessFileLineNumbers "scripts\uke\planearmamentmanager.sqf";

	firstloop = true;
	plane = objNull;
	_savedplane = objNull;

	while { true } do {

		{
			if ( typeof _x == plane_typename && _x !=plane2 ) then {
				_savedplane = _x;
			};
		} foreach vehicles;

		if ( firstloop && !isNull _savedplane ) then {
			plane = _savedplane;
		} else {
			plane = plane_typename createVehicle (getposATL planespawn_0);
			//0 = [plane] execVM "scripts\uke\planearmamentmanager.sqf";
			plane enableSimulationGlobal false;
			plane allowdamage false;
			plane setPosATL (getposATL planespawn_0);
			plane setDir (getDir planespawn_0);

			//'{_x isKindOf "B_Slingload_01_Ammo_F"} count thisList > 0'
_id1 = objNull;
_id2 = objNull;
_id3 = objNull;
_id4 = objNull;
_trigger = createTrigger["EmptyDetector",plane,true];
_trig = _trigger attachTo [plane,[0,0,0]];
_trigger setTriggerArea[20,20,0,false,20];
_trigger setTriggerActivation ["ANY","PRESENT",true];
//_trigger setTriggerStatements["ammocrate in thisList","_id1 = _vehicle addAction [""Load Cluster Armament"",FNC_RemoteClusters,nil,1.5,false,true,"""",""true"",4],_id2 = _vehicle addAction [""Load GBU Armament"",FNC_RemoteGBU,nil,1.5,false,true,"""",""true"",4],_id3 = _vehicle addAction [""Load ATGM Armament"",FNC_RemoteATGM,nil,1.5,false,true,"""",""true"",4],_id4 = _vehicle addAction [""Load Interceptor Armament"",FNC_RemoteIA,nil,1.5,false,true,"""",""true"",4]","removeAction[_id1], removeAction [_id2], removeAction [_id3], removeaction[_id4],"];
_trigger setTriggerStatements["{_x isKindOf ""B_Slingload_01_Ammo_F""} count thisList > 0","{hint ""triggertest""; planeammo = ""true""; publicVariable ""planeammo"";}","{planeammo = ""false""; publicVariable ""planeammo"";}"];
_id1 = plane addAction ["Load Cluster Armament",FNC_RemoteClusters,nil,1.5,false,true,"","planeammo=true",4];
_id2 = plane addAction ["Load GBU Armament",FNC_RemoteGBU,nil,1.5,false,true,"","planeammo=true",4];
_id3 = plane addAction ["Load ATGM Armament",FNC_RemoteATGM,nil,1.5,false,true,"","planeammo=true",4];
_id4 = plane addAction ["Load Interceptor Armament",FNC_RemoteIA,nil,1.5,false,true,"","planeammo=true",4];
//"[_vehicle] call FNC_RELOAD_ALLOWED"""
		};

		firstloop = false;

	
		publicVariable "plane";
		clearWeaponCargoGlobal plane;
		clearMagazineCargoGlobal plane; 
		clearItemCargoGlobal plane;
		clearBackpackCargoGlobal plane;
		plane setDamage 0;
		sleep 0.5;
		plane enableSimulationGlobal true;
		plane setDamage 0;
		plane setVariable ["ace_medical_medicClass", 1, true];
		sleep 1.5;

		plane setDamage 0;
		plane allowdamage true;

		if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] plane spawned by: %1", debug_source];_text remoteExec ["diag_log",2];};

		if ( alive plane ) then {

			waitUntil {
				sleep 1;
				!alive plane;
			};
			//stats_spartan_respawns = stats_spartan_respawns + 1;
			sleep 15;

		};

		if (plane distance startbase < 500) then {
			deletevehicle plane;
		};
		sleep 0.25;
	
};