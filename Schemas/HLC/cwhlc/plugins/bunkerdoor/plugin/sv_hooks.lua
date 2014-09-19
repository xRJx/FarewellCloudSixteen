local PLUGIN = PLUGIN;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	PLUGIN:LoadBunkerDoors();
end;

-- Called just after data should be saved.
function PLUGIN:PostSaveData()
	PLUGIN:SaveBunkerDoors();
end;