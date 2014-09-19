local ITEM = Clockwork.item:New();

ITEM.name = "Scrap Electronics";
ITEM.model = "models/props_lab/reciever01d.mdl";
ITEM.weight = 0.4;
ITEM.category = "Materials";
ITEM.description = "An item full of mangled electrical parts.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();