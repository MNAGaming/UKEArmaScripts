waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };


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
			0 = [plane2] execVM "scripts\uke\planearmamentmanager.sqf";
			plane2 enableSimulationGlobal false;
			plane2 allowdamage false;
			plane2 setPosATL (getposATL planespawn_1);
			plane2 setDir (getDir planespawn_1);
		};

		firstloop2 = false;

	
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

		if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] plane spawned by: %1", debug_source];_text remoteExec ["diag_log",2];};

		if ( alive plane2 ) then {

			waitUntil {
				sleep 1;
				!alive plane2;
			};
			//stats_spartan_respawns = stats_spartan_respawns + 1;
			sleep 15;

		};

		if (plane2 distance startbase < 500) then {
			deletevehicle plane2;
		};
		sleep 0.25;
	
};