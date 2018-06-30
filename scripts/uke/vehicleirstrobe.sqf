// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Vehicle IR script
// Version 6
// Date: 2014.06.06
// Authors: Lala14, Tajin
// Feel free to edit, would appreciate it if you also post your own strobe setups ;)
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

// init line:
// nul = [] execVM "vehicleirstrobe.sqf";
// to disable on specific vehicle place in the init of the vehicle this setVariable ["strobe",true];

/*DEFINABLE*/
Vehicle_IR_Debug = 0; //See which vehicles are moving their strobes and what positions

/*Don't touch unless you know what your doing*/
if (isDedicated) exitWith {};

waitUntil {!isNull player};

LALA_fnc_Vehicle_Ir_Strobe_Add_actions = {
_obj = _this select 0;
	if ((_obj isKindOf "LandVehicle") OR (_obj isKindOf "Ship")) then {
		_obj setVariable ["strobe","none",true];
		_obj addAction ["<t color='#FF0000'>Vehicle IR Strobe On</t>", {(_this select 0) spawn LALA_fnc_CreateIR;},"",-99,false,true,"",'(_target getVariable "strobe") isEqualTo "none" && (driver  _target == _this OR commander  _target == _this OR gunner  _target == _this) && (daytime > 18.7 OR daytime < 5.3)'];
		_obj addAction ["<t color='#FF0000'>Vehicle IR Strobe Off</t>", {(_this select 0) spawn LALA_fnc_DeleteIR;},"",-99,false,true,"",'typeName (_target getVariable "strobe") == "OBJECT" && (driver  _target == _this OR commander  _target == _this OR gunner  _target == _this)'];
	};
	
	if (_obj isKindOf "Air") then {
		_obj setVariable ["strobe","none",true];
		_obj setVariable ["strobe2","none",true];
		_obj addAction ["<t color='#FF0000'>Vehicle IR Strobe On</t>", {(_this select 0) spawn LALA_fnc_CreateIRAir;},"",-99,false,true,"",'(_target getVariable "strobe") isEqualTo "none" && (_target getVariable "strobe2") isEqualTo "none" && (driver  _target == _this OR commander  _target == _this OR gunner  _target == _this OR _target turretUnit [0] ==  _this) && (daytime > 18.7 OR daytime < 5.3)'];
		_obj addAction ["<t color='#FF0000'>Vehicle IR Strobe Off</t>", {(_this select 0) spawn LALA_fnc_DeleteIRAir;},"",-99,false,true,"",'typeName (_target getVariable "strobe") == "OBJECT" && typeName (_target getVariable "strobe2") == "OBJECT" && (driver  _target == _this OR commander  _target == _this OR gunner  _target == _this OR _target turretUnit [0] ==  _this)'];
	};	
};

