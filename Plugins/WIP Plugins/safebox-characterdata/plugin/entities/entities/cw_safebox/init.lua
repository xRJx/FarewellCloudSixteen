include("shared.lua");

AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");

-- Called when the entity initializes.
function ENT:Initialize()
	self:SetModel("models/props/cs_militia/footlocker01_closed.mdl");
	self:SetMoveType(MOVETYPE_VPHYSICS);
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetUseType(SIMPLE_USE);
	self:SetSolid(SOLID_VPHYSICS);
	
	local physicsObject = self:GetPhysicsObject();
	
	if ( IsValid(physicsObject) ) then
		physicsObject:Wake();
		physicsObject:EnableMotion(false);
	end;
end;

-- A function to return a unique ID.
function ENT:GenerateUniqueID()
	
	local ID = math.random(00, 99); print("IDG: uniqueID assigned as "..ID);
	
	for k, v in pairs(Clockwork.kernel:RestoreSchemaData( "plugins/personal/"..game.GetMap() )) do
		if ((v.uniqueID != {}) and (ID == v.uniqueID)) then
			print("ID taken. Retrying.");
			return self:GenerateUniqueID();
		end;
	end;
	
	return ID;
end;

function ENT:AssignID()
	if (self.Assigned != true) then
		self.ID = self:GenerateUniqueID();
		self.Assigned = true;
		print("Assigning ID");
	end;
end;

function ENT:GetID()
	return self.ID;
end;

function ENT:IsAssigned()
	return self.Assigned;
end;

function ENT:Use(activator)
	debug.Trace();
	
	if (activator:IsPlayer()) then
		Clockwork.plugin:Call("OpenStash", activator, self.Entity);
	end;
end;

function ENT:OnRemove()
	for k, v in pairs(player.GetAll()) do
		v:QueryCharacter("Data")[self.ID.."safeboxcash"] = nil;
		v:QueryCharacter("Data")[self.ID.."safeboxitems"] = nil;
	end;
end;

-- Called when the entity's transmit state should be updated.
function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS;
end;