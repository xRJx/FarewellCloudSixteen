--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local COMMAND = Clockwork.command:New("PlyRemoveSeverWhitelist");
COMMAND.tip = "Remove a player from a server whitelist.";
COMMAND.text = "<string Name> <string ID>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID( arguments[1] )
	local identity = string.lower( arguments[2] );
	
	if (target) then
		if (target:GetData("serverwhitelist")) then
			if (!target:GetData("serverwhitelist")[identity]) then
				Clockwork.player:Notify(player, target:Name().." is not on the '"..identity.."' server whitelist!");
				
				return;
			else
				target:GetData("serverwhitelist")[identity] = nil;
			end;
		end;
		
		Clockwork.player:SaveCharacter(target);
		
		Clockwork.player:NotifyAll(player:Name().." has removed "..target:Name().." from the '"..identity.."' server whitelist.");
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
	end;
end;

COMMAND:Register();