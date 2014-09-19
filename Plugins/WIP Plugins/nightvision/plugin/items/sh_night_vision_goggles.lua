local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Night Vision Goggles";
ITEM.model = "models/gibs/shield_scanner_gib1.mdl";
ITEM.weight = 1.5;
ITEM.cost = 150;
ITEM.uniqueID = "cw_night_vision_goggles";
ITEM.business = true;
ITEM.description = "A pair of goggles to allow perception in the dark.";

ITEM:Register();