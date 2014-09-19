local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Shotgun Shells Blueprint";
BLUEPRINT.model = "models/items/boxbuckshot.mdl";
BLUEPRINT.weight = 1;

BLUEPRINT.category = "Ammunition Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Bullet Casings", 1},
		{"Scrap Metal", 1},
		{"Gunpowder", 1},
		{"Plastic", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Bullet Casings", 1},
		{"Scrap Metal", 1},
		{"Gunpowder", 1},
		{"Plastic", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Ammo Buckshot", 1}
	}
end;

BLUEPRINT:Register();