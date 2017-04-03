//script gets the value if the artillery computer should be enabled or not
//value is extracted from lobby parameters

_acstatus = "Artilleriecomputer" call BIS_fnc_getParamValue;

if (_acstatus == 1) then
	{
		enableEngineArtillery true;
	}
	else
	{
		enableEngineArtillery false;
	};	