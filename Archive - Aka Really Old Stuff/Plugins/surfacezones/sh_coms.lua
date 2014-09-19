--[[
	Name: sh_coms.lua.
	Author: LauScript.
--]]

local PLUGIN = PLUGIN;

-- Called when the command has been run.
COMMAND = openAura.command:New();
COMMAND.tip = "Add a surface area that can hurt the player.";
COMMAND.text = "<none>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local areaPointData = player.areaPointData;
	local trace = player:GetEyeTraceNoCursor();
	
	if (!areaPointData) then
		player.areaPointData = {
			minimum = trace.HitPos
		};

		openAura.player:Notify(player, "You have added point A of the surface area, now add point B.");
	else
		areaPointData.maximum = trace.HitPos;
		
		local data = {
			minimum = areaPointData.minimum,
			maximum = areaPointData.maximum
		};
		
		PLUGIN.surfaceZones[#PLUGIN.surfaceZones + 1] = data;
		PLUGIN:SaveSurfaceZones();
		
		openAura.player:Notify(player, "You have added a surface zone.");
		
		player.areaPointData = nil;
	end;
end;

openAura.command:Register(COMMAND, "SurfaceZoneAdd");

COMMAND = openAura.command:New();
COMMAND.tip = "Remove a surface zone.";
COMMAND.text = "<none>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local position = player:GetEyeTraceNoCursor().HitPos;
	local removed = 0;
	
	for k, v in pairs(PLUGIN.surfaceZones) do
		if (v.minimum:Distance(position) <= 256
		or v.maximum:Distance(position) <= 256
		or v.position:Distance(position) <= 256) then
			PLUGIN.surfaceZones[k] = nil;
			
			removed = removed + 1;
		end;
	end;
	
	if (removed > 0) then
		if (removed == 1) then
			openAura.player:Notify(player, "You have removed "..removed.." surface zone.");
		else
			openAura.player:Notify(player, "You have removed "..removed.." surface zones.");
		end;
		
		PLUGIN:SaveSurfaceZones();
	else
		openAura.player:Notify(player, "There were no surface zones near this position.");
	end;
end;

openAura.command:Register(COMMAND, "SurfaceZoneRemove");