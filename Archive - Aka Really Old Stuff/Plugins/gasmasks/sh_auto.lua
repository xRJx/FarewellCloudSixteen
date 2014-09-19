--[[
	Name: sh_auto.lua.
	Author: LauScript.
--]]

local PLUGIN = PLUGIN;

openAura.player:RegisterSharedVar("filterQuality", NWTYPE_NUMBER, true);

openAura:IncludePrefixed("sh_coms.lua");
openAura:IncludePrefixed("sv_hooks.lua");
openAura:IncludePrefixed("cl_hooks.lua");
