local PLUGIN = PLUGIN;

-- Called when the Clockwork shared variables are added.
function PLUGIN:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:Number("tied");
end;