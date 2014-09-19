local PLUGIN = PLUGIN;

local playerMeta = FindMetaTable("Player");

-- A function to handle a player's implants.
function playerMeta:HandleThermalGoggles()
	local thermalGoggles = self:GetWeapon("cw_thermal_goggles");
	
	if (IsValid(thermalGoggles) and thermalGoggles:IsActivated() and self:Alive() and !self:IsRagdolled()) then
		self:SetSharedVar("thermalsActive", true);
	else
		self:SetSharedVar("thermalsActive", false);
	end;
end;