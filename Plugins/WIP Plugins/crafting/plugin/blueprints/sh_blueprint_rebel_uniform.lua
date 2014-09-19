local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Resistance Uniform Blueprint";
ITEM.model = "models/props_c17/suitcase_passenger_physics.mdl";
ITEM.weight = 1;

ITEM.category = "Clothing Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx3 Cloth \nx1 Kevlar";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		(player:HasItemByID("Cloth") and table.Count(player:GetItemsByID("Cloth")) >= 3) and
		player:HasItemByID("Kevlar")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("Cloth")) and
		player:TakeItem(player:FindItemByID("Cloth")) and
		player:TakeItem(player:FindItemByID("Cloth")) and
		player:TakeItem(player:FindItemByID("Kevlar"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("Resistance uniform"))
	)
end;

ITEM:Register();
