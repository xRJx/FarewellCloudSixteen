local ITEM = Clockwork.item:New();

ITEM.name = "Plastic";
ITEM.model = "models/props_debris/metal_panelshard01b.mdl";
ITEM.weight = 1;
ITEM.category = "Materials";
ITEM.description = "A sheet of plastic.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();