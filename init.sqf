//Scripts run by server
if (isServer) then {
	nul = execVM "scripts\storyboard\task1.sqf";    //Tasks for WEST
};
//Scripts run by player
if (!isDedicated) then {
};
