local CLASS = Clockwork.class:New("Overwatch Hunter");

CLASS.color = Color(150, 50, 50, 255);
CLASS.factions = {FACTION_SYNTH};
CLASS.description = "An Overwatch hunter produced by the Combine.";
CLASS.defaultPhysDesc = "A blue synth with three legs.";

CLASS_HUNT = CLASS:Register();