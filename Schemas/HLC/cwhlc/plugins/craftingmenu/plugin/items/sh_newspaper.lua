local ITEM = Clockwork.item:New();

ITEM.name = "Newspaper";
ITEM.model = "models/props_junk/garbage_newspaper001a.mdl";
ITEM.weight = 0.4;
ITEM.category = "Materials";
ITEM.description = "A worn out newspaper. Some words are still readable.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();