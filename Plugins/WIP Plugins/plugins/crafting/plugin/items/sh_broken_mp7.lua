local ITEM = Clockwork.item:New();

ITEM.name = "Broken MP7";
ITEM.value = "Valuable";
ITEM.model = "models/weapons/w_smg1.mdl";
ITEM.weight = 2.5;
ITEM.category = "Materials";
ITEM.description = "A small pistol coated in a dull grey.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();