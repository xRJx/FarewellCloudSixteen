local ITEM = Clockwork.item:New("ammo_base");

ITEM.name = "Crossbow Bolts";
ITEM.model = "models/items/crossbowrounds.mdl";
ITEM.access = "V";
ITEM.weight = 2;
ITEM.uniqueID = "ammo_xbowbolt";
ITEM.business = false;
ITEM.ammoClass = "xbowbolt";
ITEM.ammoAmount = 4;
ITEM.description = "A set of iron bolts, the coating is rusting away.";

ITEM:Register();