--[[
	Product: "OpenAura".
--]]

local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

openAura:HookDataStream("SurfaceTexts2", function(data)
	PLUGIN.surfaceTexts = data;
end);

openAura:HookDataStream("SurfaceTextAdd2", function(data)
	PLUGIN.surfaceTexts[#PLUGIN.surfaceTexts + 1] = data;
end);

openAura:HookDataStream("SurfaceTextRemove2", function(data)
	for k, v in pairs(PLUGIN.surfaceTexts) do
		if (v.position == data) then
			PLUGIN.surfaceTexts[k] = nil;
		end;
	end;
end);