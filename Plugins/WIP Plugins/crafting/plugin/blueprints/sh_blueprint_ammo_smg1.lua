local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "SMG Ammo Blueprint";
ITEM.model = "models/items/boxmrounds.mdl";
ITEM.weight = 2;

ITEM.category = "Ammunition Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx2 Bullet casings \nx2 Gunpowder \nx2 Refined metal";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("bullet_casings") and (table.Count(player:GetItemsByID("bullet_casings")) >= 2) and
		player:HasItemByID("gunpowder") and (table.Count(player:GetItemsByID("gunpowder")) >= 2) and
		player:HasItemByID("refined_metal") and (table.Count(player:GetItemsByID("refined_metal")) >= 2)
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("bullet_casings")) and
		player:TakeItem(player:FindItemByID("bullet_casings")) and
		player:TakeItem(player:FindItemByID("gunpowder")) and
		player:TakeItem(player:FindItemByID("gunpowder")) and
		player:TakeItem(player:FindItemByID("refined_metal")) and
		player:TakeItem(player:FindItemByID("refined_metal"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("ammo_smg1"))
	)
end;

ITEM:Register();