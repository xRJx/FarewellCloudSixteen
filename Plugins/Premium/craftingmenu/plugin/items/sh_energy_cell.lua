local ITEM = Clockwork.item:New();

ITEM.name = "Energy Cell";
ITEM.model = "models/items/battery.mdl";
ITEM.weight = 0.5;
ITEM.category = "Materials";
ITEM.description = "A blue battery full of electricity.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();