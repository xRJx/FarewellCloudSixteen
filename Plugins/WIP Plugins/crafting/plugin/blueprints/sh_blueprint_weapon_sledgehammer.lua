/**
local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Sledgehammer Blueprint";
ITEM.model = "";
ITEM.weight = 2.5;

ITEM.category = "Weapon Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Wooden pole \nx2 Refined metal";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("wooden_pole") and
		player:HasItemByID("refined_metal") and (table.Count(player:GetItemsByID("refined_metal")) >= 2)
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("wooden_pole")) and
		player:TakeItem(player:FindItemByID("refined_metal")) and
		player:TakeItem(player:FindItemByID("refined_metal"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("sledgehammer"))
	)
end;

ITEM:Register();
**/