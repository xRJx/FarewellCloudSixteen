local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Breach Blueprint";
BLUEPRINT.model = "models/props_wasteland/prison_padlock001a.mdl";
BLUEPRINT.weight = 1;

BLUEPRINT.category = "Explosive Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Gunpowder", 3},
		{"Cables", 1},
		{"Refined Electronics", 1},
		{"Energy Cell", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Gunpowder", 3},
		{"Cables", 1},
		{"Refined Electronics", 1},
		{"Energy Cell", 1},
		{"Cloth", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"breach", 1}
	}
end;

BLUEPRINT:Register();