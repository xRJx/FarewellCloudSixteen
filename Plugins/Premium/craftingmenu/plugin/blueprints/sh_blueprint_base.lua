local PLUGIN = PLUGIN;

local BLUEPRINT = Clockwork.item:New(nil, true);

BLUEPRINT.name = "Blueprint Base";
BLUEPRINT.useText = "Craft";
BLUEPRINT.description = "A blue paper with a white drawing on it.";

-- A function to check if a player has the required materials to craft an item.
function BLUEPRINT:AllowCraft(player, entity)
	if (PLUGIN:HasItems(player, entity:HasMaterials(player))) then
		return true;
	else
		return false;
	end;
end;

-- Called when a player crafts the item.
function BLUEPRINT:OnCraft(player, entity)
	PLUGIN:TakeItems(player, entity:TakeMaterials(player));
	PLUGIN:GiveItems(player, entity:GiveCraft(player));
end;

BLUEPRINT:Register();