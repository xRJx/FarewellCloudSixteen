local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Handheld Radio Blueprint";
ITEM.model = "models/deadbodies/dead_male_civilian_radio.mdl";
ITEM.weight = 0.5;

ITEM.category = "Miscellaneous Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Refined Electronics \nx1 Refined Metal \nx1 Scrap Metal \nx1 Energy Cell";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("refined_electronics") and
		player:HasItemByID("refined_metal") and
		player:HasItemByID("scrap_metal") and
		player:HasItemByID("energy_cell")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("refined_electronics")) and
		player:TakeItem(player:FindItemByID("refined_metal")) and
		player:TakeItem(player:FindItemByID("scrap_metal")) and
		player:TakeItem(player:FindItemByID("energy_cell"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"))
	)
end;

ITEM:Register();