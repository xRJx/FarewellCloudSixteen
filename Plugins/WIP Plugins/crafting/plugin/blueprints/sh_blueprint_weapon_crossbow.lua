local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Crossbow Blueprint";
ITEM.model = "models/crossbow/w_crossbow.mdl";
ITEM.weight = 1.5;

ITEM.category = "Weapon Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx2 Cables \nx2 Scrap Metal \nx1 Wood \nx1 Energy Cell \nx1 Bottle \nx1 Refined Metal \nx1 Scrap Electronics";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("cables") and (table.Count(player:GetItemsByID("cables")) >= 2) and
		player:HasItemByID("scrap_metal") and (table.Count(player:GetItemsByID("scrap_metal")) >= 2) and
		player:HasItemByID("wood") and
		player:HasItemByID("energy_cell") and
		player:HasItemByID("bottle") and
		player:HasItemByID("refined_metal") and
		player:HasItemByID("scrap_electronics")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("cables")) and
		player:TakeItem(player:FindItemByID("cables")) and
		player:TakeItem(player:FindItemByID("scrap_metal")) and
		player:TakeItem(player:FindItemByID("scrap_metal")) and
		player:TakeItem(player:FindItemByID("energy_cell")) and
		player:TakeItem(player:FindItemByID("wood")) and
		player:TakeItem(player:FindItemByID("bottle")) and
		player:TakeItem(player:FindItemByID("refined_metal")) and
		player:TakeItem(player:FindItemByID("scrap_electronics"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("weapon_crossbow"))
	)
end;

ITEM:Register();