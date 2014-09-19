local ITEM = Clockwork.item:New();

ITEM.name = "Broken MP7";
ITEM.model = "models/weapons/w_smg1.mdl";
ITEM.weight = 2.5;
ITEM.category = "Materials";
ITEM.description = "A compact weapon coated in a dark grey, it has a convenient handle.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();