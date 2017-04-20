_time = "Zeitbeschleunigung" call BIS_fnc_getParamValue;

if (_time == 1) then
	{
		setTimeMultiplier 1;
	};
if (_time == 5) then
	{
		setTimeMultiplier 5;
	};
if (_time == 10) then
	{
		setTimeMultiplier 10;
	};	
if (_time == 20) then
	{
		setTimeMultiplier 20;
	};	
