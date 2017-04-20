private ["_string","_def","_result"];

_string = _this select 0;
_def = _this select 1;


_result = if (isLocalized _string) then { localize _string } else { _def };

_result;