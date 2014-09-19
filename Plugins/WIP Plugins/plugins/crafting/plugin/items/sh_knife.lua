local ITEM = Clockwork.item:New();

ITEM.name = "Cutting Knife";
ITEM.value = "Uncommon";
ITEM.model = "models/weapons/w_knife_ct.mdl";
ITEM.weight = 1;
ITEM.category = "Materials";
ITEM.description = "A knife that has a sharp edge.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();