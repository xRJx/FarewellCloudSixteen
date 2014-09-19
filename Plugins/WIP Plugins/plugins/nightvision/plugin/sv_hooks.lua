local PLUGIN = PLUGIN;

-- Called at an interval while a player is connected.
function PLUGIN:PlayerThink(player, curTime, infoTable)
	player:HandleNightVisionGoggles();
end;

-- Called when a player's weapons should be given.
function PLUGIN:PlayerGiveWeapons(player)
	local nvActive = player:GetCharacterData("nvActive")
	
	if (nvActive) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_night_vision");
	end;
end;