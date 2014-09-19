local PLUGIN = PLUGIN;

PLUGIN.voices = Clockwork.kernel:NewLibrary("HumanVoices");

PLUGIN.voices.stored = {
	humanVoices = {}
};

-- A function to add a Human voice.
function PLUGIN.voices:AddHuman(faction, command, phrase, sound, female, menu)
	PLUGIN.voices.stored.humanVoices[#PLUGIN.voices.stored.humanVoices + 1] = {
		command = command,
		faction = faction,
		phrase = phrase,
		female = female,
		sound = sound,
		menu = menu
	};
end;

PLUGIN.voices:AddHuman("Human", "Sweeping", "Sweeping for suspect.", "npc/metropolice/hiding02.wav");

if (CLIENT) then
	table.sort(PLUGIN.voices.stored.humanVoices, function(a, b) return a.command < b.command; end);
	
	for k, v in pairs(PLUGIN.voices.stored.humanVoices) do
		Clockwork.directory:AddCode("Human", [[
			<div class="auraInfoTitle">]]..string.upper(v.command)..[[</div>
			<div class="auraInfoText">]]..v.phrase..[[</div>
		]], true);
	end;
end;