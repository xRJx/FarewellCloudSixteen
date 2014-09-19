include("shared.lua");

AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");

-- Called when the entity initializes.
function ENT:Initialize()
	self:SetModel("models/props_combine/breenconsole.mdl");
	
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

-- Called when the entity is used.
function ENT:Use(activator)
	Clockwork.datastream:Start(activator, "ViewNews");
end;