--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local COMMAND = Clockwork.command:New("Jam");
COMMAND.tip = "Make someone a jammer.";
COMMAND.text = "<string Name> <string Value>";
COMMAND.access = "s";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local value = Clockwork.player:FindByID(arguments[2]);
	
	if (target) then
		target:SetSharedVar("jammerActive", value);
		Clockwork.player:Notify(player, arguments[1].."'s jammerActive variable was set to "..arguments[2]);
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
	end;
end;

COMMAND:Register();