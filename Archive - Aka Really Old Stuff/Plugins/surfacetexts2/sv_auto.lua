--[[
	Product: "OpenAura".
--]]

local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

-- A function to load the surface texts.
function PLUGIN:LoadSurfaceTexts()
	self.surfaceTexts = openAura:RestoreSchemaData( "plugins/texts3/"..game.GetMap() );
end;

-- A function to save the surface texts.
function PLUGIN:SaveSurfaceTexts()
	openAura:SaveSchemaData("plugins/texts3/"..game.GetMap(), self.surfaceTexts);
end;