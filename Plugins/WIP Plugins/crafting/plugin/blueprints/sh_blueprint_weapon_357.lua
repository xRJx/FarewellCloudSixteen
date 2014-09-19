local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = ".357 Magnum Blueprint";
ITEM.model = "models/weapons/w_357.mdl";
ITEM.weight = 0.8;

ITEM.category = "Weapon Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Broken .357 \nx1 Refined Metal \nx1 Box of Screws \nx1 Screw Driver";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("broken_357_magnum") and
		player:HasItemByID("refined_metal") and
		player:HasItemByID("box_of_screws") and
		player:HasItemByID("screw_driver")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("broken_357_magnum")) and
		player:TakeItem(player:FindItemByID("refined_metal")) and
		player:TakeItem(player:FindItemByID("box_of_screws"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("weapon_357"))
	)
end;

ITEM:Register();