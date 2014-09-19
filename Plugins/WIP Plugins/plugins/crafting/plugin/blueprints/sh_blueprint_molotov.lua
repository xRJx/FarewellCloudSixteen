/**
local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Molotov Blueprint";
ITEM.model = "";
ITEM.weight = 0.5;

ITEM.category = "Explosive"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Bottle \nx1 Petrol \nx1 Cloth";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("Bottle") and
		player:HasItemByID("Petrol") and
		player:HasItemByID("Cloth")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("Bottle")) and
		player:TakeItem(player:FindItemByID("Petrol")) and
		player:TakeItem(player:FindItemByID("Cloth"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("Molotov"))
	)
end;

ITEM:Register();
**/