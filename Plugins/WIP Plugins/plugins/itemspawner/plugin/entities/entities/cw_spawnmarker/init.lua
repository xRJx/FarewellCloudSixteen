include("shared.lua");

AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");

function ENT:Initialize()
	self:SetModel("models/hunter/blocks/cube075x075x075.mdl");
	
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetMoveType(MOVETYPE_NONE);
	self:SetSolid(SOLID_NONE);
	self:SetUseType(SIMPLE_USE);
	self:SetRenderMode(RENDERMODE_NONE);
	self:DrawShadow(false);

	local physicsObject = self:GetPhysicsObject();
	if (IsValid(physicsObject)) then
		physicsObject:Wake();
		physicsObject:EnableMotion(false);
	end;
end;