local PLUGIN = PLUGIN;

PLUGIN.voices = Clockwork.kernel:NewLibrary("Overwatch Voices");

PLUGIN.voices.stored = {
	overwatchVoices = {}
};

-- A function to add an overwatch voice.
function PLUGIN.voices:AddOverwatch(command, phrase, sound)
	self.stored.overwatchVoices[#self.stored.overwatchVoices + 1] = {
		command = command,
		phrase = phrase,
		sound = sound
	};
end;

PLUGIN.voices:AddOverwatch("Administer", "Administer.", "npc/overwatch/radiovoice/administer.wav");
PLUGIN.voices:AddOverwatch("Witness Sterilization", "All units, begin witness sterilization.", "npc/overwatch/radiovoice/allunitsbeginwhitnesssterilization.wav");
PLUGIN.voices:AddOverwatch("Amputate", "Amputate.", "npc/overwatch/radiovoice/amputate.wav");
PLUGIN.voices:AddOverwatch("Anti-Citizen", "Anti-citizen.", "npc/overwatch/radiovoice/anticitizen.wav");
PLUGIN.voices:AddOverwatch("Apply", "Apply.", "npc/overwatch/radiovoice/apply.wav");
PLUGIN.voices:AddOverwatch("Attention", "Attention.", "npc/overwatch/radiovoice/attention.wav");
PLUGIN.voices:AddOverwatch("10-0", "10-0, begin scanning.", "npc/overwatch/radiovoice/beginscanning10-0.wav");
PLUGIN.voices:AddOverwatch("Block", "Block.", "npc/overwatch/radiovoice/block.wav");
PLUGIN.voices:AddOverwatch("Capital Malcompliance", "Capital malcompliance.", "npc/overwatch/radiovoice/capitalmalcompliance.wav");
PLUGIN.voices:AddOverwatch("Cauterize", "Cauterize.", "npc/overwatch/radiovoice/cauterize.wav");
PLUGIN.voices:AddOverwatch("Citizen", "Citizen.", "npc/overwatch/radiovoice/citizen.wav");
PLUGIN.voices:AddOverwatch("Complete Sentencing", "All protection team units, complete sentencing at will.", "npc/overwatch/radiovoice/completesentencingatwill.wav");
PLUGIN.voices:AddOverwatch("Defender", "Defender!", "npc/overwatch/radiovoice/defender.wav");
PLUGIN.voices:AddOverwatch("Document", "Document.", "npc/overwatch/radiovoice/document.wav");
PLUGIN.voices:AddOverwatch("Examine", "Examine.", "npc/overwatch/radiovoice/examine.wav");
PLUGIN.voices:AddOverwatch("Administered", "Final verdict administered.", "npc/overwatch/radiovoice/finalverdictadministered.wav");
PLUGIN.voices:AddOverwatch("Priority Region", "High priority region.", "npc/overwatch/radiovoice/highpriorityregion.wav");
PLUGIN.voices:AddOverwatch("Immediate Amputation", "Immediate amputation.", "npc/overwatch/radiovoice/immediateamputation.wav");
PLUGIN.voices:AddOverwatch("Industrial Zone", "Industrial zone.", "npc/overwatch/radiovoice/industrialzone.wav");
PLUGIN.voices:AddOverwatch("Infection", "Infection.", "npc/overwatch/radiovoice/infection.wav");
PLUGIN.voices:AddOverwatch("Infested", "Infested zone.", "npc/overwatch/radiovoice/infestedzone.wav");
PLUGIN.voices:AddOverwatch("Inject", "Inject", "npc/overwatch/radiovoice/inject.wav");
PLUGIN.voices:AddOverwatch("Innoculate", "Innoculate.", "npc/overwatch/radiovoice/innoculate.wav");
PLUGIN.voices:AddOverwatch("Investigate", "Investigate.", "npc/overwatch/radiovoice/investigate.wav");
PLUGIN.voices:AddOverwatch("Investigate Report", "Investigate and report.", "npc/overwatch/radiovoice/investigateandreport.wav");
PLUGIN.voices:AddOverwatch("Isolate", "Isolate.", "npc/overwatch/radiovoice/isolate.wav");
PLUGIN.voices:AddOverwatch("Jury", "Jury!", "npc/overwatch/radiovoice/jury.wav");
PLUGIN.voices:AddOverwatch("King", "King!", "npc/overwatch/radiovoice/king.wav");
PLUGIN.voices:AddOverwatch("Lock Location", "Protection team, lock down your location. Sacrifice code.", "npc/overwatch/radiovoice/lockdownlocationsacrificecode.wav");
PLUGIN.voices:AddOverwatch("Lost Biosignal", "Lost biosignal for protection team unit!", "npc/overwatch/radiovoice/lostbiosignalforunit.wav");
PLUGIN.voices:AddOverwatch("Non-Citizen", "Non-citizen.", "npc/overwatch/radiovoice/noncitizen.wav");
PLUGIN.voices:AddOverwatch("Officer Closing", "Officer closing on suspect.", "npc/overwatch/radiovoice/officerclosingonsuspect.wav");
PLUGIN.voices:AddOverwatch("Patrol", "Patrol.", "npc/overwatch/radiovoice/patrol.wav");
PLUGIN.voices:AddOverwatch("Offworld Assignment", "Permanent offworld service assignment.", "npc/overwatch/radiovoice/permanentoffworld.wav");
PLUGIN.voices:AddOverwatch("Prepare Sentencing", "Prepare for final sentencing.", "npc/overwatch/radiovoice/prepareforfinalsentencing.wav");
PLUGIN.voices:AddOverwatch("Prepare Innoculate", "All local protection team units, prepare to innoculate.", "npc/overwatch/radiovoice/preparetoinnoculate.wav");
PLUGIN.voices:AddOverwatch("Prepare Verdict", "Prepare to receive verdict.", "npc/overwatch/radiovoice/preparetoreceiveverdict.wav");
PLUGIN.voices:AddOverwatch("Production Block", "Production block.", "npc/overwatch/radiovoice/productionblock.wav");
PLUGIN.voices:AddOverwatch("Prosecute", "Prosecute.", "npc/overwatch/radiovoice/prosecute.wav");
PLUGIN.voices:AddOverwatch("Conflicting Data", "We are receiving conflicting data.", "npc/overwatch/radiovoice/recievingconflictingdata.wav");
PLUGIN.voices:AddOverwatch("Units Contain", "Remaining units, contain.", "npc/overwatch/radiovoice/remainingunitscontain.wav");
PLUGIN.voices:AddOverwatch("Memory Replacement", "Reminder, memory replacement is the best step towards rank privileges.", "npc/overwatch/radiovoice/remindermemoryreplacement.wav");
PLUGIN.voices:AddOverwatch("Report", "Report please.", "npc/overwatch/radiovoice/report.wav");
PLUGIN.voices:AddOverwatch("Repurposed Area", "Repurposed area.", "npc/overwatch/radiovoice/repurposedarea.wav");
PLUGIN.voices:AddOverwatch("Residential Block", "Residential block.", "npc/overwatch/radiovoice/residentialblock.wav");
PLUGIN.voices:AddOverwatch("Respond", "Respond.", "npc/overwatch/radiovoice/respond.wav");
PLUGIN.voices:AddOverwatch("Restrict", "Restrict", "npc/overwatch/radiovoice/restrict.wav");
PLUGIN.voices:AddOverwatch("Restricted Block", "Restricted block.", "npc/overwatch/radiovoice/restrictedblock.wav");
PLUGIN.voices:AddOverwatch("Reward Notice", "Reward notice, protection team member; your family cohesion is preserved.", "npc/overwatch/radiovoice/rewardnotice.wav");
PLUGIN.voices:AddOverwatch("Search", "Search.", "npc/overwatch/radiovoice/search.wav");
PLUGIN.voices:AddOverwatch("Serve", "Serve.", "npc/overwatch/radiovoice/serve.wav");
PLUGIN.voices:AddOverwatch("Sterilize", "Sterilize.", "npc/overwatch/radiovoice/sterilize.wav");
PLUGIN.voices:AddOverwatch("Switch Com", "All units, switch com to tac-3.", "npc/overwatch/radiovoice/switchtotac5reporttocp.wav");
PLUGIN.voices:AddOverwatch("Report Status", "Local civil protection teams, report status.", "npc/overwatch/radiovoice/teamsreportstatus.wav");
PLUGIN.voices:AddOverwatch("Union", "Union.", "npc/overwatch/radiovoice/union.wav");
PLUGIN.voices:AddOverwatch("Deserviced", "Unit deserviced.", "npc/overwatch/radiovoice/unitdeserviced.wav");
PLUGIN.voices:AddOverwatch("Vice", "Vice!", "npc/overwatch/radiovoice/vice.wav");
PLUGIN.voices:AddOverwatch("Victor", "Victor!", "npc/overwatch/radiovoice/victor.wav");
PLUGIN.voices:AddOverwatch("Violation", "Violation of civic trust.", "npc/overwatch/radiovoice/violationofcivictrust.wav");
PLUGIN.voices:AddOverwatch("Xray", "Xray!", "npc/overwatch/radiovoice/xray.wav");
PLUGIN.voices:AddOverwatch("Guilty", "You are judged guilty by civil protection team.", "npc/overwatch/radiovoice/youarejudgedguilty.wav");
PLUGIN.voices:AddOverwatch("Zone", "Zone!", "npc/overwatch/radiovoice/zone.wav");

if (CLIENT) then
	table.sort(PLUGIN.voices.stored.overwatchVoices, function(a, b) return a.command < b.command; end);

	for k, v in pairs(PLUGIN.voices.stored.overwatchVoices) do
		Clockwork.directory:AddCode("Overwatch", [[
			<div class="auraInfoTitle">]]..string.upper(v.command)..[[</div>
			<div class="auraInfoText">]]..v.phrase..[[</div>
		]], true);
	end;
end;