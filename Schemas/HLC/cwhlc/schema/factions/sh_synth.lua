local FACTION = Clockwork.faction:New("Overwatch Synth");

FACTION.isCombineFaction = true;
FACTION.isHumanFaction = false;
FACTION.isVortigauntFaction = false;
FACTION.whitelist = true;
FACTION.material = "hlc/factions/synth";

FACTION.models = {
	female = {"models/hunter.mdl"},
	male = {"models/hunter.mdl"}
};

-- Called when a player's name should be assigned for the faction.
function FACTION:GetName(player, character)
	local unitID = math.random(1, 99999);
	
	return "SYNTH-ZONE.HnT-"..Clockwork.kernel:ZeroNumberToDigits(unitID, 5);
end;

-- Called when a player's model should be assigned for the faction.
function FACTION:GetModel(player, character)
	if (character.gender == GENDER_MALE) then
		return self.models.male[1];
	else
		return self.models.female[1];
	end;
end;

FACTION_SYNTH = FACTION:Register();