local ITEM = Clockwork.item:New();

ITEM.name = "Box of Bolts";
ITEM.model = "models/props_junk/cardboard_box004a.mdl";
ITEM.weight = 0.6;
ITEM.category = "Materials";
ITEM.description = "A small box full of various bolts.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();