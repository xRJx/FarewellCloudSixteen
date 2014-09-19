/**
local BLUEPRINT = Clockwork.item:New("blueprint_base");

BLUEPRINT.name = "Flashlight Blueprint"; -- The name of the blueprint.
BLUEPRINT.model = "models/flashlight/flashlight.mdl"; -- The model of the blueprint image.
BLUEPRINT.weight = 1; -- Used to "represent" the weight of the item to be crafted.
BLUEPRINT.category = "Blueprints"; -- The catagory the blueprint will belong to.
BLUEPRINT.crafting = true; -- Whether or not this blueprint is used for crafting.
BLUEPRINT.overrideDesc = false; -- Whether or not automatic requirements won't be used.
BLUEPRINT.description = "A simple flashlight."; -- Can only be assigned if overrideDesc is set to true.

--[[MULTI-CTG (Check Take Give)]]--
--To check/take/give multiples of any given item, use this formating: {"item_id", #} where the item_id is the ID of the item you wish to check/take/give and # is the amount to check/take/give.

-- A function to check for the required material(s) for a craft.
function BLUEPRINT:HasMaterials(player)
	-- The name of the item is in quotations. If you want more than 1 of those items as a requirement, read MULTI-CTG (see above).
	
	return
	{
		{"item_id1", 1},
		{"item_id2", 2},
		{"item_id3", 1}
	}
end;

-- A function to take the required material(s) for a craft.
function BLUEPRINT:TakeMaterials(player)
	-- Not all items that are requirements need to be taken. If you want more of the same item taken, read MULTI-CTG (see above).
	
	return
	{
		{"item_id1", 1},
		{"item_id2", 2}
	}
end;

-- A function to give a player the crafted item(s).
function BLUEPRINT:GiveCraft(player)
	-- You can give as many items as you want after the player has crafted. If you more of the same item given, read MULTI-CTG (see above).
	
	return
	{
		{"item_id4", 1},
		{"item_id5", 2}
	}
end;

BLUEPRINT:Register();
**/