local ITEM = Clockwork.item:New();

ITEM.name = "Box of Screws";
ITEM.model = "models/props_junk/cardboard_box004a.mdl";
ITEM.weight = 0.5;
ITEM.category = "Materials";
ITEM.description = "A small box full of various screws.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();