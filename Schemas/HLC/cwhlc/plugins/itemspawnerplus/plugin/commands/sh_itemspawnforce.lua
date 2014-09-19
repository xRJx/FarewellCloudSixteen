local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("ItemSpawnForce");
COMMAND.tip = "Forces a random item to be spawned at a random item spawn.";
COMMAND.text = "<int Repeats>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local count = 0;
	local repeats = tonumber(arguments[1]);
	
	while (count < repeats) do
		count = count + 1;
		PLUGIN:ForceItemSpawn(player, count);
	end;
end;

COMMAND:Register();