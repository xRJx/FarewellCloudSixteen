local ITEM = Clockwork.item:New();

ITEM.name = "Broken 9mm Pistol";
ITEM.model = "models/weapons/w_pistol.mdl";
ITEM.weight = 1;
ITEM.category = "Materials";
ITEM.description = "A small pistol coated in a dull grey.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();