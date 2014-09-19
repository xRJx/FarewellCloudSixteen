include("shared.lua");

AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");

-- Called when the entity initializes.
function ENT:Initialize()
	self:SetModel("models/hunter/tubes/tube2x2x8.mdl");
	self:SetRenderMode(RENDERMODE_TRANSALPHA);
	self:SetColor(Color(0, 0, 0, 0));
	self:SetMoveType(MOVETYPE_VPHYSICS);
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetUseType(SIMPLE_USE);
	self:SetSolid(SOLID_VPHYSICS);
	
	local physicsObject = self:GetPhysicsObject();
	
	if ( IsValid(physicsObject) ) then
		physicsObject:Wake();
		physicsObject:EnableMotion(false);
	end;
	
	self:SpawnCitadel();
end;

function ENT:SpawnCitadel()
	local ent = ents.Create("prop_physics");
    ent:SetPos(self:GetPos() + self:GetUp() * 75);
	ent:SetModel("models/props_combine/combine_citadel001.mdl");
	ent:SetModelScale(ent:GetModelScale() * 0.0625, 0);
	ent:SetParent(self);
    ent:Spawn();
    ent:Activate();
end;