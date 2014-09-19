local PLUGIN = PLUGIN;

-- Called at an interval while a player is connected.
function PLUGIN:PlayerThink(player, curTime, infoTable)
	player:HandleImplants();
end;

-- Called when a player's weapons should be given.
function PLUGIN:PlayerGiveWeapons(player)
	local hasVisionImplanted = player:GetCharacterData("visionImplanted")
	local hasStealthImplanted = player:GetCharacterData("stealthImplanted")
	local hasThermalImplanted = player:GetCharacterData("thermalImplanted")
	
	if (hasVisionImplanted) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_visionimplant");
	end;
	
	if (hasStealthImplanted) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_stealthimplant");
	end;
	
	if (hasThermalImplanted) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_thermalimplant");
	end;
end;