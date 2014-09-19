local CLASS = Clockwork.class:New("Recruit");

CLASS.color = Color(150, 125, 100, 255);
CLASS.wages = 5;
CLASS.factions = {FACTION_GMC};
CLASS.wagesName = "Tokens";
CLASS.description = "A recruit of the Global Military Coalition.";
CLASS.defaultPhysDesc = "Wearing a dirty uniform and a small satchel.";

CLASS_RECRUIT = CLASS:Register();