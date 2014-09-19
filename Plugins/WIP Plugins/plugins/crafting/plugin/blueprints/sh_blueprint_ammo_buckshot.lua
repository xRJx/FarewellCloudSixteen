local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Shotgun Shells Blueprint";
ITEM.model = "models/items/boxbuckshot.mdl";
ITEM.weight = 1;

ITEM.category = "Ammunition"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Bullet Casings \nx1 Scrap Metal \nx1 Gunpowder \nx1 Plastic";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("bullet_casings") and
		player:HasItemByID("scrap_metal") and
		player:HasItemByID("gunpowder") and
		player:HasItemByID("plastic")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("bullet_casings")) and
		player:TakeItem(player:FindItemByID("scrap_metal")) and
		player:TakeItem(player:FindItemByID("gunpowder")) and
		player:TakeItem(player:FindItemByID("plastic"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("ammo_buckshot"))
	)
end;

ITEM:Register();