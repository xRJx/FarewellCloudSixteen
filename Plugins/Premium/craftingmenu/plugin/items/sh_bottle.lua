local ITEM = Clockwork.item:New();

ITEM.name = "Bottle";
ITEM.model = "models/props_junk/GlassBottle01a.mdl";
ITEM.weight = 0.2;
ITEM.category = "Materials";
ITEM.description = "A round glass bottle";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();
