local PLUGIN = PLUGIN;

local playerMeta = FindMetaTable("Player");

-- A function to handle a player's implants.
function playerMeta:HandleImplants()
	local stealthImplant = self:GetWeapon("cw_stealth_implant");
	
	if (IsValid(stealthImplant) and stealthImplant:IsActivated() and self:Alive() and !self:IsRagdolled()) then
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