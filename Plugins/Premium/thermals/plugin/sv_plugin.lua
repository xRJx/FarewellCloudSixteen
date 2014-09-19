local PLUGIN = PLUGIN;

-- A function to handle a player's implants.
function PLUGIN:HandleThermalGoggles(player)
	local thermalGoggles = player:GetWeapon("cw_thermal_goggles");
	
	if (IsValid(thermalGoggles) and thermalGoggles:IsActivated() and player:Alive() and !player:IsRagdolled()) then
		player:SetSharedVar("thermalsActive", true);
	else
		player:SetSharedVar("thermalsActive", false);
	end;
end;