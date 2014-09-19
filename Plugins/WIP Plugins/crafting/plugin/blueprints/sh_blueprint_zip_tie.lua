local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Zip Tie Blueprint";
ITEM.model = "models/items/crossbowrounds.mdl";
ITEM.weight = 0.1;

ITEM.category = "Miscellaneous Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Cables";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("cables")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("cables"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("zip_tie"))
	)
end;

ITEM:Register();