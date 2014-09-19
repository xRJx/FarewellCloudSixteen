local ITEM = Clockwork.item:New("clothes_base");

ITEM.name = "Masked Uniform";
ITEM.weight = 4;
ITEM.access = "m";
ITEM.category = "Clothing"
ITEM.business = true;
ITEM.protection = 0.4;
ITEM.replacement = "models/pmc/pmc_4/pmc__07.mdl";
ITEM.description = "A tactical uniform with an insignia on the sleeve.";

ITEM:Register();