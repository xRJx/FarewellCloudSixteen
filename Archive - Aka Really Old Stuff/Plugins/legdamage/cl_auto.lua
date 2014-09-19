--[[
	  ___   _     ___ _   _   _  ___ ___ _  _ ___ 
	 / _ \ /_\   | _ \ | | | | |/ __|_ _| \| / __|
	| (_) / _ \  |  _/ |_| |_| | (_ || || .` \__ \
	 \___/_/ \_\ |_| |____\___/ \___|___|_|\_|___/
	LEG DAMAGE                                              
--]]

local openAura = openAura;
local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

openAura.config:AddAuraWatch("damage_threshold", "The amount of damage for actions to be taken.");
openAura.config:AddAuraWatch("damage_scale_time", "How much the time to get up should be scaled by depending on damage.", 0.01, 10, 2);