LALA_fnc_CreateIR = {
	_strobe = "NVG_TargetC" createVehicle getPos (_this); 
	_this setVariable ["strobe",_strobe,true];
	(_this getVariable "strobe") attachTo [_this,[0,0,0]]; 
	
		waitUntil {typeName (_this getVariable "strobe") == "OBJECT"};
	_pos = [0,0,0];
	_muzzle = "";
	
	if ((_this isKindOf "APC_Wheeled_01_base_F") OR (_this isKindOf "B_APC_Wheeled_01_cannon_F")) then { _pos = [0,-2,0.7]; };
	if ((_this isKindOf "APC_Wheeled_02_base_F") OR (_this isKindOf "O_APC_Wheeled_02_rcws_F")) then { _pos = [0.35,-2.8,0.1]; };
	if ((_this isKindOf "MBT_01_base_F") OR (_this isKindOf "B_MBT_01_cannon_F")) then { _pos = [0,-2,0.7]; };
	if ((_this isKindOf "MBT_02_base_F") OR (_this isKindOf "O_MBT_02_cannon_F")) then { _pos = [-0.1,-1.4,0.2]; };
	if ((_this isKindOf "MBT_03_base_F") OR (_this isKindOf "I_MBT_03_cannon_F")) then { _pos = [-0.01,-1.2,0.4]; };
	if (_this isKindOf "B_MBT_01_mlrs_F") then { _pos = [0.5,-1.8,0.4] ; _muzzle = "usti hlavne"; };
	if (_this isKindOf "B_MBT_01_TUSK_F") then { _pos = [0,-2,0.3]; };
	if ((_this isKindOf "B_MBT_01_arty_F") OR (_this isKindOf "O_MBT_02_arty_F")) then { _pos = [0,-3.8,0.2]; };
	if ((_this isKindOf "APC_Tracked_01_base_F") OR (_this isKindOf "B_APC_Tracked_01_rcws_F")) then { _pos = [0,-2,-0.2]; };
	if ((_this isKindOf "APC_Tracked_02_base_F") OR (_this isKindOf "O_APC_Tracked_02_cannon_F")) then { _pos = [0,-1.7,0.5]; };
	if (_this isKindOf "B_APC_Tracked_01_AA_F") then { _pos = [0,-2,0.7]; };
	if (_this isKindOf "O_APC_Tracked_02_AA_F") then { _pos = [0,-3.7,0.5]; };
	if ((_this isKindOf "I_APC_tracked_03_base_F") OR (_this isKindOf "I_APC_tracked_03_cannon_F")) then { _pos = [-0.2,-1,0.4]; };
	if ((_this isKindOf "APC_Wheeled_03_base_F") OR (_this isKindOf "I_APC_Wheeled_03_cannon_F")) then { _pos = [0.5,-1.5,0.7]; };
	if ((_this isKindOf "MRAP_01_base_F") OR (_this isKindOf "B_MRAP_01_F")) then { _pos = [0,-1,0.7]; };
	if ((_this isKindOf "B_MRAP_01_hmg_F") OR (_this isKindOf "B_MRAP_01_gmg_F")) then { _pos = [0,-1,0]; };
	if ((_this isKindOf "MRAP_02_base_F") OR (_this isKindOf "O_MRAP_02_F")) then { _pos = [0,-4,0.5]; };
	if ((_this isKindOf "O_MRAP_02_hmg_F") OR (_this isKindOf "O_MRAP_02_gmg_F")) then { _pos = [0,-4,0.2]; };
	if ((_this isKindOf "MRAP_03_base_F") OR (_this isKindOf "I_MRAP_03_F")) then { _pos = [0,-2.5,0.3]; };
	if ((_this isKindOf "I_MRAP_03_hmg_F") OR (_this isKindOf "I_MRAP_03_gmg_F")) then { _pos = [0,-2.5,-0.5]; };
	if (_this isKindOf "Quadbike_01_base_F") then { _pos = [0.3,0.3,-0.5]; };
	if ((_this isKindOf "Truck_01_base_F") OR (_this isKindOf "B_Truck_01_transport_F") OR (_this isKindOf "B_Truck_01_covered_F") OR (_this isKindOf "B_Truck_01_fuel_F") OR (_this isKindOf "B_Truck_01_repair_F") OR (_this isKindOf "B_Truck_01_medic_F")) then { _pos = [0,2,0.5]; };
	if ((_this isKindOf "Truck_02_base_F") OR (_this isKindOf "I_Truck_02_transport_F") OR (_this isKindOf "I_Truck_02_covered_F") OR (_this isKindOf "I_Truck_02_fuel_F") OR (_this isKindOf "O_Truck_02_repair_F") OR (_this isKindOf "O_Truck_02_medic_F")) then { _pos = [0,2.9,0.5]; };
	if ((_this isKindOf "Truck_02_base_F") OR (_this isKindOf "O_Truck_02_transport_F") OR (_this isKindOf "O_Truck_02_covered_F") OR (_this isKindOf "O_Truck_02_fuel_F") OR (_this isKindOf "O_Truck_02_repair_F") OR (_this isKindOf "O_Truck_02_medic_F")) then { _pos = [0,2.9,0.5]; };
	if ((_this isKindOf "Truck_03_base_F") OR (_this isKindOf "O_Truck_03_transport_F") OR (_this isKindOf "O_Truck_03_covered_F") OR (_this isKindOf "O_Truck_03_device_F") OR (_this isKindOf "O_Truck_03_fuel_F") OR (_this isKindOf "O_Truck_03_repair_F") OR (_this isKindOf "O_Truck_03_medic_F")) then { _pos = [0,3.2,0.9]; };
	
	//Sea vehicles
	
	if ((_this isKindOf "Boat_Armed_01_base_F") OR (_this isKindOf "I_Boat_Armed_01_minigun_F") OR (_this isKindOf "O_Boat_Armed_01_hmg_F") OR (_this isKindOf "B_Boat_Armed_01_minigun_F")) then { _pos = [0,0.2,1.0]; };
	if ((_this isKindOf "Boat_Transport_01_base_F") OR (_this isKindOf "O_Boat_Transport_01_F") OR (_this isKindOf "I_Boat_Transport_01_F") OR (_this isKindOf "B_G_Boat_Transport_01_F") OR (_this isKindOf "B_Boat_Transport_01_F") OR (_this isKindOf "B_Lifeboat") OR (_this isKindOf "B_Lifeboat")) then { _pos = [0,-1.8,0]; };
	if ((_this isKindOf "SDV_01_base_F") OR (_this isKindOf "I_SDV_01_F") OR (_this isKindOf "O_SDV_01_F") OR (_this isKindOf "B_SDV_01_F")) then { _pos = [-0.1,-0.1,-0.3]; };
	
	//Autonomous 
	
	if ((_this isKindOf "UGV_01_base_F") OR (_this isKindOf "I_UGV_01_F") OR (_this isKindOf "O_UGV_01_F") OR (_this isKindOf "B_UGV_01_F")) then { _pos = [0.4,-1,-0.5]; };
	if ((_this isKindOf "B_UGV_01_rcws_F") OR (_this isKindOf "I_UGV_01_rcws_F") OR (_this isKindOf "O_UGV_01_rcws_F")) then { _pos = [0.4,-0.5,0.2]; };
	
	//Mod Land vehicle
	
	if (_this isKindOf "SUD_BRDM2_base") then { _pos = [0,0,0.3]; };
	if (_this isKindOf "SUD_M113_base") then { _pos = [0.45,-0.7,-0.6]; };
	if (_this isKindOf "SUD_BTR60_base") then { _pos = [0,-0.7,0.2]; };
	if ((_this isKindOf "RDS_BMP1_base") OR (_this isKindOf "RDS_BMP1P_base") OR (_this isKindOf "RDS_BMP2_base")) then { _pos = [0,-2,-0.3]; };
	if (_this isKindOf "RDS_BMP2_HQ_base") then { _pos = [0.25,-3.2,-3.3]; };
	if (_this isKindOf "RDS_T34_base") then { _pos = [0,-2.4,-0.9]; };
	if (_this isKindOf "RDS_T55_base") then { _pos = [0,-4.3,-0.7]; };
	if (_this isKindOf "RDS_T72_base") then { _pos = [0,-4,-0.4]; };
	if (_this isKindOf "RDS_ZSU23_base") then { _pos = [0,0,0]; };
	if ((_this isKindOf "UAZ_base") OR (_this isKindOf "SUD_UAZ_BASE")) then { _pos = [0,0,0.5]; };
	if (_this isKindOf "BAF_Jackal2_BASE_D") then { _pos = [0,-1.6,0.5]; };
	if ((_this isKindOf "BAF_Offroad_W") OR (_this isKindOf "BAF_Offroad_D")) then { _pos = [0,0,0.7]; };
	if (_this isKindOf "SUD_truck5t_base") then { _pos = [0,2.5,1.2]; };
	if (_this isKindOf "HMMWV_base") then { _pos = [0,-1.7,-0.6]; };
	if (_this isKindOf "HMMWV_M1035") then { _pos = [0,-1.7,0.6]; };
	if (_this isKindOf "SUD_HMMWV_base") then { _pos = [0,-1.7,0.5]; };
	if (_this isKindOf "SUD_HMMWV_M2") then { _pos = [0,-1.7,-0.5]; };
	if (_this isKindOf "SUD_URAL_base") then { _pos = [0,2,0.9]; };
	if (_this isKindOf "ADF_ASLAV_BASE_F") then { _pos = [-0.01,-1.1,0.5]; };
	if (_this isKindOf "M1A1") then { _pos = [0,0,-0.3]; };
	
	
	if (Vehicle_IR_Debug == 1) then {_this vehicleChat format ["strobe attachto %1",[getText (configFile >> "cfgVehicles" >> typeOf _this >> "displayName"),_pos,_muzzle]];};
	if (Vehicle_IR_Debug == 1) then {
		if (str _pos != "[0,0,0]") then {
		hintSilent format ["%1 has moved the strobe into the defined position",getText (configFile >> "cfgVehicles" >> typeOf _this >> "displayName")];
		} else {
		hintSilent format ["%1 has no _pos defined",typeOf _this];
		};
	};
	(_this getVariable "strobe") attachTo [_this,_pos,_muzzle];
};

