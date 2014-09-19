/**
local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Baseball Bat Blueprint";
ITEM.model = "";
ITEM.weight = 1.5;

ITEM.category = "Weapon Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Wood \nx1 Knife";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("wood") and
		player:HasItemByID("knife")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("wood"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("weapon_baseball_bat"))
	)
end;

ITEM:Register();
**/