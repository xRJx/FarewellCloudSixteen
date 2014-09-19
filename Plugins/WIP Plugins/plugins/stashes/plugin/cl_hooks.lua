local PLUGIN = PLUGIN;

-- Called when an entity's target ID HUD should be painted.
function PLUGIN:HUDPaintEntityTargetID(entity, info)
	local colorTargetID = Clockwork.option:GetColor("target_id");
	local colorWhite = Clockwork.option:GetColor("white");
	
	if (entity:GetClass() == "cw_stash") then
		info.y = Clockwork.kernel:DrawInfo("Stash", info.x, info.y, colorTargetID, info.alpha);
		info.y = Clockwork.kernel:DrawInfo("It can permanently hold stuff.", info.x, info.y, colorWhite, info.alpha);
	end;
end;

-- Called when an entity's menu options are needed.
function PLUGIN:GetEntityMenuOptions(entity, options)
	if (entity:GetClass() == "cw_stash") then
		options["Open"] = "cwContainerOpen";
	end;
end;