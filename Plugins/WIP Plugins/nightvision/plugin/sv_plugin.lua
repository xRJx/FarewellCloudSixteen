local PLUGIN = PLUGIN;
local playerMeta = FindMetaTable("Player");

-- A function to handle a player's implants.
function playerMeta:HandleNightVisionGoggles()
	local nvGoggles = self:GetWeapon("cw_night_vision_goggles");
	
	if (IsValid(nvGoggles) and nvGoggles:IsActivated() and self:Alive() and !self:IsRagdolled()) then
		self:SetSharedVar("nvActive", true);
	else
		self:SetSharedVar("nvActive", false);
	end;
end;