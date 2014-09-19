--[[
	Name: sh_info.lua.
	Author: TJjokerR.
--]]

local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

-- A function to load the area names.
function PLUGIN:LoadRadiationAreas()
	self.radiationZones = openAura:RestoreSchemaData( "plugins/radiationzones/"..game.GetMap() );
end;

-- A function to save the area names.
function PLUGIN:SaveRadiationAreas()
	openAura:SaveSchemaData("plugins/radiationzones/"..game.GetMap(), self.radiationZones);
end;