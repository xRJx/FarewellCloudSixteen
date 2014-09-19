local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Thermal Goggles";
ITEM.model = "models/gibs/shield_scanner_gib1.mdl";
ITEM.weight = 1.5;
ITEM.cost = 175;
ITEM.business = true;
ITEM.description = "A pair of goggles to allow the perception of heat signatures.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local thermalActive = player:GetCharacterData("thermalActive")
	
	if (thermalActive) then
		Clockwork.player:Notify(player, "You already have a pair of thermals equipped!");
		return false
	else
		player:SetCharacterData("thermalActive", true);
		Clockwork.player:GiveSpawnWeapon(player, "cw_thermal_goggles");
	end;
end;

ITEM:Register();