local PLUGIN = PLUGIN;

-- Called when an entity's target ID HUD should be painted.
function PLUGIN:HUDPaintEntityTargetID(entity, info)
	local colorTargetID = Clockwork.option:GetColor("target_id");
	local colorWhite = Clockwork.option:GetColor("white");
	
	if (entity:GetClass() == "cw_safebox") then
		info.y = Clockwork.kernel:DrawInfo("Safebox", info.x, info.y, colorTargetID, info.alpha);
		info.y = Clockwork.kernel:DrawInfo("It can permanently hold stuff.", info.x, info.y, colorWhite, info.alpha);
	end;
end;

--[[ Called when an entity's menu options are needed.
function PLUGIN:GetEntityMenuOptions(entity, options)
	if (entity:GetClass() == "cw_safebox") then
		options["Open"] = "cwContainerOpen";
	end;
end;]]--