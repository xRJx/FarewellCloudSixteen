local ITEM = Clockwork.item:New();

ITEM.name = "Bullet Casings";
ITEM.model = "models/items/ammobox.mdl";
ITEM.weight = 1;
ITEM.category = "Materials";
ITEM.description = "A box with various bullet casings.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();