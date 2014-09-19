local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Zip Tie Blueprint";
BLUEPRINT.model = "models/items/crossbowrounds.mdl";
BLUEPRINT.weight = 0.1;

BLUEPRINT.category = "Miscellaneous Blueprints";
BLUEPRINT.crafting = true;

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"Cables", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"Cables", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"Zip Tie", 1}
	}
end;

BLUEPRINT:Register();