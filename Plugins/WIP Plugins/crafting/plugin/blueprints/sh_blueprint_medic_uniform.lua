local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Medic Uniform Blueprint";
ITEM.model = "models/props_c17/suitcase_passenger_physics.mdl";
ITEM.weight = 1;

ITEM.category = "Clothing Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx3 Cloth";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		(player:HasItemByID("cloth") and table.Count(player:GetItemsByID("cloth")) >= 3)
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("cloth")) and
		player:TakeItem(player:FindItemByID("cloth")) and
		player:TakeItem(player:FindItemByID("cloth"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("medic_uniform"))
	)
end;

ITEM:Register();