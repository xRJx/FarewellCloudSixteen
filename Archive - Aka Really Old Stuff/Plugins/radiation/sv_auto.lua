--[[
	Name: sh_info.lua.
	Author: TJjokerR.
--]]

local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

-- This just adds a nice tag so the developer can see if you're using the script, I like to see who uses my stuff. All it does is add a tag to the server.
function PLUGIN:Initialize()
	if (!string.find(GetConVarString('sv_tags'), ",sf_plguin")) then
		RunConsoleCommand('sv_tags', GetConVarString('sv_tags')..",sf_plguin");
	end
	
	if (!string.find(GetConVarString('sv_tags'), "sf_radiation")) then
		RunConsoleCommand('sv_tags', GetConVarString('sv_tags')..",sf_radiation");
	end
end

-- A function to load the area names.
function PLUGIN:LoadRadiationAreas()
	self.radiationZones = openAura:RestoreSchemaData( "plugins/radiationzones/"..game.GetMap() );
end;

-- A function to save the area names.
function PLUGIN:SaveRadiationAreas()
	openAura:SaveSchemaData("plugins/radiationzones/"..game.GetMap(), self.radiationZones);
end;

