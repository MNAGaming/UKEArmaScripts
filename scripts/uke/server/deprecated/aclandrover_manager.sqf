waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };

firstloop3 = true;
rover = objNull;
_savedrover = objNull;

while { true } do {

	{
		if ( typeof _x == rover_typename ) then {
			_savedrover = _x;
		};
	} foreach vehicles;

	if ( firstloop3 && !isNull _savedrover ) then {
		rover = _savedrover;
	} else {
		rover = rover_typename createVehicle (getposATL aclandyspawn_0);
		rover enableSimulationGlobal false;
		rover allowdamage false;
		rover setPosATL (getposATL aclandyspawn_0);
		rover setDir (getDir aclandyspawn_0);
		_trigger = createTrigger["EmptyDetector",rover,true];
	_trig = _trigger attachTo [rover,[0,0,0]];
	_trigger setTriggerArea[0,0,0,false,20];
	_trigger setTriggerActivation ["ANY","PRESENT",true];
	_trigger setTriggerStatements["underwater rover","rover setDamage 1",""];
	};

	firstloop3 = false;

	//rover AnimateDoor ["Door_rear_source", 1, true];
	publicVariable "rover";
	clearWeaponCargoGlobal rover;
	clearMagazineCargoGlobal rover;
	clearItemCargoGlobal rover;
	clearBackpackCargoGlobal rover;
	rover setDamage 0;
	sleep 0.5;
	rover enableSimulationGlobal true;
	rover setDamage 0;
	rover setVariable ["ace_medical_medicClass", 1, true];
	sleep 1.5;

	rover setDamage 0;
	rover allowdamage true;

	//if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] rover spawned by: %1", debug_source];_text remoteExec ["diag_log",2];};

	if ( alive rover ) then {
		
		waitUntil {
			sleep 1;
			(!alive rover);
		};
		//stats_spartan_respawns = stats_spartan_respawns + 1;
		sleep 15;

	};

	if (rover distance startbase < 500) then {
		deletevehicle rover;
	};
	sleep 0.25;

};