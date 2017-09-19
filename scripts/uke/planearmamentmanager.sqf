_vehicle = _this select 0;

FNC_LoadClusters = {
	_vehicle = _this select 0;
	_tfuel = fuel _vehicle;
	_vehicle setFuel 0.0;
	sleep 15.0;
 _pylons = ["PylonMissile_1Rnd_BombCluster_03_F","PylonMissile_1Rnd_BombCluster_03_F","PylonRack_2Rnd_BombCluster_03_F","PylonRack_2Rnd_BombCluster_03_F","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","","","PylonMissile_1Rnd_BombCluster_03_F","PylonMissile_1Rnd_BombCluster_03_F"];
 _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	_vehicle setFuel _tfuel;
};

FNC_LoadGBU = {
	_vehicle = _this select 0;
	_tfuel = fuel _vehicle;
	_vehicle setFuel 0.0;
	sleep 15.0;
 _pylons = ["PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1","PylonRack_Bomb_GBU12_x2","PylonRack_Bomb_GBU12_x2","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","","","PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"];
 _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	_vehicle setFuel _tfuel;
};

FNC_LoadATGM = {
	_vehicle = _this select 0;
	_tfuel = fuel _vehicle;
	_vehicle setFuel 0.0;
	sleep 15.0;
 _pylons = ["PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x2","PylonRack_Missile_AGM_02_x2","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","","","",""];
 _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	_vehicle setFuel _tfuel;
};

FNC_LoadIA = {
	_vehicle = _this select 0;
	_tfuel = fuel _vehicle;
	_vehicle setFuel 0.0;
	sleep 15.0;
 _pylons = ["PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1"];
 _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	_vehicle setFuel _tfuel;
};

FNC_RemoteIA = {
	_vehicle = _this select 0;
	[_vehicle] remoteExec ["FNC_LoadIA",_vehicle];
};

FNC_RemoteClusters = {
	_vehicle = _this select 0;
	[_vehicle] remoteExec ["FNC_LoadClusters",_vehicle];
};

FNC_RemoteGBU = {
	_vehicle = _this select 0;
	[_vehicle] remoteExec ["FNC_LoadGBU",_vehicle];
};

FNC_RemoteATGM = {
	_vehicle = _this select 0;
	[_vehicle] remoteExec ["FNC_LoadATGM",_vehicle];
};

FNC_RELOAD_ALLOWED = {
	params ["_target","_this"];
	_res = "false";
	_vehicle = _this select 0;
	_pos = getPos _vehicle;
	_obj = nearestObject [_pos,"B_Slingload_01_Ammo_F"];
	if(_obj == objNull) exitWith {};
	
		_opos = getPos _obj;
		_m = _pos distance2D _opos;
	// if (_m < 21) then 
	// {
	// 	"true"
	// } 
	// else 
	// {
	// 	"false"
	// };
		_res = [false,true] select (_m < 21);
		_res
	
};

_id = _vehicle addAction ["Load Cluster Armament",FNC_RemoteClusters,nil,1.5,false,true,"[_vehicle] call FNC_RELOAD_ALLOWED","true",4];
_id = _vehicle addAction ["Load GBU Armament",FNC_RemoteGBU,nil,1.5,false,true,"","true",4];
_id = _vehicle addAction ["Load ATGM Armament",FNC_RemoteATGM,nil,1.5,false,true,"","true",4];
_id = _vehicle addAction ["Load Interceptor Armament",FNC_RemoteIA,nil,1.5,false,true,"","true",4];
