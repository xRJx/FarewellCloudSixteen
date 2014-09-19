local Clockwork = Clockwork;

include("shared.lua");

AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");

-- Called when the entity initializes.
function ENT:Initialize()
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetMoveType(MOVETYPE_VPHYSICS);
	self:SetSolid(SOLID_VPHYSICS);
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:EnableMotion(false);
	end;
end;

-- Called when the entity is spawned.
function ENT:SpawnFunction(ply, tr, model, sound, idleAnim, openAnim)
    if ( !tr.Hit ) then return end
	self:SetModel(model);
    self:SetPos(tr.HitPos);
	self:SetAngles( Angle(0, ply:EyeAngles().yaw + 90, 0) );
    self:Spawn();
    self:Activate();
	
	local child = ents.Create("cw_teledoor");
	child:SetModel(model);
    child:SetPos(tr.HitPos + self:GetRight() * 10 );
	child:SetAngles( Angle(0, ply:EyeAngles().yaw + 270, 0) );
    child:Spawn();
    child:Activate();
	
	self:SetupVariables(model, sound, idleAnim, openAnim, child);
	child:SetupVariables(model, sound, idleAnim, openAnim, self);
	
    return ent
end;
ents.Create("prop_physics")

function ENT:OnRemove()
	self.LinkedEnt:Remove();
end;

function ENT:Think()
end;

function ENT:Use(player)
	player:Freeze(true);
	player:SetNWBool( "sFadeIn", true );
	self:EmitSound(self.UseSound);
	self:SetSequence(self:LookupSequence(self.OpenAnim));
	
	timer.Simple(1, function()
		Clockwork.player:SetSafePosition(player, self.LinkedEnt:GetPos() + self.LinkedEnt:GetRight() * -50);
	end);
	
	timer.Simple(2, function()
		self:SetSequence(self:LookupSequence(self.IdleAnim));
		player:Freeze(false);
		player:SetNWBool("sFadeIn", false);
	end);
end;

function ENT:SetupVariables(model, sound, idleAnim, openAnim, linkedEnt)
	self.Model = model;
	self.UseSound = sound;
	self.IdleAnim = idleAnim;
	self.OpenAnim = openAnim;
	self.LinkedEnt = linkedEnt;
end;