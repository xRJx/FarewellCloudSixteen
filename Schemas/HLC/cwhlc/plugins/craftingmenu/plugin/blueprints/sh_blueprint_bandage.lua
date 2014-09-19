local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Bandage Blueprint";
BLUEPRINT.model = "models/props_wasteland/prison_toiletchunk01f.mdl";
BLUEPRINT.weight = 0.5;

BLUEPRINT.category = "Medical Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Cloth", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Cloth", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Bandage", 1}
	}
end;

BLUEPRINT:Register();