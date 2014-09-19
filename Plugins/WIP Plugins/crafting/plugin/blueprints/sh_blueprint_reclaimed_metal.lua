local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Reclaimed Metal Blueprint";
ITEM.model = "models/props_lab/pipesystem03a.mdl";
ITEM.weight = 1;

ITEM.category = "Metal Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx3 Scrap Metal";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("scrap_metal") and (table.Count(player:GetItemsByID("scrap_metal")) >= 3)
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("scrap_metal")) and
		player:TakeItem(player:FindItemByID("scrap_metal")) and
		player:TakeItem(player:FindItemByID("scrap_metal"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("reclaimed_metal"))
	)
end;

ITEM:Register();