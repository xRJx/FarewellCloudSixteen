local PLUGIN = PLUGIN;

-- Called when a player's character has loaded.
function PLUGIN:PlayerCharacterInitialized(player)
	if (player:IsWearingItem(player:FindItemByID("civil_protection_uniform"))) then
		player:RemoveClothes();
	end;
end;