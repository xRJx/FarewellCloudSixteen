local ITEM = Clockwork.item:New();

ITEM.name = "Empty Bagged Bottle";
ITEM.cost = 1;
ITEM.model = "models/props_junk/garbage_glassbottle002a.mdl";
ITEM.weight = 0.1;
ITEM.access = "j";
ITEM.category = "Junk";
ITEM.business = true;
ITEM.description = "A brown colored whiskey bottle, it has a bag!";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();