--[[
	  ___   _     ___ _   _   _  ___ ___ _  _ ___ 
	 / _ \ /_\   | _ \ | | | | |/ __|_ _| \| / __|
	| (_) / _ \  |  _/ |_| |_| | (_ || || .` \__ \
	 \___/_/ \_\ |_| |____\___/ \___|___|_|\_|___/
	LEG DAMAGE                                              
--]]

local openAura = openAura;
local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sv_hooks.lua");
openAura:IncludePrefixed("sh_auto.lua");

openAura.config:Add("damage_threshold", 10);
openAura.config:Add("damage_scale_time", 0.75);

function PLUGIN:Initialize()
	if (!string.find(GetConVarString('sv_tags'), ",sf_plguin")) then
		RunConsoleCommand('sv_tags', GetConVarString('sv_tags')..",sf_plguin");
	end

	if (!string.find(GetConVarString('sv_tags'), "sf_legdmg")) then
		RunConsoleCommand('sv_tags', GetConVarString('sv_tags')..",sf_legdmg");
	end
end