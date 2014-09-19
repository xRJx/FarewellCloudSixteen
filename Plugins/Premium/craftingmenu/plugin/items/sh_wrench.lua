local ITEM = Clockwork.item:New();

ITEM.name = "Wrench";
ITEM.model = "models/props_c17/tools_wrench01a.mdl";
ITEM.weight = 1;
ITEM.category = "Materials";
ITEM.description = "A tool useful for tightening bolts.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();