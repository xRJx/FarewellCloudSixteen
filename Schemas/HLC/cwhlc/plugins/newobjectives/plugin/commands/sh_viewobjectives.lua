local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("ViewObjectives");
COMMAND.tip = "View the Overwatch objectives.";
COMMAND.flags = CMD_DEFAULT;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (Schema:PlayerIsCombine(player)) then
		Clockwork.datastream:Start(player, "ViewObjectives", PLUGIN.combineObjectives);
	else
		Clockwork.player:Notify(player, "You are not the Combine!");
	end;
end;

COMMAND:Register();