local PLUGIN = PLUGIN;

PLUGIN.voices = Clockwork.kernel:NewLibrary("VortigauntVoices");

PLUGIN.voices.stored = {
	vortigauntVoices = {}
};

-- A function to add a vortigaunt voice.
function PLUGIN.voices:AddVortigaunt(faction, command, phrase, sound, female, menu)
	self.stored.vortigauntVoices[#self.stored.vortigauntVoices + 1] = {
		command = command,
		faction = faction,
		phrase = phrase,
		female = female,
		sound = sound,
		menu = menu
	};
end;

-- This list is alphabetically ordered and I hope you keep it that way.
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Accept Charge", "Accept the charge.", "vo/npc/vortigaunt/acceptcharge.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Accompany", "Gladly we accompany.", "vo/npc/vortigaunt/accompany.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Affirmed", "Affirmed.", "vo/npc/vortigaunt/affirmed.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "All For Now", "That is all for now.", "vo/npc/vortigaunt/allfornow.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Allow Me", "Allow me.", "vo/npc/vortigaunt/allowme.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "As You Wish", "As you wish.", "vo/npc/vortigaunt/asyouwish.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Believe The Opposite", "We believe the opposite.", "vo/npc/vortigaunt/vanswer03.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "By Our Honor", "By our honor.", "vo/npc/vortigaunt/ourhonor.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Calm", "Caaaalm yourself.", "vo/npc/vortigaunt/calm.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Caution", "Caution!", "vo/npc/vortigaunt/caution.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Certainly", "Certainly.", "vo/npc/vortigaunt/certainly.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Concern", "Your concern is touching.", "vo/npc/vortigaunt/vanswer07.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Delay", "Is there reason for delay?", "vo/npc/vortigaunt/reasondelay.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Done", "Done.", "vo/npc/vortigaunt/done.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Dreamed", "We have dreamed of this moment.", "vo/npc/vortigaunt/dreamed.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Empower Us", "Empower us!", "vo/npc/vortigaunt/empowerus.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Expected", "We expected this much.", "vo/npc/vortigaunt/vanswer05.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Failed You", "We fear we have failed you.", "vo/npc/vortigaunt/fearfailed.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "For Freedom", "For freedom!", "vo/npc/vortigaunt/forfreedom.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Forward", "Forward!", "vo/npc/vortigaunt/forward.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Gladly", "Gladly.", "vo/npc/vortigaunt/gladly.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Halt", "Halt.", "vo/npc/vortigaunt/halt.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Here", "Here.", "vo/npc/vortigaunt/here.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Hold", "Hold.", "vo/npc/vortigaunt/hold.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Hold Still", "Hold still.", "vo/npc/vortigaunt/holdstill.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Hope", "Hope is in sight.", "vo/npc/vortigaunt/vques03.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Hopeless", "Our cause seems hopeless.", "vo/npc/vortigaunt/hopeless.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Honor", "It is an honor.", "vo/npc/vortigaunt/honor.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Honored", "We are honored.", "vo/npc/vortigaunt/wehonored.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Honor Is Ours", "The honor is ours.", "vo/npc/vortigaunt/honourours.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Illusions", "You are not the first to harbor such illusions.", "vo/npc/vortigaunt/vanswer02.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Know You", "We know you.", "vo/npc/vortigaunt/weknowyou.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Lead On", "Lead on.", "vo/npc/vortigaunt/leadon.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Lead Us", "Lead us.", "vo/npc/vortigaunt/leadus.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Live To Serve", "We live to serve.", "vo/npc/vortigaunt/livetoserve.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Lost All Dear", "We have lost all dear to us.", "vo/npc/vortigaunt/alldear.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Mutual", "Our purpose is mutual.", "vo/npc/vortigaunt/mutual.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Mutual Feeling", "The feeling is mutual.", "vo/npc/vortigaunt/vanswer16.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Mystery", "We serve the same mystery.", "vo/npc/vortigaunt/mystery.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Onward", "Onward!", "vo/npc/vortigaunt/onward.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Opaque", "Your mind is opaque.", "vo/npc/vortigaunt/opaque.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Our Place", "Our place is here.", "vo/npc/vortigaunt/.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Pleasure", "With pleasure...", "vo/npc/vortigaunt/pleasure.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Prevail", "We shall prevail.", "vo/npc/vortigaunt/prevail.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Regrettable", "This is regrettable.", "vo/npc/vortigaunt/regrettable.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Stand Clear", "Stand clear!", "vo/npc/vortigaunt/standclear.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Still Here", "We are still here.", "vo/npc/vortigaunt/stillhere.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Survived 1", "We have survived darker times.", "vo/npc/vortigaunt/vques06.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Survived 2", "We have survived worse across the ages.", "vo/npc/vortigaunt/seenworse.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "That Is All", "That is all.", "vo/npc/vortigaunt/thatisall.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "This Body", "This body is yours to command.", "vo/npc/vortigaunt/bodyyours.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "To The Void", "To the void with you!", "vo/npc/vortigaunt/tothevoid.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Trouble No More", "That one shall trouble us no more.", "vo/npc/vortigaunt/troubleus.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Turning Point", "This marks a turning point.", "vo/npc/vortigaunt/vques04.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Unconvinced", "We remain unconvinced.", "vo/npc/vortigaunt/vanswer01.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "V1", "Ah'Glaa.", "vo/npc/vortigaunt/vortigese02.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "V2", "Tahh.", "vo/npc/vortigaunt/vortigese03.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "V3", "Dew'it.", "vo/npc/vortigaunt/vortigese04.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "V4", "Langh.", "vo/npc/vortigaunt/vortigese05.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "V5", "Gangh.", "vo/npc/vortigaunt/vortigese07.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "V6", "Gulanga!", "vo/npc/vortigaunt/vortigese08.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "V7", "Gallah'lung.", "vo/npc/vortigaunt/vortigese09.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "V8", "Gerr, galling gerr a'la gam.", "vo/npc/vortigaunt/vortigese11.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "V9", "Gerr, lung'gung. Jella'gerr.", "vo/npc/vortigaunt/vortigese12.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "We Assure", "Likewise, we assure.", "vo/npc/vortigaunt/vanswer15.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "We Can Spare", "That is all we can spare.", "vo/npc/vortigaunt/allwecanspare.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "We Stay", "Here we stay.", "vo/npc/vortigaunt/herewestay.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "We Will Help", "We will help you.", "vo/npc/vortigaunt/wewillhelp.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Where To", "Where to now? And to what end?", "vo/npc/vortigaunt/whereto.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Wish Right", "We wish you are right.", "vo/npc/vortigaunt/vanswer12.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Worthless", "Our life is worthless, unless spent on freedom.", "vo/npc/vortigaunt/worthless.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Yes", "Yessss.", "vo/npc/vortigaunt/yes.wav")
PLUGIN.voices:AddVortigaunt("Vortigaunt", "Yes forward", "Yes, forward.", "vo/npc/vortigaunt/yesforward.wav")

if (CLIENT) then
	table.sort(PLUGIN.voices.stored.vortigauntVoices, function(a, b) return a.command < b.command; end);
	
	for k, v in pairs(PLUGIN.voices.stored.vortigauntVoices) do
		Clockwork.directory:AddCode("Vortigaunt", [[
			<div class="auraInfoTitle">]]..string.upper(v.command)..[[</div>
			<div class="auraInfoText">]]..v.phrase..[[</div>
		]], true);
	end;
end;