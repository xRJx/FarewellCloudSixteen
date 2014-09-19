local PLUGIN = PLUGIN;

-- Called when a player's scoreboard class is needed.
function PLUGIN:GetPlayerScoreboardClass(player)
	if (player:GetFaction() == FACTION_OTA) then
		if (Schema:PlayerIsCombine(Clockwork.Client)) then
			return "Overwatch Transhuman Arm";
		elseif (Clockwork.Client:IsAdmin() and !Schema:PlayerIsCombine(Clockwork.Client)) then
			return "OTA (Admin View)";
		else
			return false;
		end;
	end;
end;