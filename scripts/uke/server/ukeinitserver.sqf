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

_planeenable = ["UKECarrierPlanes",0] call BIS_fnc_getParamValue;
if (_planeenable >= 1) then {
[plane_typename,planespawn_0,plane,"plane"] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\planex_manager.sqf";};
//[] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\plane1_manager.sqf";


if (_planeenable >= 2) then {
[plane_typename,planespawn_1,plane2,"plane2"] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\planex_manager.sqf";};
//[] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\plane2_manager.sqf";

_uavenable = ["UKECarrierUAVs",0] call BIS_fnc_getParamValue;
if (_uavenable == 1) then {
[uav_typename,uavspawn_0,uav] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\uavx_manager.sqf";
//[] spawn compileFinal preprocessFileLineNumbers "scripts\uke\server\uav_manager.sqf";
};
