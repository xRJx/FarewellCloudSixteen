local ITEM = Clockwork.item:New();

ITEM.name = "Reclaimed Metal";
ITEM.model = "models/props_lab/pipesystem03a.mdl";
ITEM.weight = 1;
ITEM.category = "Materials";
ITEM.description = "A sturdy and tough piece of metal.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();