local CLASS = Clockwork.class:New("Clone");

CLASS.color = Color(150, 125, 100, 255);
CLASS.factions = {FACTION_CLONE};
CLASS.isDefault = true;
CLASS.wagesName = "Wages";
CLASS.description = "A clone bred for war.";
CLASS.defaultPhysDesc = "A clone wearing a standard uniform.";

CLASS_CLONE = CLASS:Register();