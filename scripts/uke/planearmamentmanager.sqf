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
	_vehicle = _target;
	_obj = nearestObject [position _vehicle,"B_Slingload_01_Ammo_F"];
	_res = "false";
	if (isNull _obj ) exitWith {_res};

	_m = (position _vehicle) distance2D (position _obj);
	if (_m < 21) then
	{
		_res = "true";
	} else
	{
		_res = "false";
	};
	_res
};

FNC_RELOAD_ALLOWED2 = {
	if(planeammo=="true") then
	{
		_res = "true";
	} else 
	{
		_res="false";
	};
	_res
};

// //'{_x isKindOf "B_Slingload_01_Ammo_F"} count thisList > 0'
// _id1 = objNull;
// _id2 = objNull;
// _id3 = objNull;
// _id4 = objNull;
// _trigger = createTrigger["EmptyDetector",_vehicle,true];
// _trig = _trigger attachTo [_vehicle,[0,0,0]];
// _trigger setTriggerArea[20,20,0,false,20];
// _trigger setTriggerActivation ["ANY","PRESENT",true];
// //_trigger setTriggerStatements["ammocrate in thisList","_id1 = _vehicle addAction [""Load Cluster Armament"",FNC_RemoteClusters,nil,1.5,false,true,"""",""true"",4],_id2 = _vehicle addAction [""Load GBU Armament"",FNC_RemoteGBU,nil,1.5,false,true,"""",""true"",4],_id3 = _vehicle addAction [""Load ATGM Armament"",FNC_RemoteATGM,nil,1.5,false,true,"""",""true"",4],_id4 = _vehicle addAction [""Load Interceptor Armament"",FNC_RemoteIA,nil,1.5,false,true,"""",""true"",4]","removeAction[_id1], removeAction [_id2], removeAction [_id3], removeaction[_id4],"];
// _trigger setTriggerStatements["ammocrate in thisList","{_id1 = _vehicle addAction [""Load Cluster Armament"",FNC_RemoteClusters,nil,1.5,false,true,"""",""true"",4]}",""];
// //_id1 = _vehicle addAction ["Load Cluster Armament",FNC_RemoteClusters,nil,1.5,false,true,"","true",4];
// //_id2 = _vehicle addAction ["Load GBU Armament",FNC_RemoteGBU,nil,1.5,false,true,"","true",4];
// //_id3 = _vehicle addAction ["Load ATGM Armament",FNC_RemoteATGM,nil,1.5,false,true,"","true",4];
// //_id4 = _vehicle addAction ["Load Interceptor Armament",FNC_RemoteIA,nil,1.5,false,true,"","true",4];
// //"[_vehicle] call FNC_RELOAD_ALLOWED"""