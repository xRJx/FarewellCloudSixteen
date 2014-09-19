local ITEM = Clockwork.item:New("ammo_base");

ITEM.name = "9mm Pistol Bullets";
ITEM.classes = {CLASS_OWS, CLASS_EOW, CLASS_CMD};
ITEM.model = "models/items/boxsrounds.mdl";
ITEM.weight = 1;
ITEM.access = "V";
ITEM.uniqueID = "ammo_pistol";
ITEM.business = true;
ITEM.ammoClass = "pistol";
ITEM.ammoAmount = 20;
ITEM.description = "A container filled with bullets and 9mm printed on the side.";

ITEM:Register();