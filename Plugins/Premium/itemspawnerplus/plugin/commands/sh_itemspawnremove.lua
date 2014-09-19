local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("ItemSpawnRemove");
COMMAND.tip = "Remove an item spawn at your target position.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local position = player:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 32);
	local itemSpawnAmount = 0;
	
	for k, v in pairs(itemSpawns) do
		if (v:Distance(position) <= 256) then
			itemSpawnAmount = itemSpawnAmount + 1;
			
			itemSpawns[k] = nil;
		end;
	end;
	
	for k, v in pairs(ents.GetAll()) do
		if (v:GetClass() == "cw_spawnmarker") then
			if (v:GetPos():Distance(position) <= 256) then
				v:Remove();
			end;
		end;
	end;
	
	if (itemSpawnAmount > 0) then
		if (itemSpawnAmount == 1) then
			Clockwork.player:Notify(player, "You have removed "..itemSpawnAmount.." item spawn.");
		else
			Clockwork.player:Notify(player, "You have removed "..itemSpawnAmount.." item spawns.");
		end;
	else
		Clockwork.player:Notify(player, "There are no item spawns near this position.");
	end;
	
	PLUGIN:SaveItemSpawns();
	PLUGIN:SaveItemSpawnMarkers();
end;

COMMAND:Register();