local FACTION = Clockwork.faction:New("Clones");

FACTION.whitelist = false;
FACTION.material = "swrp/factions/clones";
FACTION.models = "models/sgg/starwars/clonetrooper_clean.mdl";

-- Called when a player's name should be assigned for the faction.
function FACTION:GetName(player, character)
	local unitID = math.random(1, 999);
	
	return "GRT-PVT."..Clockwork.kernel:ZeroNumberToDigits(unitID, 3);
end;

FACTION_CLONE = FACTION:Register();