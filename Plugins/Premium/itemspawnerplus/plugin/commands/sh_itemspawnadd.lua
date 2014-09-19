local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("ItemSpawnAdd");
COMMAND.tip = "Add an item spawn at your target position.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local position = player:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 32);
	local entity = ents.Create("cw_spawnmarker");
	entity:SetPos(position);
	entity:Spawn();
	
	itemSpawns[#itemSpawns + 1] = position;
	
	PLUGIN:SaveItemSpawns();
	PLUGIN:SaveItemSpawnMarkers();
	
	Clockwork.player:Notify(player, "You have added an item spawn.");
end;

COMMAND:Register();