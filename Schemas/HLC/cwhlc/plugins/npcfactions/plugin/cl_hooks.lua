local PLUGIN = PLUGIN;

--[[ Called when an entity's menu options are needed.
function PLUGIN:GetEntityMenuOptions(entity, options)
	local class = entity:GetClass();
	
	if (class == "npc_combine_s" or class == "npc_metropolice") then
		options["Follow"] = "cw_npcFollowOption";
	end;
end;]]--