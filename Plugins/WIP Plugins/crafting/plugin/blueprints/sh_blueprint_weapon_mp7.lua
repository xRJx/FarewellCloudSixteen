local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "MP7 Blueprint";
ITEM.model = "models/weapons/w_smg1.mdl";
ITEM.weight = 0.8;

ITEM.category = "Weapon Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Broken MP7 \nx2 Refined Metal \nx1 Box of Screws \nx1 Screw Driver";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("broken_mp7") and
		player:HasItemByID("refined_metal") and (table.Count(player:GetItemsByID("refined_metal")) >= 2) and
		player:HasItemByID("box_of_screws") and
		player:HasItemByID("screw_driver")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("broken_mp7")) and
		player:TakeItem(player:FindItemByID("refined_metal")) and
		player:TakeItem(player:FindItemByID("refined_metal")) and
		player:TakeItem(player:FindItemByID("box_of_screws"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("weapon_smg"))
	)
end;

ITEM:Register();