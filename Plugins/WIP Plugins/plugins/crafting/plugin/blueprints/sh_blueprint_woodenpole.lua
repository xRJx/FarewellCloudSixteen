/**
local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Wooden Pole Blueprint";
ITEM.model = "";
ITEM.weight = 0.5;

ITEM.category = "Materials"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Wood \nx1 Knife";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("wood") and
		player:HasItemByID("knife")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("wood"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("wooden_pole"))
	)
end;

ITEM:Register();
**/