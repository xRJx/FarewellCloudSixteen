include("shared.lua");

--local glowMaterial = Material("sprites/glow04_noz");

local X = 1000
local Y = -700
local W = 350
local H = 175

--[[function ENT:Draw()
	local isPoliceOnly = (self.policeOnly == true);
	local glowColor = Color(0, 0, 0, 0);
	
	local position = self:GetPos();
	local forward = self:GetForward() * 0.5;
	local right = self:GetRight() * -75.5;
	local up1 = self:GetUp() * 5;
	local up2 = self:GetUp() * 101;
	
	cam.Start3D( EyePos(), EyeAngles() );
		if (isPoliceOnly) then
			glowColor = Color(255, 150, 0, 255);
		else
			glowColor = Color(0, 255, 0, 255);
		end;
		render.SetMaterial(glowMaterial);
		render.DrawSprite(position + forward + right + up1, 50, 50, glowColor);
		render.DrawSprite(position + forward + right + up2, 50, 50, glowColor);
	cam.End3D();
end;]]--