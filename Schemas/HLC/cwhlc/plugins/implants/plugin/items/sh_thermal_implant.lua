local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Thermal Implant";
ITEM.model = "models/gibs/shield_scanner_gib1.mdl";
ITEM.weight = 1.5;
ITEM.cost = 175;
ITEM.classes = {CLASS_EOW};
ITEM.business = true;
ITEM.category = "Implants";
ITEM.description = "An implant to allow the perception of heat signatures.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local hasThermalImplant = player:GetCharacterData("thermalImplanted")
	
	--if (player:GetFaction() == FACTION_OTA) then
		if (hasThermalImplant) then
			Clockwork.player:Notify(player, "You already have this implanted!");
			return false
		else
			player:SetCharacterData("thermalImplanted", true);
			Clockwork.player:GiveSpawnWeapon(player, "cw_thermalimplant");
		end;
	--[[else
		player:TakeDamage(5, player, player);
		Clockwork.player:Notify(player, "Your system rejected the implant!");
	end;]]--
end;

ITEM:Register();