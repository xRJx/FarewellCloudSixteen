local CLASS = Clockwork.class:New("General");

CLASS.color = Color(150, 125, 100, 255);
CLASS.wages = 40;
CLASS.factions = {FACTION_GMC};
CLASS.wagesName = "Tokens";
CLASS.description = "A general of the Global Military Coalition.";
CLASS.defaultPhysDesc = "Wearing a dirty uniform and a small satchel.";

CLASS_GENERAL = CLASS:Register();