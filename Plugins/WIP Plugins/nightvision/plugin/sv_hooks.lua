local PLUGIN = PLUGIN;

-- Called at an interval while a player is connected.
function PLUGIN:PlayerThink(player, curTime, infoTable)
	player:HandleNightVisionGoggles();
end;