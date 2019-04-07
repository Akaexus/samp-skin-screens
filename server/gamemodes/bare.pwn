#include <a_samp>
#include <core>
#include <float>
#include <zcmd>
// #include <sscanf>

#pragma tabsize 0

main()
{
	print("\nSkin screenshoting tool!");
}

public OnPlayerConnect(playerid)
{

	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerInterior(playerid,0);
	TogglePlayerClock(playerid,0);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
   	return 1;
}

SetupPlayerForClassSelection(playerid)
{
 	SetPlayerInterior(playerid,14);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, 270.0);
	SetPlayerCameraPos(playerid,256.0815,-43.0475,1004.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
}

public OnPlayerRequestClass(playerid, classid)
{
	SetupPlayerForClassSelection(playerid);
	return 1;
}

public OnGameModeInit()
{
	SetGameModeText("Skin screenshoting tool!");
	ShowPlayerMarkers(1);
	ShowNameTags(1);
	AllowAdminTeleport(1);

	AddPlayerClass(265,1958.3783,1343.1572,15.3746,270.1425,0,0,0,0,-1,-1);
	/* CreateObject(1564, -2432.7393, -1619.9874, 1500+526.8618, 0, 0, 0, 0.0); */
	new gate1 = CreateObject(980, 2044.41687, 1355.85181, 9.76670,   90.00000, 0.00000, 0.00000);
	new gate2 = CreateObject(980, 2044.41687, 1358.05176, 11.66670,   0.00000, 0.00000, 0.00000);
	for(new i = 0; i < 15; i++)
	{
		SetObjectMaterial(gate1, i, 1675, "wshxrefhse", "duskyblue_128", 0xFF00FF00);
		SetObjectMaterial(gate2, i, 1675, "wshxrefhse", "duskyblue_128", 0xFF00FF00);
	}

	return 1;
}

strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

CMD:skin(playerid, params[]) {
	new tmp[256];
	new idx;
	tmp = strtok(params, idx);
	if(!strlen(tmp)) {
		SendClientMessage(playerid, 0xFF9900AA, "wpisz id");
	} else {
		SetPlayerSkin(playerid, strval(tmp));
		SendClientMessage(playerid, 0x00BBBB99, "zmieniono skin");
	}
	return 1;
}

CMD:weather(playerid, params[]) {
	new tmp[256];
	new idx;
	tmp = strtok(params, idx);
	SetWeather(strval(params));
	return 1;
}

CMD:veh(playerid, params[]) {
	// shit code alert
	new vehid[255];
	new string[128];
	new veh;
	new car;
	new idx;
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, Float:X, Float:Y, Float:Z);
	vehid = strtok(params, idx);
	car = strval(vehid);
	if(car < 400 || car >611) return SendClientMessage(playerid, 0xff0000ff, "ERROR: Cannot go under 400 or above 611.");
	{
		veh = CreateVehicle(car, X, Y, Z + 2.0, 0, -1, -1, 1);
		format(string,sizeof(string),"You Have Spawned Vehicle ID %i",car);
		SendClientMessage(playerid, 0xffffffff, string);
		PutPlayerInVehicle(playerid, veh, 0);
	}
	return 1;
}

CMD:arrange(playerid,params[]) {
	SetPlayerPos(playerid, 2044, 1356, 10.8);
	SetPlayerFacingAngle(playerid, 180);
	SetPlayerCameraLookAt(playerid, 2044, 1356, 10.8);
	SetPlayerCameraPos(playerid, 2044, 1353.25, 11);
	/* SetPlayerPos(playerid, -2432.7393, -1619.9874, 1500+527.8618);
	SetPlayerFacingAngle(playerid, 299.7041);
	SetPlayerCameraPos(playerid, -2430.5168, -1618.5668, 1500+528.15);
	SetPlayerCameraLookAt(playerid, -2432.7393, -1619.9874, 1500+528.15); */

	/* SetPlayerWeather(playerid, 4); */
	/* SetPlayerTime(playerid, 12, 0); */
	return 1;
}

CMD:arrange2(playerid,params[]) {
	SetPlayerPos(playerid, 2044, 1356, 10.8);
	SetPlayerFacingAngle(playerid, 180);
	SetPlayerCameraLookAt(playerid, 2044, 1356, 11.4);
	SetPlayerCameraPos(playerid, 2044, 1355, 11.4);

	/* SetPlayerPos(playerid, -2432.7393, -1619.9874, 1500+527.8618);
	SetPlayerFacingAngle(playerid, 299.7041);
	SetPlayerCameraPos(playerid, (-2430.5168-2432.7393)/2, (-1618.5668-1619.9874)/2, 1500+528.75);
	SetPlayerCameraLookAt(playerid, -2432.7393, -1619.9874, 1500+528.75); */

	/* SetPlayerWeather(playerid, 4); */
	/* SetPlayerTime(playerid, 12, 0); */
	// SetPlayerPos(playerid, -2432.7393, -1619.9874, 527.8618);
	// SetPlayerFacingAngle(playerid, 299.7041);
	// SetPlayerCameraPos(playerid, -2432.18365, -1619.63225, 528.85);
	// SetPlayerCameraLookAt(playerid, -2432.7393, -1619.9874, 528.85);
	// SetPlayerWeather(playerid, 4);
	// SetPlayerTime(playerid, 12, 0);
	return 1;
}
