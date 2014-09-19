--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;
PLUGIN.ball = nil;

-- Called after entities have initlialized
function PLUGIN:InitPostEntity()
	self.ball = ClientsideModel("models/hunter/misc/sphere025x025.mdl", RENDERGROUP_OPAQUE)
	self.ball:SetModelScale(Vector(0.15, 0.15, 0.15));
	self.ball:SetPos(Vector(0, 0, 0));
	self.ball:SetMaterial("models/debug/debugwhite");
end;

function PLUGIN:Think()
	if (IsValid(self.ball)) then
		self.ball:SetPos(LocalPlayer():GetEyeTrace().HitPos);
		
		local disp = 1;
		if (LocalPlayer():GetEyeTrace().Entity:IsPlayer()) then
			disp = 0;
		end;
		
		self.ball:SetColor(Color(255, 0, 0, math.Clamp((125-(LocalPlayer():GetPos():Distance(self.ball:GetPos())))*disp, 0, 255)));
	end;
end;