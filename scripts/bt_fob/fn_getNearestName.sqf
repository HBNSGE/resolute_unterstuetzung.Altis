private ["_locs","_nearestName"];

_locs = nearestLocations [position _this, ["Airport","Hill","Name","NameLocal","NameCity","NameVillage"], 5000];
_nearestName = text (_locs select 0);

_nearestName;