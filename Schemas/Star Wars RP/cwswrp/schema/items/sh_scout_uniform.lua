local ITEM = Clockwork.item:New("clothes_base");

ITEM.name = "Scout Armor";
ITEM.weight = 4;
ITEM.access = "m";
ITEM.category = "Clone Armor";
ITEM.business = true;
ITEM.protection = 0.5;
ITEM.replacement = "models/sgg/starwars/clonetrooper_gree.mdl";
ITEM.description = "Clone armor designed for scouting.";

ITEM:Register();