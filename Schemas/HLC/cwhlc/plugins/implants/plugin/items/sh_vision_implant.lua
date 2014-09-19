local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Night Vision Implant";
ITEM.model = "models/gibs/shield_scanner_gib1.mdl";
ITEM.weight = 1.5;
ITEM.cost = 150;
ITEM.classes = {CLASS_EOW};
ITEM.business = true;
ITEM.category = "Implants";
ITEM.description = "An implant to allow perception in the dark.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local hasVisionImplant = player:GetCharacterData("visionImplanted")
	
	--if (player:GetFaction() == FACTION_OTA) then
		if (hasVisionImplant) then
			Clockwork.player:Notify(player, "You already have this implanted!");
			return false
		else
			player:SetCharacterData("visionImplanted", true);
			Clockwork.player:GiveSpawnWeapon(player, "cw_visionimplant");
		end;
	--[[else
		player:TakeDamage(5, player, player);
		Clockwork.player:Notify(player, "Your system rejected the implant!");
	end;]]--
end;

ITEM:Register();