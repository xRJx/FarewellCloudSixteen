local FACTION = Clockwork.faction:New("Survivor");

FACTION.isCombineFaction = false;
FACTION.isHumanFaction = true;
FACTION.isVortigauntFaction = false;
FACTION.whitelist = false;
FACTION.useFullName = true;
FACTION.material = "hlc/factions/survivor";
FACTION.models = {
	female = {
		"models/humans/Group02/Female_01.mdl",
		"models/humans/Group02/Female_02.mdl",
		"models/humans/Group02/Female_03.mdl",
		"models/humans/Group02/Female_04.mdl",
		"models/humans/Group02/Female_06.mdl",
		"models/humans/Group02/Female_07.mdl"
	},
	male = {
		"models/humans/Group02/Male_01.mdl",
		"models/humans/Group02/Male_04.mdl",
		"models/humans/Group02/Male_05.mdl",
		"models/humans/Group02/male_02.mdl",
		"models/humans/Group02/male_03.mdl",
		"models/humans/Group01/male_06.mdl",
		"models/humans/Group02/male_06.mdl",
		"models/humans/Group02/male_07.mdl",
		"models/humans/Group02/male_08.mdl",
		"models/humans/Group02/male_09.mdl"
	}
};

FACTION_SURVIVOR = FACTION:Register();