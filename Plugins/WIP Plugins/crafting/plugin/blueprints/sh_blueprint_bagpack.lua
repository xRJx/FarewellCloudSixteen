local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Backpack Blueprint";
ITEM.model = "models/props_junk/cardboard_box004a.mdl";
ITEM.weight = 0.2;

ITEM.category = "Storage Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx2 Cloth \nx2 Cables";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("cloth") and (table.Count(player:GetItemsByID("cloth")) >= 2) and
		player:HasItemByID("cables") and (table.Count(player:GetItemsByID("cables")) >= 2)
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("cloth")) and
		player:TakeItem(player:FindItemByID("cloth")) and
		player:TakeItem(player:FindItemByID("cables")) and
		player:TakeItem(player:FindItemByID("cables"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("boxed_backpack"))
	)
end;

ITEM:Register();