LALA_fnc_CreateIRAir = {
	_strobe = "NVG_TargetC" createVehicle getPos _this; 
	_this setVariable ["strobe",_strobe,true]; 
	sleep 0.5; 
	_strobe2 = "NVG_TargetC" createVehicle getPos _this; 
	_this setVariable ["strobe2",_strobe2,true];
	(_this getVariable "strobe") attachTo [_this,[0,0,0]]; 
	(_this getVariable "strobe2") attachTo [_this,[0,0,0]]; 

	waitUntil {typeName (_this getVariable "strobe") == "OBJECT" && typeName (_this getVariable "strobe2") == "OBJECT"};
	
	_pos = [0,0,0];
	_pos2 = [0,0,0];
	_muzzle = "";
	
	if ((_this isKindOf "Plane_Fighter_03_base_F") OR (_this isKindOf "I_Plane_Fighter_03_AA_F") OR (_this isKindOf "I_Plane_Fighter_03_CAS_F")) then { _pos = [0,0,0.3]; _pos2 = [0,0,-1.7] };
	if ((_this isKindOf "B_Plane_CAS_01_F") OR (_this isKindOf "Plane_01_base_F")) then { _pos = [0,2.59,1]; _pos2 = [0,-1.2,-0.8]; };
	if ((_this isKindOf "Heli_Light_01_base_F") OR (_this isKindOf "B_Heli_Light_01_F") OR (_this isKindOf "B_Heli_Light_01_armed_F")) then { _pos = [0,-0.8,1] ; _pos2 = [0,2.2,-0.6]; };
	if ((_this isKindOf "Heli_Attack_01_base_F") OR (_this isKindOf "B_Heli_Attack_01_F")) then { _pos = [0,-1.8,0.5]; _pos2 = [0,3.3,-1.5]; };
	if ((_this isKindOf "Heli_Transport_02_base_F") OR (_this isKindOf "I_Heli_Transport_02_F")) then { _pos = [0,-1.5,0.5]; _pos2 = [0.7,1,-3.0]; };
	if ((_this isKindOf "Heli_Attack_02_base_F") OR (_this isKindOf "O_Heli_Attack_02_black_F") OR (_this isKindOf "O_Heli_Attack_02_F")) then { _pos = [0,-0.5,0.5]; _pos2 = [0,1,-2.3]; };
	if ((_this isKindOf "Heli_Light_02_base_F") OR (_this isKindOf "O_Heli_Light_02_unarmed_F") OR (_this isKindOf "O_Heli_Light_02_F")) then { _pos = [0,0.5,1.1]; _pos2 = [0,4.4,-1.9]; };
	if ((_this isKindOf "O_Plane_CAS_02_F") OR (_this isKindOf "Plane_02_base_F")) then { _pos = [0,1.8,2.8]; _pos2 = [0,1.89,0.9]; };
	if ((_this isKindOf "Heli_Transport_01_base_F") OR (_this isKindOf "B_Heli_Transport_01_camo_F") OR (_this isKindOf "B_Heli_Transport_01_F")) then { _pos = [0,4.5,0.6]; _pos2 = [0.6,2.2,-1.8]; };
	if ((_this isKindOf "I_Heli_light_03_unarmed_base_F") OR (_this isKindOf "I_Heli_light_03_base_F") OR (_this isKindOf "I_Heli_light_03_F") OR (_this isKindOf "I_Heli_light_03_unarmed_F")) then { _pos = [0,1.3,1.3]; _pos2 = [0,2.7,-1.1]; };
	
	//Autonomous 
	
	if ((_this isKindOf "UAV_02_base_F") OR (_this isKindOf "I_UAV_02_F") OR (_this isKindOf "O_UAV_02_F") OR (_this isKindOf "B_UAV_02_F")) then { _pos = [0,0,-0.1]; _pos2 = [0,2.2,-1.0]; };
	
	//MOD VEHICLES
	
	if ((_this isKindOf "IVORY_F15C_2") OR (_this isKindOf "IVORY_F15C_1")) then { _pos = [0,0.5,0.3]; _pos2 = [0,2.2,-1.0]; };
	if ((_this isKindOf "JS_JC_FA18E") OR (_this isKindOf "JS_JC_FA18F")) then { _pos = [0,1,0.8]; _pos2 = [0,-3.7,-1.2]; };
	if (_this isKindOf "JS_JC_SU35") then { _pos = [0,3,0.7]; _pos2 = [0,-9,-1]; };
	if (_this isKindOf "Peral_A10C") then { _pos = [0,1.99,1.6]; _pos2 = [0,-6.3,0]; };
	if (_this isKindOf "STI_A10A") then { _pos = [0,1.99,2.7]; _pos2 = [0,-6.4,0.8]; };
	if ((_this isKindOf "AC130") OR (_this isKindOf "C130J") OR (_this isKindOf "C130J_Cargo")) then { _pos = [0,8,-1]; _pos2 = [0,4.5,-5.2]; };
	if (_this isKindOf "b1b") then { _pos = [0,12.5,3]; _pos2 = [0,-20.5,-0.3]; };
	if (_this isKindOf "kc135r") then { _pos = [0,3.5,4.5]; _pos2 = [0,-13,0.8]; };
	if (_this isKindOf "Galaxy_C5") then { _pos = [0,8.5,5.5]; _pos2 = [0,10,-3.5]; };
	if ((_this isKindOf "kyo_MH47E_base") OR (_this isKindOf "kyo_MH47E_Ramp") OR (_this isKindOf "kyo_MH47E_HC"))then { _pos = [0,6.5,1.5]; _pos2 = [0,-1.5,-2.5]; };
	if (_this isKindOf "UH1H_base") then { _pos = [0,-1.4,0.4]; _pos2 = [0,3,-1.9]; };
	if (_this isKindOf "UH1_base") then { _pos = [0,-3,1]; _pos2 = [0,1.9,-1.6]; };
	if (_this isKindOf "AH1_base") then { _pos = [0,-1.3,1.1]; _pos2 = [0,3,-1.5]; };
	if (_this isKindOf "AH64_base") then { _pos = [0,-0.3,0.7]; _pos2 = [0,3,-1.5]; };
	if (_this isKindOf "UH60_base") then { _pos = [0,-1,0.3]; _pos2 = [0,4,-2.2]; };
	if (_this isKindOf "CH_47F_base") then { _pos = [0,0.5,-0.3]; _pos2 = [0,4,-3.5]; };
	if (_this isKindOf "ADF_S70A_base") then { _pos = [0,4,0.8]; _pos2 = [0,-2,-1.5]; };
	
	if (Vehicle_IR_Debug == 1) then {_this vehicleChat format ["strobe attachto %1",[getText (configFile >> "cfgVehicles" >> typeOf _this >> "displayName"),_pos,_muzzle]];};
	if (Vehicle_IR_Debug == 1) then {_this vehicleChat format ["2nd strobe attachto %1",[getText (configFile >> "cfgVehicles" >> typeOf _this >> "displayName"),_pos2,_muzzle]];};
	if (Vehicle_IR_Debug == 1) then {
		if (str _pos != "[0,0,0]" && str _pos2 != "[0,0,0]") then {
		hintSilent format ["%1 has moved the strobe into the defined position",getText (configFile >> "cfgVehicles" >> typeOf _this >> "displayName")];
		} else {
		hintSilent format ["%1 has no _pos defined",typeOf _this];
		};
	};
	(_this getVariable "strobe") attachTo [_this,_pos,_muzzle];
	(_this getVariable "strobe2") attachTo [_this,_pos2,_muzzle];	
};

LALA_fnc_DeleteIR = {
	deleteVehicle (_this getVariable "strobe"); 
	_this setVariable ["strobe","none",true];
};

LALA_fnc_DeleteIRAir = {
	deleteVehicle (_this getVariable "strobe"); 
	_this setVariable ["strobe","none",true]; 
	deleteVehicle (_this getVariable "strobe2"); 
	_this setVariable ["strobe2","none",true];
};

while {true} do {
	{ if ( isNil {_x getVariable "strobe"} ) then {
		[_x] spawn LALA_fnc_Vehicle_Ir_Strobe_Add_actions;
		};
	}forEach vehicles;
sleep 2;
};