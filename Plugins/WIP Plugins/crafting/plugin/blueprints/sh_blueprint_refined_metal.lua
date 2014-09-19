local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Refined Metal Blueprint";
ITEM.model = "models/gibs/metal_gib2.mdl";
ITEM.weight = 2;

ITEM.category = "Metal Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx3 Reclaimed Metal";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("reclaimed_metal") and (table.Count(player:GetItemsByID("reclaimed_metal")) >= 3)
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("reclaimed_metal")) and
		player:TakeItem(player:FindItemByID("reclaimed_metal")) and
		player:TakeItem(player:FindItemByID("reclaimed_metal"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("refined_metal"))
	)
end;

ITEM:Register();