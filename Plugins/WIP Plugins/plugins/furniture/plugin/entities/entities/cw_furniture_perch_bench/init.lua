include("shared.lua");

AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");

function ENT:Initialize()
	self:SetModel("models/props_trainstation/BenchOutdoor01a.mdl");
	
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetMoveType(MOVETYPE_VPHYSICS);
	self:SetSolid(SOLID_VPHYSICS);
	self:SetUseType(SIMPLE_USE);

	local physicsObject = self:GetPhysicsObject();
	if (IsValid(physicsObject)) then
		physicsObject:Wake();
		physicsObject:EnableMotion(true);
	end;
end;