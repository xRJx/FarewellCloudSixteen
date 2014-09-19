local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Backpack Blueprint";
BLUEPRINT.model = "models/props_junk/cardboard_box004a.mdl";
BLUEPRINT.weight = 0.2;

BLUEPRINT.category = "Storage Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Cloth", 2},
		{"Cables", 2}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Cloth", 2},
		{"Cables", 2}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"boxed_backpack", 1}
	}
end;

BLUEPRINT:Register();