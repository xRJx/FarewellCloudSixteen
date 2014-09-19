local PLUGIN = PLUGIN;

-- Called when an entity's target ID HUD should be painted.
function PLUGIN:HUDPaintEntityTargetID(entity, info)
	local colorTargetID = Clockwork.option:GetColor("target_id");
	
	if (entity:GetClass() == "cw_news_terminal") then
		info.y = Clockwork.kernel:DrawInfo("<:: News Terminal ::>", info.x, info.y, colorTargetID, info.alpha);
	end;
end;