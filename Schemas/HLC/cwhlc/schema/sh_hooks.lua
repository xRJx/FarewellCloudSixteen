-- Called when the Clockwork shared variables are added.
function Schema:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:String("customClass");
	playerVars:String("citizenID", true);
	playerVars:Number("clothes", true);
end;