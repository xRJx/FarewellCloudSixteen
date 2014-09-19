local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Crossbow Blueprint";
BLUEPRINT.model = "models/crossbow/w_crossbow.mdl";
BLUEPRINT.weight = 1.5;

BLUEPRINT.category = "Weapon Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Cables", 2},
		{"Scrap Metal", 2},
		{"Wood", 1},
		{"Energy Cell", 1},
		{"bottle", 1},
		{"Refined Metal", 1},
		{"Scrap Electronics", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Cables", 2},
		{"Scrap Metal", 2},
		{"Energy Cell", 1},
		{"Wood", 1},
		{"bottle", 1},
		{"Refined Metal", 1},
		{"Scrap Electronics", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Weapon Crossbow", 1}
	}
end;

BLUEPRINT:Register();