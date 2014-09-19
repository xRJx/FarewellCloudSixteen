local ITEM = Clockwork.item:New("clothes_base");

ITEM.name = "Infantry Armor";
ITEM.weight = 4;
ITEM.access = "m";
ITEM.category = "Clone Armor";
ITEM.business = true;
ITEM.protection = 0.5;
ITEM.replacement = "models/sgg/starwars/clonetrooper.mdl";
ITEM.description = "Clone armor designed for infantry combat.";

ITEM:Register();