local ITEM = Clockwork.item:New();

ITEM.name = "Broken Shotgun";
ITEM.model = "models/weapons/w_shotgun.mdl";
ITEM.weight = 4;
ITEM.category = "Materials";
ITEM.description = "A moderately sized weapon coated in a dull grey.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();