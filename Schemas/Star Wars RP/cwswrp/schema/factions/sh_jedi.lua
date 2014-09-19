local FACTION = Clockwork.faction:New("Jedi");

FACTION.whitelist = true;
FACTION.useFullName = true;
FACTION.material = "swrp/factions/jedi";
FACTION.models = {
	male = {"models/dpfilms/metropolice/playermodels/pm_black_police.mdl"},
	femaile = {"models/dpfilms/metropolice/playermodels/pm_black_police.mdl"}
}

FACTION_JEDI = FACTION:Register();