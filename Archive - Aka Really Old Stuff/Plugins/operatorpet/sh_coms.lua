--[[
	Slidefuse LLC Made This. http://slidefuse.com
	Have fun with your crap openAura
--]]

local PLUGIN = PLUGIN;

local COMMAND = openAura.command:New();
COMMAND.tip = "Allows operators and above to easily give players P, E and T flags.";
COMMAND.text = "<string Name> [bool NoToolgun]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local flags = "pet"
	if (arguments[2]) then
		flags = "pe"
	end

	local target = openAura.player:Get(arguments[1])
	if (target) then
		openAura.player:GiveFlags(target, flags)
		openAura.player:NotifyAll(player:Name().." gave "..target:Name().." '"..flags.."' flags.")
	else
		openAura.player:Notify(player, "That is not a valid character!")
	end
end;

openAura.command:Register(COMMAND, "CharGivePET");