local FACTION = Clockwork.faction:New("Overwatch Transhuman Arm");

FACTION.isCombineFaction = true;
FACTION.isHumanFaction = false;
FACTION.isVortigauntFaction = false;
FACTION.whitelist = true;
FACTION.material = "hlc/factions/ota";

FACTION.models = {
	female = {"models/combine_soldier.mdl"},
	male = {"models/combine_soldier.mdl"}
};

-- Called when a player's name should be assigned for the faction.
function FACTION:GetName(player, character)
	local unitID = math.random(1, 99999);
	
	return "OTA-ZONE.OWS-"..Clockwork.kernel:ZeroNumberToDigits(unitID, 5);
end;

-- Called when a player's model should be assigned for the faction.
function FACTION:GetModel(player, character)
	if (character.gender == GENDER_MALE) then
		return self.models.male[1];
	else
		return self.models.female[1];
	end;
end;

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	return false, "Players can not be transferred to this faction!";
end;

FACTION_OTA = FACTION:Register();