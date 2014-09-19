local PLUGIN = PLUGIN;

local playerMeta = FindMetaTable("Player");

-- A function to handle a player's implants.
function playerMeta:HandleImplants()
	local visionImplant = self:GetWeapon("cw_visionimplant");
	local thermalImplant = self:GetWeapon("cw_thermalimplant");
	local stealthImplant = self:GetWeapon("cw_stealthimplant");
	local isRagdolled = self:IsRagdolled();
	local isAlive = self:Alive();
	
	if (IsValid(visionImplant) and visionImplant:IsActivated() and isAlive and !isRagdolled) then
		if ( (self:HasWeapon("cw_thermalimplant") and !thermalImplant:IsActivated()) or !self:HasWeapon("cw_thermalimplant") ) then
			self:SetSharedVar("vision", true);
		end;
	else
		self:SetSharedVar("vision", false);
	end;
	
	if (IsValid(thermalImplant) and thermalImplant:IsActivated() and isAlive and !isRagdolled) then
		if ( (self:HasWeapon("cw_visionimplant") and !visionImplant:IsActivated()) or !self:HasWeapon("cw_visionimplant") ) then
			self:SetSharedVar("thermal", true);
		end;
	else
		self:SetSharedVar("thermal", false);
	end;
	
	if (IsValid(stealthImplant) and stealthImplant:IsActivated() and isAlive and !isRagdolled) then
		if (!self.lastMaterial) then
			self.lastMaterial = self:GetMaterial();
		end;
		
		if (!self.lastColor) then
			self.lastColor = { self:GetColor() };
		end;
		
		self:SetMaterial("sprites/heatwave");
		self:SetColor(255, 255, 255, 0);
	elseif (self.lastMaterial and self.lastColor) then
		self:SetMaterial(self.lastMaterial);
		self:SetColor( unpack(self.lastColor) );
		
		self.lastMaterial = nil;
		self.lastColor = nil;
	end;
end;