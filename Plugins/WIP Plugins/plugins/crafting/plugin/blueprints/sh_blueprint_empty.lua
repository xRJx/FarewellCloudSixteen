/**
local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "";
ITEM.model = "";
ITEM.weight = 0;

ITEM.category = ""
ITEM.crafting = true;
ITEM.description = "Requirements: \n";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		(player:HasItemByID("") and table.Count(player:GetItemsByID("item_id1")) >= 2) and
		player:HasItemByID("")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("")) and
		player:TakeItem(player:FindItemByID(""))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("")) and
		player:GiveItem(Clockwork.item:CreateInstance(""))
	)
end;

ITEM:Register();
**/