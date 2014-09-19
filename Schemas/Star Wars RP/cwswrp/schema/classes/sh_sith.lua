local CLASS = Clockwork.class:New("Sith");

CLASS.color = Color(150, 125, 100, 255);
CLASS.factions = {FACTION_JEDI};
CLASS.isDefault = true;
CLASS.wagesName = "Wages";
CLASS.description = "A Sith with special powers.";
CLASS.defaultPhysDesc = "A Sith in sith clothing.";

CLASS_SITH = CLASS:Register();