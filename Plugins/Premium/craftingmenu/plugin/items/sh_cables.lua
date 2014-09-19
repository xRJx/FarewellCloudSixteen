local ITEM = Clockwork.item:New();

ITEM.name = "Cables";
ITEM.model = "models/Items/CrossbowRounds.mdl";
ITEM.weight = 0.2;
ITEM.category = "Materials";
ITEM.description = "A small bundle of various cables";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
