local PLUGIN = PLUGIN;

-- Called when an entity's menu options are needed.
function PLUGIN:GetEntityMenuOptions(entity, options)
	if ( PLUGIN:isFurniture(entity) ) then
		if ( entity:GetNetworkedBool("isLocked", true) ) then
			options["Unlock"] = "cw_furnitureUnlock";
		else
			options["Lock"] = "cw_furnitureLock";
		end;
	end;
end;