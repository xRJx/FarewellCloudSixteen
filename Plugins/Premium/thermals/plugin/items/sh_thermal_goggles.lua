local ITEM = Clockwork.item:New("weapon_base");

ITEM.name = "Thermal Goggles";
ITEM.model = "models/gibs/shield_scanner_gib1.mdl";
ITEM.weight = 0.5;
ITEM.cost = 175;
ITEM.uniqueID = "cw_thermal_goggles";
ITEM.business = false;
ITEM.description = "A pair of goggles to allow the perception of heat signatures.";

ITEM:Register();
