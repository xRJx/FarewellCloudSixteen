local Clockwork = Clockwork;

include("shared.lua");

AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");

-- Called when the entity initializes.
function ENT:Initialize()
	self:SetModel("models/props_silo/silo_door01.mdl") ;
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetMoveType(MOVETYPE_VPHYSICS);
	self:SetSolid(SOLID_VPHYSICS);
	self:SetUseType(SIMPLE_USE);
	local phys = self:GetPhysicsObject();
	if (phys:IsValid()) then
		phys:Wake();
		phys:EnableMotion(false);
	end;
end

-- Called when the entity is spawned.
function ENT:SpawnFunction( ply, tr, faction )
    if ( !tr.Hit ) then return end;
	
	print("SpawnFunction called!");
	
    --local ent1 = ents.Create("cw_bunkerdoor");
    self:SetPos(tr.HitPos);
	self:SetAngles( Angle(0, ply:EyeAngles().yaw + 90, 0) );
    self:Spawn();
    self:Activate();
	
	local ent2 = ents.Create("cw_bunkerdoor");
    ent2:SetPos(tr.HitPos + self:GetRight() * 10 );
	ent2:SetAngles( Angle(0, ply:EyeAngles().yaw + 270, 0) );
    ent2:Spawn();
    ent2:Activate();
	
	
		self:SetNWString("Parent-"..self:GetCreationID(), ent2);
		ent2:SetNWString("Parent-"..ent2:GetCreationID(), self);
	
		self:SetNWString("parentPos-"..self:GetCreationID(), ent2:GetPos());
		ent2:SetNWString("parentPos-"..ent2:GetCreationID(), self:GetPos());
	
		self:SetNWString("Faction-"..self:GetCreationID(), faction);
		ent2:SetNWString("Faction-"..ent2:GetCreationID(), faction);
	
	
	
    return ent
end

function ENT:OnRemove()
end

function ENT:Think()
end

function ENT:Use(player)
	--print("self-"..tostring(self));
	
	local trace = player:GetEyeTraceNoCursor();
	local target = trace.Entity;
	local parent = target:GetNWString("Parent-"..target:GetCreationID());
	local position = target:GetNWString("Parent-"..target:GetCreationID()):GetPos();
	
	target:SetNWString("parentPos-"..target:GetCreationID(), parent:GetPos());
	parent:SetNWString("parentPos-"..parent:GetCreationID(), target:GetPos());
	
	print( tostring(target:GetNWBool("isAdditional"..target:GetCreationID())) );
	
	--print ("parent-"..tostring(parent));
	
	local faction = player:GetFaction();
	local targetFaction = target:GetNWString("Faction-"..target:GetCreationID());
	
	if ( (faction == targetFaction) or (targetFaction == "") ) then
		local idle = self:LookupSequence("unlock");
		local open = self:LookupSequence("lock");
		
		player:Freeze(true);
		player:SetNWBool( "sFadeIn", true );
		
		self:EmitSound("buttons/lever4.wav", 60, 200);
		parent:EmitSound("buttons/lever4.wav", 60, 200);
		self:SetSequence(open);
		parent:SetSequence(open);
		
		timer.Simple(0.4, function()
			Clockwork.player:SetSafePosition(player, position + parent:GetRight() * -50);
		end);
		
		timer.Simple(0.5, function()
			self:EmitSound("doors/gate_move1.wav", 60);
			parent:EmitSound("doors/gate_move1.wav", 60);
		end);
		
		timer.Simple(3.11, function()
			self:EmitSound("doors/heavy_metal_stop1.wav");
			parent:EmitSound("doors/heavy_metal_stop1.wav");
			self:SetSequence(idle);
			parent:SetSequence(idle);
			
			player:Freeze(false);
		end);
		
		timer.Simple(3.31, function()
			player:SetNWBool( "sFadeIn", false );
		end)
	else
		Clockwork.player:Notify(player, "The handle doesn't seem to budge.");
	end;
end;