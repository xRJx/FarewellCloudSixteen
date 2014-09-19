local CLASS = Clockwork.class:New("Jedi");

CLASS.color = Color(150, 125, 100, 255);
CLASS.factions = {FACTION_JEDI};
CLASS.isDefault = true;
CLASS.wagesName = "Wages";
CLASS.description = "A Jedi with special powers.";
CLASS.defaultPhysDesc = "A Jedi in jedi clothing.";

CLASS_JEDI = CLASS:Register();