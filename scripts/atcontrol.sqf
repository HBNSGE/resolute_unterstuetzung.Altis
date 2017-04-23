addMissionEventHandler ["PlayerConnected",{ua1 synchronizeObjectsAdd [bw1]; "Synchronisierung wieder hergestellt." remoteExec ["hint"];}];

bw1 addEventHandler ["Killed",{ua1 synchronizeObjectsRemove [bw1]; "Artillerieunterstützung ist zur Zeit nicht verfügbar." remoteExec ["hint"];}];

bw1 addEventHandler ["Respawn",{nul = execVM "scripts\atcontrol1.sqf"}];

