waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };


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
			0 = [plane] execVM "scripts\uke\planearmamentmanager.sqf";
			plane enableSimulationGlobal false;
			plane allowdamage false;
			plane setPosATL (getposATL planespawn_0);
			plane setDir (getDir planespawn_0);
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