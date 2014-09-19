/**
local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Wooden Pole Blueprint";
BLUEPRINT.model = "";
BLUEPRINT.weight = 0.5;

BLUEPRINT.category = "Material Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Wood", 1},
		{"Knife", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Wood", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Wooden Pole", 1}
	}
end;

BLUEPRINT:Register();
**/