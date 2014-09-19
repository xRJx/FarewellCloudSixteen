--[[
	© 2012 Slidefuse LLC
	This plugin is released under the MIT license. Do whatever!
--]]

local PLUGIN = PLUGIN

openAura:IncludePrefixed("sh_auto.lua")

-- This just adds a nice tag so the developer (me, Spencer) can see if you're using the script, I like to see who uses my stuff. All it does is add a tag to the server.
function PLUGIN:Initialize()
	if (!string.find(GetConVarString('sv_tags'), ",sf_plguin")) then
		RunConsoleCommand('sv_tags', GetConVarString('sv_tags')..",sf_plguin");
	end
	
	if (!string.find(GetConVarString('sv_tags'), "sf_moods")) then
		RunConsoleCommand('sv_tags', GetConVarString('sv_tags')..",sf_moods");
	end
end