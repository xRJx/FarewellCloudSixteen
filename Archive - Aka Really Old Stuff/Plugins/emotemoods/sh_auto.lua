--[[
	© 2012 Slidefuse LLC
	This plugin is released under the MIT license. Do whatever!
--]]

local PLUGIN = PLUGIN

PLUGIN.PersonalityTypes = {
	"Default",
	"Relaxed",
	"Headstrong",
	"Frustrated"
}

PLUGIN.LookupTable = {}

PLUGIN.LookupTable[ "Relaxed" ] = { 
	[ "idle" ] = "LineIdle01",
	[ "walk" ] = "walk_all_Moderate"
}

PLUGIN.LookupTable[ "Headstrong" ] = { 
	[ "idle" ] = "idle_subtle"
}

PLUGIN.LookupTable[ "Frustrated" ] = { 
	[ "idle" ] = "LineIdle02",
	[ "walk" ] = "pace_all",
}

openAura.player:RegisterSharedVar("emoteMood", NWTYPE_STRING)

openAura:IncludePrefixed("sh_coms.lua")
openAura:IncludePrefixed("sh_hooks.lua")

-- A function to get the current mood fo a player.
function PLUGIN:GetPlayerMood(player)
	if (player:GetSharedVar("emoteMood") != "") then
		return player:GetSharedVar("emoteMood")
	end

	return false
end