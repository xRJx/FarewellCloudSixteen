local ITEM = Clockwork.item:New();

ITEM.name = "Refined Metal";
ITEM.model = "models/gibs/metal_gib2.mdl";
ITEM.weight = 2;
ITEM.category = "Materials";
ITEM.description = "A strong and clean piece of metal.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();