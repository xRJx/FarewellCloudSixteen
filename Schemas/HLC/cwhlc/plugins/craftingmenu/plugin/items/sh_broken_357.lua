local ITEM = Clockwork.item:New();

ITEM.name = "Broken 357 Magnum";
ITEM.model = "models/weapons/w_357.mdl";
ITEM.weight = 2;
ITEM.category = "Materials";
ITEM.description = "A small pistol, the coated silver is rusting away.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();