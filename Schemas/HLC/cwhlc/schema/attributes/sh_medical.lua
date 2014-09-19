local ATTRIBUTE = Clockwork.attribute:New();

ATTRIBUTE.name = "Medical";
ATTRIBUTE.maximum = 75;
ATTRIBUTE.uniqueID = "med";
ATTRIBUTE.description = "Affects your overall medical skills, e.g: health gained from vials and kits.";
ATTRIBUTE.isOnCharScreen = true;

ATB_MEDICAL = Clockwork.attribute:Register(ATTRIBUTE);