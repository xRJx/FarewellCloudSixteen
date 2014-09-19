--[[
	Product: "OpenAura".
--]]

local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

openAura:HookDataStream("SurfaceTexts", function(data)
	PLUGIN.surfaceTexts = data;
end);

openAura:HookDataStream("SurfaceTextAdd", function(data)
	PLUGIN.surfaceTexts[#PLUGIN.surfaceTexts + 1] = data;
end);

openAura:HookDataStream("SurfaceTextRemove", function(data)
	for k, v in pairs(PLUGIN.surfaceTexts) do
		if (v.position == data) then
			PLUGIN.surfaceTexts[k] = nil;
		end;
	end;
end);