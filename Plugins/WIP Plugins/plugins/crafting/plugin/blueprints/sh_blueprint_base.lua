local ITEM = Clockwork.item:New(nil, true);

ITEM.name = "Blueprint Base";
ITEM.useText = "Craft";
ITEM.description = "A blue paper with a white drawing on it.";

-- A function to check if a player has the required materials to craft an item.
function ITEM:AllowCraft(player, entity)
	if ( entity:HasMaterials(player) ) then
		return true;
	else
		return false;
	end;
end;

-- Called when a player crafts the item.
function ITEM:OnCraft(player, entity)
	entity:TakeMaterials(player);
	entity:GiveCraft(player);
end;

ITEM:Register();