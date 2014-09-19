local ITEM = Clockwork.item:New();

ITEM.name = "Scrap Metal";
ITEM.model = "models/props_debris/metal_panelchunk02d.mdl";
ITEM.weight = 0.8;
ITEM.category = "Materials";
ITEM.description = "A bent and dirty piece of metal.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();