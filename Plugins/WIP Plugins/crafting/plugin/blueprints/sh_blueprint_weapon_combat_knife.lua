local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Combat Knife Blueprint";
ITEM.model = "models/weapons/w_knife_t.mdl";
ITEM.weight = 1;

ITEM.category = "Weapon Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Knife \nx1 Rock";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("knife") and
		player:HasItemByID("kock")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("knife")) and
		player:TakeItem(player:FindItemByID("rock"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("weapon_knife"))
	)
end;

ITEM:Register();