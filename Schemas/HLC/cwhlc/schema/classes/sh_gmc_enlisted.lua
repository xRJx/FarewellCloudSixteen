local CLASS = Clockwork.class:New("Enlisted Soldier");

CLASS.color = Color(150, 125, 100, 255);
CLASS.wages = 10;
CLASS.factions = {FACTION_GMC};
CLASS.wagesName = "Tokens";
CLASS.description = "An enlisted soldier of the Global Military Coalition.";
CLASS.defaultPhysDesc = "Wearing a dirty uniform and a small satchel.";

CLASS_ENLISTED = CLASS:Register();