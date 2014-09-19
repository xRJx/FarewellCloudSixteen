local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Night Vision Goggles";
ITEM.model = "models/gibs/shield_scanner_gib1.mdl";
ITEM.weight = 1.5;
ITEM.cost = 150;
ITEM.business = true;
ITEM.description = "A pair of goggles to allow perception in the dark.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local nvactive = player:GetCharacterData("nvInUse")
	
	if (nvActive) then
		Clockwork.player:Notify(player, "You already have this implanted!");
		return false
	else
		player:SetCharacterData("nvInUse", true);
		Clockwork.player:GiveSpawnWeapon(player, "cw_night_vision");
	end;
end;

ITEM:Register();