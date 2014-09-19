--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

include("shared.lua");

-- Called when the target ID HUD should be painted.
function ENT:HUDPaintTargetID(x, y, alpha)
	local colorTargetID = Clockwork.option:GetColor("target_id");
	local colorWhite = Clockwork.option:GetColor("white");
	
	y = Clockwork.kernel:DrawInfo("Paper", x, y, colorTargetID, alpha);
	
	if (self:GetDTBool(0)) then
		y = Clockwork.kernel:DrawInfo("It has been written on.", x, y, colorWhite, alpha);
	else
		y = Clockwork.kernel:DrawInfo("It is blank.", x, y, colorWhite, alpha);
	end;
end;

-- Called when the entity should draw.
function ENT:Draw()
	self:DrawModel();
end;