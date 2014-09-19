local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Stealth Implant";
ITEM.model = "models/gibs/shield_scanner_gib1.mdl";
ITEM.weight = 1.5;
ITEM.cost = 200;
ITEM.classes = {CLASS_EOW};
ITEM.business = true;
ITEM.category = "Implants";
ITEM.description = "An implant to allow imperceptibility by eyesight.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local hasStealthImplant = player:GetCharacterData("stealthImplanted")
	
	--if (player:GetFaction() == FACTION_OTA) then
		if (hasStealthImplant) then
			Clockwork.player:Notify(player, "You already have this implanted!");
			return false;
		else
			player:SetCharacterData("stealthImplanted", true);
			Clockwork.player:GiveSpawnWeapon(player, "cw_stealthimplant");
		end;
	--[[else
		player:TakeDamage(5, player, player);
		Clockwork.player:Notify(player, "Your system rejected the implant!");
	end;]]--
end;

ITEM:Register();