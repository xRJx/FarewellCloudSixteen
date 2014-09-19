local FACTION = Clockwork.faction:New("Vortigaunt");

FACTION.isCombineFaction = false;
FACTION.isHumanFaction = false;
FACTION.isVortigauntFaction = true;
FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "hlc/factions/vort";

FACTION.models = {
	female = {"models/vortigaunt.mdl"},
	male = {"models/vortigaunt.mdl"}
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (faction.name != FACTION_VORT) then
		return false, "Humans can not be transferred to this faction!";
	end;
end;

FACTION_VORT = FACTION:Register();