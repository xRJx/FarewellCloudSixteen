local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Refined Metal Blueprint";
BLUEPRINT.model = "models/gibs/metal_gib2.mdl";
BLUEPRINT.weight = 2;

BLUEPRINT.category = "Metal Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Reclaimed Metal", 3}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Reclaimed Metal", 3}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Refined Metal", 2}
	}
end;

BLUEPRINT:Register();