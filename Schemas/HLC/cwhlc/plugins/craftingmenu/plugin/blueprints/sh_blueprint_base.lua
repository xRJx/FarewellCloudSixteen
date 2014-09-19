local PLUGIN = PLUGIN;

local BLUEPRINT = Clockwork.item:New(nil, true);

BLUEPRINT.name = "Blueprint Base";
BLUEPRINT.useText = "Craft";
BLUEPRINT.description = "A blue paper with a white drawing on it.";

-- A function to check if a player has the required materials to craft an item.
function BLUEPRINT:AllowCraft(player, entity)
	if (Clockwork.plugin:Call("HasItems", player, entity:HasMaterials(player))) then
		return true;
	else
		return false;
	end;
end;

-- Called when a player crafts the item.
function BLUEPRINT:OnCraft(player, entity)
	Clockwork.plugin:Call("TakeItems", player, entity:TakeMaterials(player));
	Clockwork.plugin:Call("GiveItems", player, entity:GiveCraft(player));
end;

BLUEPRINT:Register();