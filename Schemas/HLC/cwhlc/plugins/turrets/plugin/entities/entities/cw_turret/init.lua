local turretHealth = 5; -- The health of the turret.

include("shared.lua");

AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");

-- Called when the entity initializes.
function ENT:Initialize()
	self:SetModel("models/combine_turrets/floor_turret.mdl");
	self:SetRenderMode(RENDERMODE_TRANSALPHA);
	self:SetColor(Color(0, 0, 0, 0));
	self:SetMoveType(MOVETYPE_VPHYSICS);
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetUseType(SIMPLE_USE);
	self:SetSolid(SOLID_VPHYSICS);
	self:SetHealth(turretHealth); -- Sets the turret's health to the 'turretHealth' variable.
	
	local physicsObject = self:GetPhysicsObject();
	
	if ( IsValid(physicsObject) ) then
		physicsObject:Wake();
		physicsObject:EnableMotion(false);
	end;
end;

function ENT:SpawnTurret(player)
	local turret = ents.Create("npc_turret_floor"); -- Variable for spawning the turret NPC.
	
	turret:SetPos(self:GetPos()); -- Sets the turret's location to the entity's location.
	turret:SetAngles(self:GetAngles()); -- Sets the turret's angles to the entity's angles.
	turret:AddEntityRelationship(player, D_LI, 99); -- Makes the turret friendly towards the owner.
	
	turret:Spawn(); -- Initializes the turret.
	turret:Activate(); -- Extra initializations.
	
	self:SetParent(turret); -- Parents the turret to the entity.
end;

-- A function to explode the entity.
function ENT:Explode()
	local effectData = EffectData();
	
	effectData:SetStart( self:GetPos() );
	effectData:SetOrigin( self:GetPos() );
	effectData:SetScale(1);
	
	util.Effect("Explosion", effectData, true, true);
	
	self:EmitSound("physics/body/body_medium_impact_soft"..math.random(1, 7)..".wav");
end;

-- Called when the entity takes damage.
function ENT:OnTakeDamage(damageInfo)
	self:SetHealth( math.max(self:Health() - damageInfo:GetDamage(), 0) );
	
	if (self:Health() <= 0) then
		self:Explode();
		self:Remove();
	end;
end;