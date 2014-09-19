local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Resistance Uniform Blueprint";
BLUEPRINT.model = "models/props_c17/suitcase_passenger_physics.mdl";
BLUEPRINT.weight = 1;

BLUEPRINT.category = "Clothing Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Cloth", 3},
		{"Kevlar", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Cloth", 3},
		{"Kevlar", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Resistance uniform", 1}
	}
end;

BLUEPRINT:Register();
