private ['_restartTime', '_msgTimes', '_msgFormat'];
_restartTime = 360;
_msgTimes = [1,5,10,15,30,45,60,90,120];
_msgFormaty = "<t size='0.60' color='#f2cb0b' align='right'>RESTART IN %1 MINS</t>";
_msgFormatg = "<t size='0.60' color='#00ff00' align='right'>RESTART IN %1 MINS</t>";
_msgFormatr = "<t size='0.60' color='#ff0000' align='right'>RESTART IN %1 MINS</t>";
_msgFormatb = "<t size='0.60' color='#0000ff' align='right'>RESTART IN %1 MINS</t>";

// use of this line would let us put the message smack in the middle of the player's screen!
//["<t color='#ff0000' size = '.8'>Warning!<br />Stop doing what you are doing</t>",-1,-1,7,1,0,789] spawn BIS_fnc_dynamicText;

while {true} do {
	uiSleep 30;
	if ((_restartTime - floor(serverTime / 60)) in _msgTimes) then {

		_msgTimes = _msgTimes - [(_restartTime - floor(serverTime / 60))];
		_restartIn = (_restartTime - floor(serverTime / 60));

		for "_i" from 1 to 3 do {
		[
			format[_msgFormaty, _restartIn],
			[safezoneX + safezoneW - 0.6,0.50],
			[safezoneY + safezoneH - 0.6,0.7],
			3,
			0.2
		] spawn BIS_fnc_dynamicText;
		uisleep 2;
		[
			format[_msgFormatg, _restartIn],
			[safezoneX + safezoneW - 0.6,0.50],
			[safezoneY + safezoneH - 0.6,0.7],
			3,
			0.2
		] spawn BIS_fnc_dynamicText;
		uisleep 2;
		[
			format[_msgFormatr, _restartIn],
			[safezoneX + safezoneW - 0.6,0.50],
			[safezoneY + safezoneH - 0.6,0.7],
			3,
			0.2
		] spawn BIS_fnc_dynamicText;
		uisleep 2;
		[
			format[_msgFormatb, _restartTime - floor(serverTime / 60)],
			[safezoneX + safezoneW - 0.6,0.50],
			[safezoneY + safezoneH - 0.6,0.7],
			3,
			0.2
		] spawn BIS_fnc_dynamicText;
	};
	};
};