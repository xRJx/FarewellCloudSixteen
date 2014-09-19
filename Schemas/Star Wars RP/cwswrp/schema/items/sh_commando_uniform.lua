local ITEM = Clockwork.item:New("clothes_base");

ITEM.name = "Commando Armor";
ITEM.weight = 4;
ITEM.access = "m";
ITEM.category = "Clone Armor";
ITEM.business = true;
ITEM.protection = 0.5;
ITEM.replacement = "models/sgg/starwars/clone_commando_mp_a.mdl";
ITEM.description = "Clone armor designed for commando operations.";

ITEM:Register();