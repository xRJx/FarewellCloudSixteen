local PLUGIN = PLUGIN;

-- Called at an interval while a player is connected.
function PLUGIN:PlayerThink(player, curTime, infoTable)
	player:HandleThermalGoggles();
end;

--[[ Called when a player's weapons should be given.
function PLUGIN:PlayerGiveWeapons(player)
	local thermalsActive = player:GetCharacterData("thermalsActive")
	
	if (thermalsActive) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_thermal_goggles");
	end;
end;]]--