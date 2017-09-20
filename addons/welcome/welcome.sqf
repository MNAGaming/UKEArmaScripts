//    @file Version: 1.0
//    @file Name: welcome.sqf
//    @file Author: Cael817
//    @file Credits: iCEtIMed, Pain2407
//    @file Info: Shows a informational window when you load into a mission. Based on iCEtIMed's Warning Messages

waitUntil {!isNull (findDisplay 46)};
waitUntil {!dialog};

sleep 6;

//_att = format["Welcome to the [UKE] Mission Server"]; //uncomment this if you want the player name in the headline, and comment out the other one
_att = format["Welcome to [UKE]Server %1", name player]; //uncomment this if you want the player name in the headline, and comment out the other one
//_att = format["Welcome to %1", serverName]; //uncomment this if you want the server name in the headline (needs to be pretty short though) and comment out the other one.

_att hintC [
    parseText "<t shadow='2'size='1' >Rule #1</t><br/><t shadow='2'size='0.75' >All Players MUST be on our Teamspeak Server to gain Permissions,TFAR is optional, use Open Squad channel(non TFAR).</t>",
    parseText "<t shadow='2'size='1' >Rule #2</t><br/><t shadow='2'size='0.75' >Pilots MUST be on Teamspeak to fly, Use Operation Base Helo's First before Building one at FOB.</t>",
    parseText "<t shadow='2'size='1' >Rule #3</t><br/><t shadow='2'size='0.75' >Join Squads, Work as a Team, Attack Objectives together, Lone Wolf Players will be removed.</t>",
    parseText "<t shadow='2'size='1' >Rule #4</t><br/><t shadow='2'size='0.75' >Capture AI Surrendering (Hands on Heads) and take them to FOB for intel.</t>",
    parseText "<t shadow='2'size='1' >Rule #5</t><br/><t shadow='2'size='0.75' >FOBs will require a vehicle logistics module to be placed in order to use in-vehicle logistics menu</t>",
    parseText "<t shadow='2'size='1' >Rule #6</t><br/><t shadow='2'size='0.75' >TFAR Freq. 30 is recommended for main squad activities/comms.</t>",
    parseText "<t shadow='2'size='1' >Rule #7</t><br/><t shadow='2'size='0.75' >TFAR Freq. 45 is recommended for long range activities/comms. (<b>Requires Long Range Radio</b>)</t>",
    parseText "<t shadow='2'size='1' >Info:</t><br/><t shadow='2'size='0.75' >
    TeamSpeak Server: teamspeak3.i3d.net:10213
    <br/>
    Website: https://www.facebook.com/groups/311490989020186/
    <br/>
	TS Viewer: https://www.tsviewer.com/index.php?page=ts_viewer&ID=1029610
    <br/>
	<br/>
    Team Work and Communication is vital to the success of this Mission, Work together to Capture
    <br/>
    the Objectives one at a time, Flying over, or Attacking more than one will trigger more AI
    <br/>
    affecting Server Performance.
    <br/>
    <br/>
    Avoid killing Civillians, Search all Buildings and Capture any surrendering AI for interregation
    <br/>
    at the FOB's.
    <br/>
    <br/>
    Read the Tutorial at the start of your deployment, Gathering and Storage of the supply, ammo, and 
    <br/>
	fuel crates are vital to FOB resources
	<br/>
    Above all else, We are all here to have fun, That does not mean being a Dick! You WILL be removed.
    <br/>
    
    By clicking ""Continue"", you accept the rules and will not complain, ever!
    </t>" //No comma at the last line =)
];

hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", { //Uncomment this section if you dont want the hint that follows when you click "continue" Thanks Pain2407
    0 = _this spawn {
        _this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
        hintSilent "";
    };
}];
