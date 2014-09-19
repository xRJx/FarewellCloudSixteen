local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Breach Blueprint";
ITEM.model = "models/props_wasteland/prison_padlock001a.mdl";
ITEM.weight = 1;

ITEM.category = "Explosive Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx3 Gunpowder \nx1 Cables \nx1 Refined Electronics \nx1 Energy Cell \nx1 Cloth";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("gunpowder") and (table.Count(player:GetItemsByID("gunpowder")) >= 3) and
		player:HasItemByID("cables") and
		player:HasItemByID("refined_electronics") and
		player:HasItemByID("energy_cell") and
		player:HasItemByID("cables")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("gunpowder")) and
		player:TakeItem(player:FindItemByID("gunpowder")) and
		player:TakeItem(player:FindItemByID("gunpowder")) and
		player:TakeItem(player:FindItemByID("cables")) and
		player:TakeItem(player:FindItemByID("refined_electronics")) and
		player:TakeItem(player:FindItemByID("energy_cell")) and
		player:TakeItem(player:FindItemByID("cloth"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("breach"))
	)
end;

ITEM:Register();