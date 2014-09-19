local CLASS = Clockwork.class:New("Survivor");

CLASS.color = Color(150, 125, 100, 255);
CLASS.factions = {FACTION_SURVIVOR};
CLASS.isDefault = true;
CLASS.wagesName = "Tokens";
CLASS.description = "A survivor of the incident apocalypse.";
CLASS.defaultPhysDesc = "Wearing dirty clothes.";

CLASS_SURVIVOR = CLASS:Register();