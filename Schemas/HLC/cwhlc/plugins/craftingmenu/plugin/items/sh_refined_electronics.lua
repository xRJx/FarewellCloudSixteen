local ITEM = Clockwork.item:New();

ITEM.name = "Refined Electronics";
ITEM.model = "models/props_lab/reciever01b.mdl";
ITEM.weight = 0.5;
ITEM.category = "Materials";
ITEM.description = "An item full of useful electrical parts.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();