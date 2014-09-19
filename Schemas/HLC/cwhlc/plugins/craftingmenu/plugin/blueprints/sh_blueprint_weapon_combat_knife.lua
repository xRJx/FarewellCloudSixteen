local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Combat Knife Blueprint";
BLUEPRINT.model = "models/weapons/w_Knife_t.mdl";
BLUEPRINT.weight = 1;

BLUEPRINT.category = "Weapon Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Knife", 1},
		{"Rock", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Knife", 1},
		{"Rock", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Weapon Knife", 1}
	}
end;

BLUEPRINT:Register();