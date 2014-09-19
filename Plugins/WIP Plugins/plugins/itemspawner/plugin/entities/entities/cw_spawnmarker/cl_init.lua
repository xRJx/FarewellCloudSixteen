include("shared.lua")

function ENT:Draw()
	self:DrawModel();
	self:SetColor( Color(0, 0, 0, 0) )
end;