local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Grenade Blueprint";
ITEM.model = "models/weapons/w_grenade.mdl";
ITEM.weight = 0.5;

ITEM.category = "Explosives"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx2 Gunpowder \nx2 Scrap Metal \nx1 Scrap Electronics";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("gunpowder") and (table.Count(player:GetItemsByID("Gunpowder")) >= 2) and
		player:HasItemByID("scrap_metal") and (table.Count(player:GetItemsByID("Scrap metal")) >= 2) and
		player:HasItemByID("scrap_electronics")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("gunpowder")) and
		player:TakeItem(player:FindItemByID("gunpowder")) and
		player:TakeItem(player:FindItemByID("scrap_metal")) and
		player:TakeItem(player:FindItemByID("scrap_metal")) and
		player:TakeItem(player:FindItemByID("scrap_electronics"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("weapon_frag"))
	)
end;

ITEM:Register();