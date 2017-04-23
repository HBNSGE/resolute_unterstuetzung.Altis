if (isServer) then {
sleep 10; 
bw1 synchronizeObjectsAdd [ua1]; 
"Artillerieunterstützung ist wieder verfügbar." remoteExec ["hint"];
};