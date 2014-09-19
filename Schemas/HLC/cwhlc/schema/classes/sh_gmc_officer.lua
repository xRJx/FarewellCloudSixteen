local CLASS = Clockwork.class:New("Officer");

CLASS.color = Color(150, 125, 100, 255);
CLASS.wages = 20;
CLASS.factions = {FACTION_GMC};
CLASS.wagesName = "Tokens";
CLASS.description = "An officer of the Global Military Coalition.";
CLASS.defaultPhysDesc = "Wearing a dirty uniform and a small satchel.";

CLASS_OFFICER = CLASS:Register();