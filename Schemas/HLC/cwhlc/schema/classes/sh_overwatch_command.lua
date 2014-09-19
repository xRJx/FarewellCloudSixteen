local CLASS = Clockwork.class:New("Elite Overwatch Commander");

CLASS.color = Color(150, 50, 50, 255);
CLASS.wages = 60;
CLASS.factions = {FACTION_OTA};
CLASS.wagesName = "Supplies";
CLASS.description = "An elite transhuman Overwatch commander produced by the Combine.";
CLASS.defaultPhysDesc = "Wearing shiny Overwatch gear.";

CLASS_CMD = CLASS:Register();