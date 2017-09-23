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

FNC_LoadMixedBombs = {
	_vehicle = _this select 0;
	_tfuel = fuel _vehicle;
	_vehicle setFuel 0.0;
	sleep 15.0;
 _pylons = ["PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Bomb_GBU12_x2","PylonRack_Bomb_GBU12_x2","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","","","PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_1Rnd_BombCluster_01_F"];
 _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	_vehicle setFuel _tfuel;
};

FNC_LoadDefault = {
	_vehicle = _this select 0;
	_tfuel = fuel _vehicle;
	_vehicle setFuel 0.0;
	sleep 15.0;
 _pylons = ["PylonRack_Missile_AMRAAM_D_x1","PylonRack_Missile_AMRAAM_D_x1","PylonRack_Missile_AGM_02_x2","PylonRack_Missile_AGM_02_x2","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","","","PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"];
 _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	_vehicle setFuel _tfuel;
};

FNC_LoadDefaultCluster = {
	_vehicle = _this select 0;
	_tfuel = fuel _vehicle;
	_vehicle setFuel 0.0;
	sleep 15.0;
 _pylons = ["PylonRack_Missile_AMRAAM_D_x1","PylonRack_Missile_AMRAAM_D_x1","PylonRack_Missile_AGM_02_x2","PylonRack_Missile_AGM_02_x2","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","","","PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_1Rnd_BombCluster_01_F"];
 _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	_vehicle setFuel _tfuel;
};




publicVariable "FNC_LoadIA";
publicVariable "FNC_LoadATGM";
publicVariable "FNC_LoadClusters";
publicVariable "FNC_LoadGBU";
publicVariable "FNC_RemoteIA";
publicVariable "FNC_RemoteATGM";
publicVariable "FNC_RemoteClusters";
publicVariable "FNC_RemoteGBU";
publicVariable "FNC_RemoteDefault";
publicVariable "FNC_LoadDefault";
publicVariable "FNC_RemoteDefaultCluster";
publicVariable "FNC_LoadDefaultCluster";
publicVariable "FNC_LoadMixedBombs";
publicVariable "FNC_RemoteMixedBombs";

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

FNC_RemoteMixedBombs = {
	_vehicle = _this select 0;
	[_vehicle] remoteExec ["FNC_LoadMixedBombs",_vehicle];
};

FNC_RemoteDefault = {
	_vehicle = _this select 0;
	[_vehicle] remoteExec ["FNC_LoadDefault",_vehicle];
};

FNC_RemoteDefaultCluster = {
	_vehicle = _this select 0;
	[_vehicle] remoteExec ["FNC_LoadDefaultCluster",_vehicle];
};

