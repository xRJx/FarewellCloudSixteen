local ITEM = Clockwork.item:New("ammo_base");

ITEM.name = "Shotgun Shells";
ITEM.classes = {CLASS_OWS, CLASS_EOW, CLASS_CMD};
ITEM.model = "models/items/boxbuckshot.mdl";
ITEM.weight = 1;
ITEM.uniqueID = "ammo_buckshot";
ITEM.business = true;
ITEM.ammoClass = "buckshot";
ITEM.ammoAmount = 16;
ITEM.description = "A red box filled with shells.";

ITEM:Register();