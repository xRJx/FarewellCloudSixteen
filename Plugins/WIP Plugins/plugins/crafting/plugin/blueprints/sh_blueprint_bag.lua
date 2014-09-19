
local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Bag Blueprint";
ITEM.model = "models/props_junk/cardboard_box004a.mdl";
ITEM.weight = 0.1;

ITEM.category = "Storage"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Cloth \nx1 Cables";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("cloth") and
		player:HasItemByID("cables")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("cloth")) and
		player:TakeItem(player:FindItemByID("cables"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("boxed_bag"))
	)
end;

ITEM:Register();