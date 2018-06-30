plane=objNull;
plane2=objNull;
planex=objNull;
uav = objNull;
rover = objNull;

_rovercount = ["UKECarrierRovers",0] call BIS_fnc_getParamValue; 
if(_rovercount >= 1) then {
[rover_typename,aclandyspawn_0,rover] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\aclandroverx_manager.sqf";
//[] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\aclandrover_manager.sqf";
//[plane_typename,planexspawn0,planex] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\planex_manager.sqf";
}
else {};

spawn1 = ["UKECarrierSpawn1",0] call BIS_fnc_getParamValue;
spawn2 = ["UKECarrierSpawn2",0] call BIS_fnc_getParamValue;
spawn3 = ["UKECarrierSpawn3",0] call BIS_fnc_getParamValue;

if (spawn1 > 0) then {
	[spawn1,planespawn_0,plane,"plane"] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\vehicle_respawner.sqf";
};

if (spawn2 > 0) then {
	[spawn2,planespawn_1,plane2,"plane2"] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\vehicle_respawner.sqf";
};
if (spawn3 > 0) then {
	[spawn3,uavspawn_0,uav] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\vehicle_respawner.sqf";
};