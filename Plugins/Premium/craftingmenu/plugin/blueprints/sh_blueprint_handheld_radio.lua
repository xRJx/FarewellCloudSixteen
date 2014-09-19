local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Handheld Radio Blueprint";
BLUEPRINT.model = "models/deadbodies/dead_male_civilian_radio.mdl";
BLUEPRINT.weight = 0.5;

BLUEPRINT.category = "Miscellaneous Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Refined Electronics", 1},
		{"Refined Metal", 1},
		{"Scrap Metal", 1},
		{"Energy Cell", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Refined Electronics", 1},
		{"Refined Metal", 1},
		{"Scrap Metal", 1},
		{"Energy Cell", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"handheld_radio", 1}
	}
end;

BLUEPRINT:Register();