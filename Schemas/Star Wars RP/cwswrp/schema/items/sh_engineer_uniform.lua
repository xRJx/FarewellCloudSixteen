local ITEM = Clockwork.item:New("clothes_base");

ITEM.name = "Engineer Armor";
ITEM.weight = 4;
ITEM.access = "m";
ITEM.category = "Clone Armor";
ITEM.business = true;
ITEM.protection = 0.5;
ITEM.replacement = "models/sgg/starwars/clonetrooper_501st.mdl";
ITEM.description = "Clone armor designed for engineering.";

ITEM:Register();