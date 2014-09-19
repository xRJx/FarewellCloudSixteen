local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "SMG Ammo Blueprint";
BLUEPRINT.model = "models/items/boxmrounds.mdl";
BLUEPRINT.weight = 2;

BLUEPRINT.category = "Ammunition Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Bullet Casings", 2},
		{"Gunpowder", 2},
		{"Refined Metal", 2}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Bullet Casings", 2},
		{"Gunpowder", 2},
		{"Refined Metal", 2}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Ammo Smg1", 1}
	}
end;

BLUEPRINT:Register();