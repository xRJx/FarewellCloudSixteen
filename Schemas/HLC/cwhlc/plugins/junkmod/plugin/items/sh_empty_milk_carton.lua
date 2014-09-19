local ITEM = Clockwork.item:New();

ITEM.name = "Empty Milk Carton";
ITEM.cost = 1;
ITEM.model = "models/props_junk/garbage_milkcarton002a.mdl";
ITEM.weight = 0.1;
ITEM.access = "j";
ITEM.category = "Junk";
ITEM.business = true;
ITEM.description = "A carton filled with no delicious milk.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();