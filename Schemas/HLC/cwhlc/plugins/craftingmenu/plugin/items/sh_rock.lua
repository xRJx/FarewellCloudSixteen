local ITEM = Clockwork.item:New();

ITEM.name = "Rock";
ITEM.model = "models/props_junk/rock001a.mdl";
ITEM.weight = 4;
ITEM.category = "Materials";
ITEM.description = "A solid piece of stone that useful for hitting things.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();