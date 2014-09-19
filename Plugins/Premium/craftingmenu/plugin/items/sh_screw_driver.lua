local ITEM = Clockwork.item:New();

ITEM.name = "Screw Driver";
ITEM.model = "models/props_c17/TrapPropeller_Lever.mdl";
ITEM.weight = 0.6;
ITEM.category = "Materials";
ITEM.description = "A tool useful for tightening screws.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();