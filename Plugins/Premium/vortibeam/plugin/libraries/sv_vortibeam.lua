local PLUGIN = PLUGIN;

PLUGIN.vortibeam = Clockwork.kernel:NewLibrary("Vortibeam");
vortiTable = {};

function PLUGIN.vortibeam:AddBeam(faction)
	vortiTable[#vortiTable + 1] = {
		faction = faction
	};
end;

PLUGIN.vortibeam:AddBeam(FACTION_EXAMPLE);