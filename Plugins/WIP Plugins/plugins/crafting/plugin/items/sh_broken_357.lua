local ITEM = Clockwork.item:New();

ITEM.name = "Broken .357 Magnum";
ITEM.value = "Valuable";
ITEM.model = "models/weapons/w_357.mdl";
ITEM.weight = 2;
ITEM.category = "Materials";
ITEM.description = "A small pistol coated in a dull grey.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();