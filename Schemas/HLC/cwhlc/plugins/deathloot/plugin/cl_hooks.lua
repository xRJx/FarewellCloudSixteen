local PLUGIN = PLUGIN;

function PLUGIN:GetEntityMenuOptions(entity, options)
	if (entity:GetClass() == "prop_ragdoll") then
		options["Loot"] = "cw_loot";
	end;
end;