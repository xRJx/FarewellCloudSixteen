--[[
	Slidefuse LLC Made This. http://slidefuse.com
	Have fun with your crap openAura
--]]

local PLUGIN = PLUGIN;

function PLUGIN:GetEntityMenuOptions(entity, options)
	if (entity:GetClass() == "prop_ragdoll") then
		options["Loot"] = "aura_loot";
	end
end