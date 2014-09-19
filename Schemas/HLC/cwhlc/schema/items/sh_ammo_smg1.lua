local ITEM = Clockwork.item:New("ammo_base");

ITEM.name = "SMG Bullets";
ITEM.classes = {CLASS_OWS, CLASS_EOW, CLASS_CMD};
ITEM.model = "models/items/boxmrounds.mdl";
ITEM.weight = 2;
ITEM.access = "V";
ITEM.uniqueID = "ammo_smg1";
ITEM.business = true;
ITEM.ammoClass = "smg1";
ITEM.ammoAmount = 30;
ITEM.description = "A heavy container filled with a lot of bullets.";

ITEM:Register();