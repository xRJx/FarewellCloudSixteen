local Clockwork = Clockwork;

include("shared.lua");

AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");

-- Called when the entity initializes.
function ENT:Initialize()
	self:SetModel("models/props_silo/silo_door01.mdl") ;
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetUseType(SIMPLE_USE);
	self:SetMoveType(MOVETYPE_VPHYSICS);
	self:SetSolid(SOLID_VPHYSICS);
	local phys = self:GetPhysicsObject();
	if (phys:IsValid()) then
		phys:Wake();
		phys:EnableMotion(false);
	end;
end;

-- Called when the entity is spawned.
function ENT:SpawnFunction(ply, tr, faction)
    if ( !tr.Hit ) then return end
	
    self:SetPos(tr.HitPos);
	self:SetAngles(Angle(0, ply:EyeAngles().y + 90, 0));
    self:Spawn();
    self:Activate();
	
	local ent = ents.Create("cw_bunkerdoor");
    ent:SetPos(tr.HitPos + self:GetRight() * -10);
	ent:SetAngles(Angle(0, ply:EyeAngles().y + -90, 0));
    ent:Spawn();
    ent:Activate();
	
	self:SetLinkedEnt(ent);
	ent:SetLinkedEnt(self);
	
	if (faction) then
		self:SetLinkedFaction(faction);
		ent:SetLinkedFaction(faction);
	end;

    return ent;
end;
ents.Create("prop_physics");

function ENT:OnRemove()
end;

function ENT:Think()
end;

function ENT:Use(player)
	local linkedFaction = self:GetLinkedFaction();
	
	if (player:GetFaction() == linkedFaction or linkedFaction == "") then
		local linkedEnt = self:GetLinkedEnt();
		local idle = self:LookupSequence("unlock");
		local open = self:LookupSequence("lock");
		
		player:Freeze(true);
		player:SetNWBool( "sFadeIn", true );
		
		self:EmitSound("buttons/lever4.wav", 60, 200);
		linkedEnt:EmitSound("buttons/lever4.wav", 60, 200);
		self:SetSequence(open);
		linkedEnt:SetSequence(open);
		
		timer.Simple(0.4, function()
			Clockwork.player:SetSafePosition(player, linkedEnt:GetPos() + linkedEnt:GetRight() * -50);
		end);
		
		timer.Simple(0.5, function()
			self:EmitSound("doors/gate_move1.wav", 60);
			linkedEnt:EmitSound("doors/gate_move1.wav", 60);
		end);
		
		timer.Simple(3.11, function()
			self:EmitSound("doors/heavy_metal_stop1.wav");
			linkedEnt:EmitSound("doors/heavy_metal_stop1.wav");
			self:SetSequence(idle);
			linkedEnt:SetSequence(idle);
			
			player:Freeze(false);
		end);
		
		timer.Simple(3.31, function()
			player:SetNWBool( "sFadeIn", false );
		end);
	else
		Clockwork.player:Notify(player, "The handle doesn't seem to budge.");
	end;
end;