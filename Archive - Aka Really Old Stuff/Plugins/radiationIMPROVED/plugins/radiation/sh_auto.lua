--[[
	Name: sh_auto.lua.
	Author: TJjokerR.
--]]

local PLUGIN = PLUGIN;
PLUGIN.radiationZones = {};

openAura.player:RegisterSharedVar("radiation", NWTYPE_NUMBER, true);

openAura:IncludePrefixed("sh_coms.lua");
openAura:IncludePrefixed("sv_hooks.lua");
openAura:IncludePrefixed("cl_hooks.lua");