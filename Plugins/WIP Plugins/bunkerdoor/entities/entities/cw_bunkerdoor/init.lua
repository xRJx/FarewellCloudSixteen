local Clockwork = Clockwork;

include("shared.lua");

AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");

-- Called when the entity initializes.
function ENT:Initialize()
	self:SetModel("models/props_silo/silo_door01.mdl") 
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:EnableMotion(false);
	end;
end

-- Called when the entity is spawned.
function ENT:SpawnFunction( ply, tr )
    if ( !tr.Hit ) then return end
    local ent1 = ents.Create("cw_bunkerdoor")
    ent1:SetPos(tr.HitPos);
	ent1:SetAngles( Angle(0, ply:EyeAngles().yaw + 90, 0) );
    ent1:Spawn()
    ent1:Activate()
	
	local ent2 = ents.Create("cw_bunkerdoor")
    ent2:SetPos(tr.HitPos + Angle(10, 0, 0) );
	ent2:SetAngles( Angle(0, ply:EyeAngles().yaw + 270, 0) );
    ent2:Spawn()
    ent2:Activate()

    return ent
end
ents.Create("prop_physics")

function ENT:OnRemove()
end

function ENT:Think()
end

function ENT:Use(player)
	local idle = self:LookupSequence("unlock");
	local open = self:LookupSequence("lock");
	
	player:Freeze(true);
	player:SetNWBool( "sFadeIn", true );
	
	self:EmitSound("buttons/lever4.wav", 60, 200);
	self:SetSequence(open);
	
	-- Thank goodness for Audacity!
	timer.Simple(0.6, function()
		self:EmitSound("doors/gate_move1.wav", 60);
	end);
	
	timer.Simple(3.12, function()
		self:EmitSound("doors/heavy_metal_stop1.wav");
		self:SetSequence(idle);
		player:Freeze(false);
	end);
	
	timer.Simple(3.32, function()
		player:SetNWBool( "sFadeIn", false );
	end)
end