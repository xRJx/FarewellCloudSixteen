local CLASS = Clockwork.class:New("Overwatch Soldier");

CLASS.color = Color(150, 50, 50, 255);
CLASS.wages = 40;
CLASS.factions = {FACTION_OTA};
CLASS.skin = 1;
CLASS.wagesName = "Supplies";
CLASS.description = "A transhuman Overwatch soldier produced by the Combine.";
CLASS.defaultPhysDesc = "Wearing dirty Overwatch gear.";

CLASS_OWS = CLASS:Register();