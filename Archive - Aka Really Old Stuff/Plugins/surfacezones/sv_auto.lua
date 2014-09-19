--[[
	Name: sh_info.lua.
	Author: LauScript.
--]]

local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

-- This just adds a nice tag so the developer (me, Spencer) can see if you're using the script, I like to see who uses my stuff. All it does is add a tag to the server.
function PLUGIN:Initialize()
	if (!string.find(GetConVarString('sv_tags'), ",sf_plguin")) then
		RunConsoleCommand('sv_tags', GetConVarString('sv_tags')..",sf_plguin");
	end
	
	if (!string.find(GetConVarString('sv_tags'), "sf_surfacezones")) then
		RunConsoleCommand('sv_tags', GetConVarString('sv_tags')..",sf_surfacezones");
	end
end

-- A function to load the area names.
function PLUGIN:LoadSurfaceZones()
	self.surfaceZones = openAura:RestoreSchemaData( "plugins/surfacezones/"..game.GetMap() );
end;

-- A function to save the area names.
function PLUGIN:SaveSurfaceZones()
	openAura:SaveSchemaData("plugins/surfacezones/"..game.GetMap(), self.surfaceZones);
end;