local ITEM = Clockwork.item:New("blueprint_base");

ITEM.name = "Bandage Blueprint";
ITEM.model = "models/props_wasteland/prison_toiletchunk01f.mdl";
ITEM.weight = 0.5;

ITEM.category = "Medical Blueprints"
ITEM.crafting = true;
ITEM.description = "Requirements: \nx1 Cloth";

-- A function to check for the required materials for a craft.
function ITEM:HasMaterials(player)
	return(
	player:HasItemByID("cloth") )
end;

-- A function to take the required materials for a craft.
function ITEM:TakeMaterials(player)
	return(
	player:TakeItem(player:FindItemByID("cloth")) )
end;

-- A function to give a player a crafted item.
function ITEM:GiveCraft(player)
	return(
	timer.Create( tostring(player:EntIndex()), 0, math.random(1, 3), function()
		player:GiveItem(Clockwork.item:CreateInstance("bandage"))
	end) )
	
	--timer.Destroy( player:EntIndex() )
end;

ITEM:Register();