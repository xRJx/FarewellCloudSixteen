local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Reclaimed Metal Blueprint";
BLUEPRINT.model = "models/props_lab/pipesystem03a.mdl";
BLUEPRINT.weight = 1;

BLUEPRINT.category = "Metal Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Scrap Metal", 3}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Scrap Metal", 3}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Reclaimed Metal", 1}
	}
end;

BLUEPRINT:Register();