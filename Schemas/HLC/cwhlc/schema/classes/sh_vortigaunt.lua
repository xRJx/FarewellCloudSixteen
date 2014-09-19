local CLASS = Clockwork.class:New("Vortigaunt");

CLASS.color = Color(255, 200, 100, 255);
CLASS.factions = {FACTION_VORT};
CLASS.isDefault = true;
CLASS.wagesName = "Supplies";
CLASS.description = "An alien race not from this planet.";
CLASS.defaultPhysDesc = "A green looking thing with many eyes.";
	
CLASS_VORT = CLASS:Register();