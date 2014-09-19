local PLUGIN = PLUGIN;

-- BEGING UED ORGANIZATION STUFF --
-- Called when a player's scoreboard class is needed.
function PLUGIN:GetPlayerScoreboardClass(player)
	if (Schema:IsPlayerCombineRank(player, "UED")) then
		return "Union Evaluation Department";
	end;
end;

-- Called when the local player attempts to see a class.
function PLUGIN:PlayerCanSeeClass(class)
	if (class.index == CLASS_MPU and Schema:IsPlayerCombineRank(Clockwork.Client, "UED")) then
		return false;
	end;
end;
-- END UED ORGANIZATION STUFF --