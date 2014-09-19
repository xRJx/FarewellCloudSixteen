/**
local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "";
BLUEPRINT.model = "";
BLUEPRINT.weight = 0;
BLUEPRINT.category = "";
BLUEPRINT.crafting = true;
BLUEPRINT.overrideDesc = false;
BLUEPRINT.description = "";

-- A function to check for the required materials for a craft.
function BLUEPRINT:HasMaterials(player)
	return
	{
		{"", 1},
		{"", 1}
	}
end;

-- A function to take the required materials for a craft.
function BLUEPRINT:TakeMaterials(player)
	return
	{
		{"", 1},
		{"", 1}
	}
end;

-- A function to give a player a crafted item.
function BLUEPRINT:GiveCraft(player)
	return
	{
		{"", 1},
		{"", 1}
	}
end;

BLUEPRINT:Register();
**/