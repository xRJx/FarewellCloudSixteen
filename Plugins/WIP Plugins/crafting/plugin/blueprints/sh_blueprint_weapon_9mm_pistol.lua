local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "9mm Pistol Blueprint";
ITEM.model = "models/weapons/w_pistol.mdl";
ITEM.weight = 0.8;

ITEM.category = "Weapon Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Broken 9mm Pistol \nx2 Reclaimed Metal \nx1 Box of Screws \nx1 Screw Driver";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("broken_9mm_pistol") and
		player:HasItemByID("reclaimed_metal") and (table.Count(player:GetItemsByID("reclaimed_metal")) >= 2) and
		player:HasItemByID("box_of_screws") and
		player:HasItemByID("screw_driver")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
	player:TakeItem(player:FindItemByID("broken_9mm_pistol")) and
	player:TakeItem(player:FindItemByID("reclaimed_metal")) and
	player:TakeItem(player:FindItemByID("box_of_screws")) )
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("weapon_pistol"))
	)
end;

ITEM:Register();