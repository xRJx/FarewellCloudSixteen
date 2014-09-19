local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Grenade Blueprint";
BLUEPRINT.model = "models/weapons/w_grenade.mdl";
BLUEPRINT.weight = 0.5;

BLUEPRINT.category = "Explosive Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Gunpowder", 2,},
		{"Scrap Metal", 2},
		{"Scrap Electronics", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Gunpowder", 2},
		{"Scrap Metal", 2},
		{"Scrap Electronics", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Weapon Frag", 1}
	}
end;

BLUEPRINT:Register();