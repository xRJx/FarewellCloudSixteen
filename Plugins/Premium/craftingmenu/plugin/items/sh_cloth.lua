local ITEM = Clockwork.item:New();

ITEM.name = "Cloth";
ITEM.model = "models/props_wasteland/prison_toiletchunk01f.mdl";
ITEM.weight = 0.5;
ITEM.category = "Materials";
ITEM.description = "A torn fabric that's in a rough square shape.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();