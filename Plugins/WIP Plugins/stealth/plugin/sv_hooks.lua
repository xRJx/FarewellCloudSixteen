local PLUGIN = PLUGIN;

-- Called at an interval while a player is connected.
function PLUGIN:PlayerThink(player, curTime, infoTable)
	player:HandleImplants();
end;

-- Called when a player's weapons should be given.
function PLUGIN:PlayerGiveWeapons(player)
	local hasStealthImplanted = player:GetCharacterData("stealthImplanted")
	
	if (hasStealthImplanted) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_stealth_implant");
	end;
end;