local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "MP7 Blueprint";
ITEM.model = "models/weapons/w_smg1.mdl";
ITEM.weight = 0.8;

ITEM.category = "Weapons"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Glass \nx1 Cork";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return (
		player:HasItemByID("glass") and
		player:HasItemByID("cork")
	)
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return (
		player:TakeItem(player:FindItemByID("glass")) and
		player:TakeItem(player:FindItemByID("cork"))
	)
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return (
		player:GiveItem(Clockwork.item:CreateInstance("weapon_pistol"))
	)
end;

ITEM:Register();