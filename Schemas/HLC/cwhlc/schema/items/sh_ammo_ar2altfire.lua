local ITEM = Clockwork.item:New("ammo_base");

ITEM.name = "Pulse-Rifle Orb";
ITEM.classes = {CLASS_OWS, CLASS_EOW, CLASS_CMD};
ITEM.model = "models/items/combine_rifle_ammo01.mdl";
ITEM.weight = 1;
ITEM.uniqueID = "ammo_ar2altfire";
ITEM.business = true;
ITEM.ammoClass = "ar2altfire";
ITEM.ammoAmount = 1;
ITEM.description = "A strange item which an orange glow emitting from it.";

ITEM:Register();