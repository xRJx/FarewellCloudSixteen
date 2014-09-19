local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Pistol Ammo Blueprint";
ITEM.model = "models/items/boxsrounds.mdl";
ITEM.weight = 1;

ITEM.category = "Ammunition"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Bullet Casings \nx1 Gunpowder \nx1 Refined Metal";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("bullet_casings") and
		player:HasItemByID("gunpowder") and
		player:HasItemByID("refined_metal")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("bullet_casings")) and
		player:TakeItem(player:FindItemByID("gunpowder")) and
		player:TakeItem(player:FindItemByID("refined_metal"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("ammo_pistol"))
	)
end;

ITEM:Register();