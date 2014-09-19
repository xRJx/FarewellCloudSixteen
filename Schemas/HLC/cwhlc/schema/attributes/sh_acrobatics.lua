local ATTRIBUTE = Clockwork.attribute:New();

ATTRIBUTE.name = "Acrobatics";
ATTRIBUTE.maximum = 75;
ATTRIBUTE.uniqueID = "acr";
ATTRIBUTE.description = "Affects the overall height at which you can jump.";
ATTRIBUTE.isOnCharScreen = true;

ATB_ACROBATICS = Clockwork.attribute:Register(ATTRIBUTE);