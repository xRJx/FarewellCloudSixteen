local ITEM = Clockwork.item:New();

ITEM.name = "Gunpowder";
ITEM.model = "models/props_lab/box01a.mdl";
ITEM.weight = 1;
ITEM.category = "Materials";
ITEM.description = "A small box with a fine black powder.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();