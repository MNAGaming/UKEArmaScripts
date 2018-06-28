_vehicle = _this select 0;



FNC_LoadMixedUCAV = {
	_vehicle = _this select 0;
	_tfuel = fuel _vehicle;
	_vehicle setFuel 0.0;
	sleep 15.0;
 _pylons = ["PylonMissile_Missile_AGM_02_x2","PylonMissile_Bomb_GBU12_x1"];
 _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	_vehicle setFuel _tfuel;
};

FNC_LoadGBUUCAV = {
	_vehicle = _this select 0;
	_tfuel = fuel _vehicle;
	_vehicle setFuel 0.0;
	sleep 15.0;
 _pylons = ["PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"];
 _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	_vehicle setFuel _tfuel;
};

FNC_LoadATGMUCAV = {
	_vehicle = _this select 0;
	_tfuel = fuel _vehicle;
	_vehicle setFuel 0.0;
	sleep 15.0;
 _pylons = ["PylonMissile_Missile_AGM_02_x2","PylonMissile_Missile_AGM_02_x2"];
 _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	_vehicle setFuel _tfuel;
};






publicVariable "FNC_LoadMixedUCAV";
publicVariable "FNC_LoadATGMUCAV";
publicVariable "FNC_LoadGBUUCAV";
publicVariable "FNC_RemoteMixedUCAV";
publicVariable "FNC_RemoteATGMUCAV";
publicVariable "FNC_RemoteGBUUCAV";


FNC_RemoteMixedUCAV = {
	_vehicle = _this select 0;
	[_vehicle] remoteExec ["FNC_LoadMixedUCAV",_vehicle];
};

FNC_RemoteGBUUCAV = {
	_vehicle = _this select 0;
	[_vehicle] remoteExec ["FNC_LoadGBUUCAV",_vehicle];
};

FNC_RemoteATGMUCAV = {
	_vehicle = _this select 0;
	[_vehicle] remoteExec ["FNC_LoadATGMUCAV",_vehicle];
};

