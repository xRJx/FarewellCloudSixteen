/**
local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Molotov Blueprint";
BLUEPRINT.model = "";
BLUEPRINT.weight = 0.5;

BLUEPRINT.category = "Explosive Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Bottle", 1},
		{"Petrol", 1},
		{"Cloth", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Bottle", 1},
		{"Petrol", 1},
		{"Cloth", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Molotov", 1}
	}
end;

BLUEPRINT:Register();
**/