--[[
	Name: sh_coms.lua.
	Author: TJjokerR.
--]]

local PLUGIN = PLUGIN;

-- Called when the command has been run.
COMMAND = openAura.command:New();
COMMAND.tip = "Add an area containing certain radiation levels.";
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

		openAura.player:Notify(player, "You have added the minimum radiation point, now add the maximum radiation point.");
	else
		areaPointData.maximum = trace.HitPos;
		
		local data = {
			minimum = areaPointData.minimum,
			maximum = areaPointData.maximum
		};
		
		PLUGIN.radiationZones[#PLUGIN.radiationZones + 1] = data;
		PLUGIN:SaveRadiationAreas();
		
		openAura.player:Notify(player, "You have added a radio-active area.");
		
		player.areaPointData = nil;
	end;
end;

openAura.command:Register(COMMAND, "RadiationAreaAdd");

COMMAND = openAura.command:New();
COMMAND.tip = "Remove a radiation contaminated area.";
COMMAND.text = "<none>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local position = player:GetEyeTraceNoCursor().HitPos;
	local removed = 0;
	
	for k, v in pairs(PLUGIN.radiationZones) do
		if (v.minimum:Distance(position) <= 256
		or v.maximum:Distance(position) <= 256
		or v.position:Distance(position) <= 256) then
			PLUGIN.radiationZones[k] = nil;
			
			removed = removed + 1;
		end;
	end;
	
	if (removed > 0) then
		if (removed == 1) then
			openAura.player:Notify(player, "You have removed "..removed.." radiation contaminated areas.");
		else
			openAura.player:Notify(player, "You have removed "..removed.." radiation contaminated areas.");
		end;
		
		PLUGIN:SaveRadiationAreas();
	else
		openAura.player:Notify(player, "There were no radiation contaminated areas near this position.");
	end;
end;

openAura.command:Register(COMMAND, "RadiationAreaRemove");