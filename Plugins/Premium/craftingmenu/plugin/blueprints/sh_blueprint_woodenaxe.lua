/**
local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Wooden Axe Blueprint";
BLUEPRINT.model = "";
BLUEPRINT.weight = 1.5;

BLUEPRINT.category = "Weapon Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Wooden Pole", 1},
		{"Refined Metal", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Wooden Pole", 1},
		{"Refined Metal", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Wooden Axe", 1}
	}
end;

BLUEPRINT:Register();
**/