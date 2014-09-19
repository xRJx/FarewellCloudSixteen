local PLUGIN = PLUGIN;
local playerMeta = FindMetaTable("Player");

-- A function to handle a player's implants.
function playerMeta:HandleNightVisionGoggles()
	local visionImplant = self:GetWeapon("cw_night_vision_goggles");
	
	if (IsValid(visionImplant) and visionImplant:IsActivated() and self:Alive() and !self:IsRagdolled()) then
		self:SetSharedVar("vision", true);
	else
		self:SetSharedVar("vision", false);
	end;
end;