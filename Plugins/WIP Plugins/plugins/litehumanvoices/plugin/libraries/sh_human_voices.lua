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

PLUGIN.voices:AddHuman("Human", "Behind you", "Behind you!", "vo/npc/male01/behindyou01.wav", "vo/npc/female01/behindyou01.wav");
PLUGIN.voices:AddHuman("Human", "Busy", "Can't you see i'm busy?", "vo/npc/male01/busy02.wav", "vo/npc/female01/busy02.wav");
PLUGIN.voices:AddHuman("Human", "Look below", "Look at below!", "vo/npc/male01/cit_dropper04.wav", "vo/npc/female01/cit_dropper04.wav");
PLUGIN.voices:AddHuman("Human", "Civil protection", "Civil Protection!", "vo/npc/male01/civilprotection01.wav", "vo/npc/female01/civilprotection01.wav");
PLUGIN.voices:AddHuman("Human", "Combine", "Combine!", "vo/npc/male01/combine01.wav", "vo/npc/female01/combine01.wav");
PLUGIN.voices:AddHuman("Human", "Cps", "CPs!", "vo/npc/male01/cps01.wav", "vo/npc/female01/cps01.wav");
PLUGIN.voices:AddHuman("Human", "Doing something", "Should we be.. huh.. doing something?", "vo/npc/male01/doingsomething.wav", "vo/npc/female01/doingsomething.wav");
PLUGIN.voices:AddHuman("Human", "Excuse me", "Excuse me.", "vo/npc/male01/excuseme02.wav", "vo/npc/female01/excuseme02.wav");
PLUGIN.voices:AddHuman("Human", "Fantastic 1", "Fantastic!", "vo/npc/male01/fantastic01.wav", "vo/npc/female01/fantastic01.wav");
PLUGIN.voices:AddHuman("Human", "Fantastic 2", "Fantastic!", "vo/npc/male01/fantastic02.wav", "vo/npc/female01/fantastic02.wav");
PLUGIN.voices:AddHuman("Human", "Finally", "Finally!", "vo/npc/male01/finally.wav", "vo/npc/female01/finally.wav");
PLUGIN.voices:AddHuman("Human", "Get down", "Get down!", "vo/npc/male01/getdown02.wav", "vo/npc/female01/getdown02.wav");
PLUGIN.voices:AddHuman("Human", "Get going", "Are you get going soon?", "vo/npc/male01/getgoingsoon.wav", "vo/npc/female01/getgoingsoon.wav");
PLUGIN.voices:AddHuman("Human", "Get Out", "Get... The hell... Out of here!", "vo/npc/male01/gethellout.wav", "vo/npc/female01/getthehellout.wav");
PLUGIN.voices:AddHuman("Human", "Good god", "Good god!.", "vo/npc/male01/goodgod.wav", "vo/npc/female01/goodgod.wav");
PLUGIN.voices:AddHuman("Human", "Got one", "Got one!", "vo/npc/male01/gotone01.wav", "vo/npc/female01/gotone01.wav");
PLUGIN.voices:AddHuman("Human", "Hacks", "(Man)Hacks!", "vo/npc/male01/hacks02.wav", "vo/npc/female01/hacks02.wav");
PLUGIN.voices:AddHuman("Human", "Headcrabs", "Headcrabs!", "vo/npc/male01/headcrabs01.wav", "vo/npc/female01/headcrabs01.wav");
PLUGIN.voices:AddHuman("Human", "Heads up", "Heads up!", "vo/npc/male01/headsup02.wav", "vo/npc/female01/headsup02.wav");
PLUGIN.voices:AddHuman("Human", "Help", "Help!", "vo/npc/male01/help01.wav", "vo/npc/female01/help01.wav");
PLUGIN.voices:AddHuman("Human", "The Hacks", "Here come the hacks!", "vo/npc/male01/herecomehacks02.wav", "vo/npc/female01/herecomethehacks02.wav");
PLUGIN.voices:AddHuman("Human", "Here they come", "Here they come!", "vo/npc/male01/heretheycome01.wav", "vo/npc/female01/heretheycome01.wav");
PLUGIN.voices:AddHuman("Human", "Hi", "Hi.", "vo/npc/male01/hi01.wav", "vo/npc/female01/hi01.wav");
PLUGIN.voices:AddHuman("Human", "Hi 2", "Hi.", "vo/npc/male01/hi02.wav", "vo/npc/female01/hi02.wav");
PLUGIN.voices:AddHuman("Human", "Hit gut", "In the gut!", "vo/npc/male01/hitingut01.wav", "vo/npc/female01/hitingut01.wav");
PLUGIN.voices:AddHuman("Human", "Spot", "I am gonna stay and... hold down this spot.", "vo/npc/male01/holddownspot01.wav", "vo/npc/female01/holddownspot01.wav");
PLUGIN.voices:AddHuman("Human", "Ill stay", "I'll stay here", "vo/npc/male01/illstayhere01.wav", "vo/npc/female01/illstayhere01.wav");
PLUGIN.voices:AddHuman("Human", "Im hurt", "I'm hurt!", "vo/npc/male01/imhurt01.wav", "vo/npc/female01/imhurt01.wav");
PLUGIN.voices:AddHuman("Human", "Sticking", "I'm sticking here.", "vo/npc/male01/imstickinghere01.wav", "vo/npc/female01/imstickinghere01.wav");
PLUGIN.voices:AddHuman("Human", "Incoming", "Incoming!", "vo/npc/male01/incoming02.wav", "vo/npc/female01/incoming02.wav");
PLUGIN.voices:AddHuman("Human", "Lead", "You lead the way!", "vo/npc/male01/leadtheway01.wav", "vo/npc/female01/leadtheway01.wav");
PLUGIN.voices:AddHuman("Human", "Lets go", "Let's go!", "vo/npc/male01/letsgo02.wav", "vo/npc/female01/letsgo02.wav");
PLUGIN.voices:AddHuman("Human", "Like that", "Like that!", "vo/npc/male01/likethat.wav", "vo/npc/female01/likethat.wav");
PLUGIN.voices:AddHuman("Human", "Corner", "I've got my little corner and I'm.. sticking to it!", "vo/npc/male01/littlecorner01.wav", "vo/npc/female01/littlecorner01.wav");
PLUGIN.voices:AddHuman("Human", "Nice", "Nice!", "vo/npc/male01/nice.wav", "vo/npc/female01/nice.wav");
PLUGIN.voices:AddHuman("Human", "No", "No!", "vo/npc/male01/no01.wav", "vo/npc/female01/no01.wav");
PLUGIN.voices:AddHuman("Human", "No 2", "No!", "vo/npc/male01/no02.wav", "vo/npc/female01/no02.wav");
PLUGIN.voices:AddHuman("Human", "Oh No", "Oh no!", "vo/npc/male01/ohno.wav", "vo/npc/female01/ohno.wav");
PLUGIN.voices:AddHuman("Human", "Ok", "Ok!", "vo/npc/male01/ok01.wav", "vo/npc/female01/ok01.wav");
PLUGIN.voices:AddHuman("Human", "Ok2", "Ok!", "vo/npc/male02/ok01.wav", "vo/npc/female01/ok02.wav");
PLUGIN.voices:AddHuman("Human", "Ok 2", "Ok!", "vo/npc/male01/ok02.wav", "vo/npc/female01/ok02.wav");
PLUGIN.voices:AddHuman("Human", "Ready", "Ok I'm ready", "vo/npc/male01/okimready01.wav", "vo/npc/female01/okimready01.wav");
PLUGIN.voices:AddHuman("Human", "Ready 2", "Ok I'm ready", "vo/npc/male01/okimready02.wav", "vo/npc/female01/okimready02.wav");
PLUGIN.voices:AddHuman("Human", "Ready 3", "Ok I'm ready", "vo/npc/male01/okimready03.wav", "vo/npc/female01/okimready03.wav");
PLUGIN.voices:AddHuman("Human", "For me", "One for me and... one for me!", "vo/npc/male01/oneforme.wav", "vo/npc/female01/oneforme.wav");
PLUGIN.voices:AddHuman("Human", "Out of your way", "Let me get out of your way.", "vo/npc/male01/outofyourway02.wav", "vo/npc/female01/outofyourway02.wav");
PLUGIN.voices:AddHuman("Human", "Here", "Over here!", "vo/npc/male01/overhere01.wav", "vo/npc/female01/overhere01.wav");
PLUGIN.voices:AddHuman("Human", "There", "Over there!", "vo/npc/male01/overthere01.wav", "vo/npc/female01/overthere01.wav");
PLUGIN.voices:AddHuman("Human", "Ow", "Ow!", "vo/npc/male01/ow01.wav", "vo/npc/female01/ow01.wav");
PLUGIN.voices:AddHuman("Human", "Pardon", "Pardon me.", "vo/npc/male01/pardonme01.wav", "vo/npc/female01/pardonme01.wav");
PLUGIN.voices:AddHuman("Human", "The Man", "You're not the man I thought you were!", "vo/npc/male01/notthemanithought01.wav", "vo/npc/female01/notthemanithought01.wav");
PLUGIN.voices:AddHuman("Human", "The Man 2", "You're not the man I thought you were.", "vo/npc/male01/notthemanithought02.wav", "vo/npc/female01/notthemanithought02.wav");
PLUGIN.voices:AddHuman("Human", "Run life", "Run for your life!", "vo/npc/male01/runforyourlife01.wav", "vo/npc/female01/runforyourlife01.wav");
PLUGIN.voices:AddHuman("Human", "Scanner", "Scanners!", "vo/npc/male01/scanners02.wav", "vo/npc/female01/scanners02.wav");
PLUGIN.voices:AddHuman("Human", "Sorry", "Sorry.", "vo/npc/male01/sorry01.wav", "vo/npc/female01/sorry01.wav");
PLUGIN.voices:AddHuman("Human", "Sorry 2", "Sorry.", "vo/npc/male01/sorry02.wav", "vo/npc/female01/sorry02.wav");
PLUGIN.voices:AddHuman("Human", "Sorry 3", "Sorry.", "vo/npc/male01/sorry03.wav", "vo/npc/female01/sorry03.wav");
PLUGIN.voices:AddHuman("Human", "Strider", "Strider!", "vo/npc/male01/strider.wav", "vo/npc/female01/strider.wav");
PLUGIN.voices:AddHuman("Human", "Run", "Run!", "vo/npc/male01/strider_run.wav", "vo/npc/female01/strider_run.wav");
PLUGIN.voices:AddHuman("Human", "Cover", "Take cover!", "vo/npc/male01/takecover02.wav", "vo/npc/female01/takecover02.wav");
PLUGIN.voices:AddHuman("Human", "Do Nice", "This'll do nice.", "vo/npc/male01/thislldonicely01.wav", "vo/npc/female01/thislldonicely01.wav");
PLUGIN.voices:AddHuman("Human", "Uh Oh", "Uh-oh.", "vo/npc/male01/uhoh.wav", "vo/npc/female01/uhoh.wav");
PLUGIN.voices:AddHuman("Human", "Waiting somebody", "Are you waiting for somebody?", "vo/npc/male01/waitingsomebody.wav", "vo/npc/female01/waitingsomebody.wav");
PLUGIN.voices:AddHuman("Human", "Watch out", "Watch out!", "vo/npc/male01/watchout.wav", "vo/npc/female01/watchout.wav");
PLUGIN.voices:AddHuman("Human", "Whoops", "Whoops.", "vo/npc/male01/whoops01.wav", "vo/npc/female01/whoops01.wav");
PLUGIN.voices:AddHuman("Human", "Trusted", "We trusted you!", "vo/npc/male01/wetrustedyou01.wav", "vo/npc/female01/wetrustedyou01.wav");
PLUGIN.voices:AddHuman("Human", "Yeah", "Yeah!", "vo/npc/male01/yeah02.wav", "vo/npc/female01/yeah02.wav");
PLUGIN.voices:AddHuman("Human", "You got it", "You got it!", "vo/npc/male01/yougotit02.wav", "vo/npc/female01/yougotit02.wav");
PLUGIN.voices:AddHuman("Human", "Zombies", "Zombies!", "vo/npc/male01/zombies01.wav", "vo/npc/female01/zombies01.wav");

PLUGIN.voices:AddHuman("Human", "Cheer 1", "*Cheering*", "vo/coast/odessa/male01/nlo_cheer01.wav" , "vo/coast/odessa/female01/nlo_cheer01.wav");
PLUGIN.voices:AddHuman("Human", "Cheer 2", "Wohooo!", "vo/coast/odessa/male01/nlo_cheer02.wav" , "vo/coast/odessa/female01/nlo_cheer02.wav");
PLUGIN.voices:AddHuman("Human", "No time", "This is no time to be wondering around, the combine's closing in!", "vo/coast/odessa/male01/nlo_citizen_greet03.wav" , "vo/coast/odessa/female01/nlo_citizen_greet03.wav");
PLUGIN.voices:AddHuman("Human", "This way", "This way.", "vo/coast/odessa/male01/stairman_follow01.wav" , "vo/coast/odessa/female01/stairman_follow01.wav");
PLUGIN.voices:AddHuman("Human", "Some ammo", "Take some ammo!", "vo/npc/male01/ammo05.wav" , "vo/npc/female01/ammo05.wav");
PLUGIN.voices:AddHuman("Human", "Here ammo", "Here, ammo!", "vo/npc/male01/ammo03.wav" , "vo/npc/female01/ammo03.wav");
PLUGIN.voices:AddHuman("Human", "Dwell", "Try not to dwell on it.", "vo/npc/male01/answer04.wav" , "vo/npc/female01/answer04.wav");
PLUGIN.voices:AddHuman("Human", "Talk later", "Can we talk about this later?", "vo/npc/male01/answer05.wav" , "vo/npc/female01/answer05.wav");
PLUGIN.voices:AddHuman("Human", "Same here", "Same here.", "vo/npc/male01/answer07.wav" , "vo/npc/female01/answer07.wav");
PLUGIN.voices:AddHuman("Human", "Know", "Know what you mean.", "vo/npc/male01/answer08.wav" , "vo/npc/female01/answer08.wav");
PLUGIN.voices:AddHuman("Human", "Yourself", "You are talkin' to yourself again.", "vo/npc/male01/answer09.wav" , "vo/npc/female01/answer09.wav");
PLUGIN.voices:AddHuman("Human", "Too loud", "I wouldn't say that too loud.", "vo/npc/male01/answer10.wav" , "vo/npc/female01/answer10.wav");
PLUGIN.voices:AddHuman("Human", "One way", "That's... One way looking at it.", "vo/npc/male01/answer15.wav" , "vo/npc/female01/answer15.wav");
PLUGIN.voices:AddHuman("Human", "Shut up", "I'm not even gonna tell you to shut up.", "vo/npc/male01/answer17.wav" , "vo/npc/female01/answer17.wav");
PLUGIN.voices:AddHuman("Human", "More information", "That's more information than I required.", "vo/npc/male01/answer26.wav" , "vo/npc/female01/answer26.wav");
PLUGIN.voices:AddHuman("Human", "Do about it", "What am I supposed to do about it?", "vo/npc/male01/answer29.wav" , "vo/npc/female01/answer29.wav");
PLUGIN.voices:AddHuman("Human", "Right on", "Right on.", "vo/npc/male01/answer32.wav" , "vo/npc/female01/answer32.wav");
PLUGIN.voices:AddHuman("Human", "No argument", "No argument there.", "vo/npc/male01/answer33.wav" , "vo/npc/female01/answer33.wav");
PLUGIN.voices:AddHuman("Human", "Behind you 2", "Behind you!", "vo/npc/male01/behindyou02.wav" , "vo/npc/female01/behindyou02.wav");
PLUGIN.voices:AddHuman("Human", "Oh god", "Oh god!", "vo/npc/male01/gordead_ans04.wav" , "vo/npc/female01/gordead_ans04.wav");
PLUGIN.voices:AddHuman("Human", "Please no", "Please... No!", "vo/npc/male01/gordead_ans06.wav" , "vo/npc/female01/gordead_ans06.wav");
PLUGIN.voices:AddHuman("Human", "Gotta hurt", "If you dare say: That's gotta hurt, I kill you.", "vo/npc/male01/gordead_ans07.wav" , "vo/npc/female01/gordead_ans07.wav");
PLUGIN.voices:AddHuman("Human", "Bury him", "Should we bury him here?", "vo/npc/male01/gordead_ans08.wav" , "vo/npc/female01/gordead_ans08.wav");
PLUGIN.voices:AddHuman("Human", "Spread", "Spread the word.", "vo/npc/male01/gordead_ans10.wav" , "vo/npc/female01/gordead_ans10.wav");
PLUGIN.voices:AddHuman("Human", "Why go on", "Why go on?", "vo/npc/male01/gordead_ans13.wav" , "vo/npc/female01/gordead_ans13.wav");
PLUGIN.voices:AddHuman("Human", "Now what", "Well... Now what?", "vo/npc/male01/gordead_ans15.wav" , "vo/npc/female01/gordead_ans15.wav");
PLUGIN.voices:AddHuman("Human", "Done this", "He's done this before, he'll be okay.", "vo/npc/male01/gordead_ans18.wav" , "vo/npc/female01/gordead_ans18.wav");
PLUGIN.voices:AddHuman("Human", "Sick", "I'm gonna be sick.", "vo/npc/male01/gordead_ans19.wav" , "vo/npc/female01/gordead_ans19.wav");
PLUGIN.voices:AddHuman("Human", "Dead", "He's dead.", "vo/npc/male01/gordead_ques01.wav" , "vo/npc/male01/gordead_ques01.wav");
PLUGIN.voices:AddHuman("Human", "Look dead", "Look! He's dead.", "vo/npc/male01/gordead_ques07.wav" , "vo/npc/female01/gordead_ques07.wav");
PLUGIN.voices:AddHuman("Human", "Bad", "This is bad.", "vo/npc/male01/gordead_ques10.wav" , "vo/npc/female01/gordead_ques10.wav");
PLUGIN.voices:AddHuman("Human", "End", "It's not supposed to end like this!", "vo/npc/male01/gordead_ques14.wav" , "vo/npc/female01/gordead_ques14.wav");
PLUGIN.voices:AddHuman("Human", "Invincible", "I thought he was invincible!", "vo/npc/male01/gordead_ques11.wav" , "vo/npc/female01/gordead_ques11.wav");
PLUGIN.voices:AddHuman("Human", "Oh no", "Oh no!", "vo/npc/male01/ohno.wav" , "vo/npc/female01/ohno.wav");
PLUGIN.voices:AddHuman("Human", "Pain", "Ough!", "vo/npc/male01/pain07.wav" , "vo/npc/female01/pain07.wav");
PLUGIN.voices:AddHuman("Human", "Pain 2", "Argh!", "vo/npc/male01/pain09.wav" , "vo/npc/female01/pain09.wav");
PLUGIN.voices:AddHuman("Human", "Pain 3", "Ugh!", "vo/npc/male01/pain08.wav" , "vo/npc/female01/pain08.wav");
PLUGIN.voices:AddHuman("Human", "Allover", "When this is all over I'm... Nah who am I kidding?", "vo/npc/male01/question04.wav" , "vo/npc/female01/question04.wav");
PLUGIN.voices:AddHuman("Human", "Cheese", "Sometimes, I dream about cheese.", "vo/npc/male01/question06.wav" , "vo/npc/female01/question06.wav");
PLUGIN.voices:AddHuman("Human", "Freedom", "You smell that? It's freedom.", "vo/npc/male01/question07.wav" , "vo/npc/female01/question07.wav");
PLUGIN.voices:AddHuman("Human", "Worse", "Looks to me things are getting worse, not better.", "vo/npc/male01/question12.wavv" , "vo/npc/female01/question12.wav");
PLUGIN.voices:AddHuman("Human", "Reminds", "I'm not even gonna tell you what that reminds me of.", "vo/npc/male01/question14.wav" , "vo/npc/female01/question14.wav");
PLUGIN.voices:AddHuman("Human", "Bad memory", "Someday... This all will be a bad memory.", "vo/npc/male01/question20.wav" , "vo/npc/female01/question20.wav");
PLUGIN.voices:AddHuman("Human", "This tune", "I can't get this tune ouf ot my head... *Whistles*", "vo/npc/male01/question23.wav" , "vo/npc/female01/question23.wav");
PLUGIN.voices:AddHuman("Human", "Bullshit", "This is bullshit.", "vo/npc/male01/question26.wav" , "vo/npc/female01/question26.wav");
PLUGIN.voices:AddHuman("Human", "Ready when", "Ready when you are!", "vo/npc/male01/readywhenyouare01.wav" , "vo/npc/female01/readywhenyouare01.wav");
PLUGIN.voices:AddHuman("Human", "Startled", "Huh!?", "vo/npc/male01/startle01.wav" , "vo/npc/female01/startle01.wav");
PLUGIN.voices:AddHuman("Human", "Startled 2", "Huh!?", "vo/npc/male01/startle02.wav" , "vo/npc/female01/startle02.wav");
PLUGIN.voices:AddHuman("Human", "Watch what", "Watch what you're doing!", "vo/npc/male01/watchwhat.wav" , "vo/npc/female01/watchwhat.wav");
PLUGIN.voices:AddHuman("Human", "How are they", "How are they getting in to the city!?", "vo/episode_1/npc/male01/cit_alert_antlions04.wav" , "vo/episode_1/npc/female01/cit_alert_antlions04.wav");
PLUGIN.voices:AddHuman("Human", "First", "First the combine, now this!", "vo/episode_1/npc/male01/cit_alert_antlions15.wav" , "vo/episode_1/npc/female01/cit_alert_antlions15.wav");
PLUGIN.voices:AddHuman("Human", "Damn these", "Damn these things!", "vo/episode_1/npc/male01/cit_alert_antlions18.wav" , "vo/episode_1/npc/female01/cit_alert_antlions18.wav");
PLUGIN.voices:AddHuman("Human", "That thing", "That thing's gonna chew us up!", "vo/episode_1/npc/male01/cit_alert_gunship07.wav" , "vo/episode_1/npc/female01/cit_alert_gunship07.wav");
PLUGIN.voices:AddHuman("Human", "For us", "It's coming for us!", "vo/episode_1/npc/male01/cit_alert_gunship02.wav" , "vo/episode_1/npc/female01/cit_alert_gunship02.wav");
PLUGIN.voices:AddHuman("Human", "Thats headcrab", "So that's a headcrab... Heh...", "vo/episode_1/npc/male01/cit_alert_head02.wav" , "vo/episode_1/npc/female01/cit_alert_head02.wav");
PLUGIN.voices:AddHuman("Human", "Get it off", "Get it off me! Get it off!", "vo/episode_1/npc/male01/cit_alert_head03.wav" , "vo/episode_1/npc/female01/cit_alert_head03.wav");
PLUGIN.voices:AddHuman("Human", "Shit", "Shit!", "vo/episode_1/npc/male01/cit_alert_head06.wav" , "vo/episode_1/npc/female01/cit_alert_head06.wav");
PLUGIN.voices:AddHuman("Human", "Targets", "We are all just targets to them now.", "vo/episode_1/npc/male01/cit_alert_soldier01.wav" , "vo/episode_1/npc/female01/cit_alert_soldier01.wav");
PLUGIN.voices:AddHuman("Human", "Overwatch", "Overwatch soldiers!", "vo/episode_1/npc/male01/cit_alert_soldier05.wav" , "vo/episode_1/npc/female01/cit_alert_soldier05.wav");
PLUGIN.voices:AddHuman("Human", "Traitors", "Traitors!", "vo/episode_1/npc/male01/cit_alert_soldier07.wav" , "vo/episode_1/npc/female01/cit_alert_soldier07.wav");
PLUGIN.voices:AddHuman("Human", "Above", "They are coming from above!", "vo/episode_1/npc/male01/cit_alert_soldier_above.wav" , "vo/episode_1/npc/female01/cit_alert_soldier_above.wav");
PLUGIN.voices:AddHuman("Human", "Im next", "Oh god... I'm next... I just know it...", "vo/episode_1/npc/male01/cit_buddykilled02.wav" , "vo/episode_1/npc/female01/cit_buddykilled02.wav");
PLUGIN.voices:AddHuman("Human", "Oh shit", "Oh shit!", "vo/episode_1/npc/male01/cit_buddykilled07.wav" , "vo/episode_1/npc/female01/cit_buddykilled07.wav");
PLUGIN.voices:AddHuman("Human", "Man down", "Man down!", "vo/episode_1/npc/male01/cit_buddykilled08.wav" , "vo/episode_1/npc/female01/cit_buddykilled08.wav");
PLUGIN.voices:AddHuman("Human", "Mistake", "I think we made a terrible mistake!", "vo/episode_1/npc/male01/cit_buddykilled10.wav" , "vo/episode_1/npc/female01/cit_buddykilled10.wav");
PLUGIN.voices:AddHuman("Human", "Gonna die", "We are all gonna die!", "vo/episode_1/npc/male01/cit_buddykilled11.wav" , "vo/episode_1/npc/female01/cit_buddykilled11.wav");
PLUGIN.voices:AddHuman("Human", "Pissed", "That's it... I'm pissed!", "vo/episode_1/npc/male01/cit_buddykilled12.wav" , "vo/episode_1/npc/female01/cit_buddykilled12.wav");
PLUGIN.voices:AddHuman("Human", "New guy", "They killed the new guy!", "vo/episode_1/npc/male01/cit_buddykilled13.wav" , "vo/episode_1/npc/female01/cit_buddykilled13.wav");
PLUGIN.voices:AddHuman("Human", "Here", "Come here!", "vo/episode_1/npc/male01/cit_comehere.wav" , "vo/episode_1/npc/female01/cit_comehere.wav");
PLUGIN.voices:AddHuman("Human", "Dying", "They're dying all around me!", "vo/episode_1/npc/male01/cit_evac_casualty02.wav" , "vo/episode_1/npc/female01/cit_evac_casualty02.wav");
PLUGIN.voices:AddHuman("Human", "Was close", "Oh! God! That was close!", "vo/episode_1/npc/male01/cit_evac_casualty06.wav" , "vo/episode_1/npc/female01/cit_evac_casualty06.wav");
PLUGIN.voices:AddHuman("Human", "Another one", "Lost another one!", "vo/episode_1/npc/male01/cit_evac_casualty03.wav" , "vo/episode_1/npc/female01/cit_evac_casualty03.wav");
PLUGIN.voices:AddHuman("Human", "Help 2", "Heeeeeeelp!", "vo/episode_1/npc/male01/cit_evac_casualty08.wav" , "vo/episode_1/npc/female01/cit_evac_casualty08.wav");
PLUGIN.voices:AddHuman("Human", "Hopeless", "It's hopeless!", "vo/episode_1/npc/male01/cit_evac_casualty09.wav" , "vo/episode_1/npc/female01/cit_evac_casualty09.wav");
PLUGIN.voices:AddHuman("Human", "Holy crap", "Holy crap, help!", "vo/episode_1/npc/male01/cit_evac_casualty11.wav" , "vo/episode_1/npc/female01/cit_evac_casualty11.wav");
PLUGIN.voices:AddHuman("Human", "Get out", "We gotta get out of here!", "vo/episode_1/npc/male01/cit_evac_defendus06.wav" , "vo/episode_1/npc/female01/cit_evac_defendus06.wav");
PLUGIN.voices:AddHuman("Human", "Get off street", "Come on get off the street, the combine's moving in to this area!", "vo/episode_1/npc/male01/cit_getoffstreet.wav" , "vo/episode_1/npc/female01/cit_getoffstreet.wav");
PLUGIN.voices:AddHuman("Human", "Gunship", "Oh no... Gunship! Run!", "vo/episode_1/npc/male01/cit_gunship.wav" , "vo/episode_1/npc/female01/cit_gunship.wav");
PLUGIN.voices:AddHuman("Human", "Hurry up", "Hurry up!", "vo/episode_1/npc/male01/cit_hurryup.wav" , "vo/episode_1/npc/female01/cit_hurryup.wav");
PLUGIN.voices:AddHuman("Human", "Jump", "Jump!", "vo/episode_1/npc/male01/cit_jump.wav" , "vo/episode_1/npc/female01/cit_jump.wav");
PLUGIN.voices:AddHuman("Human", "Raid", "It's a raid!", "vo/episode_1/npc/male01/cit_itsaraid.wav" , "vo/episode_1/npc/female01/cit_itsaraid.wav");
PLUGIN.voices:AddHuman("Human", "Yeah 2", "Yeah!", "vo/episode_1/npc/male01/cit_kill01.wav" , "vo/episode_1/npc/female01/cit_kill01.wav");
PLUGIN.voices:AddHuman("Human", "Rot in hell", "Rot in hell! If you believe in that sort of thing.", "vo/episode_1/npc/male01/cit_kill16.wav" , "vo/episode_1/npc/female01/cit_kill16.wav");
PLUGIN.voices:AddHuman("Human", "Resistance", "One for the resistance.", "vo/episode_1/npc/male01/cit_kill15.wav" , "vo/episode_1/npc/female01/cit_kill15.wav");
PLUGIN.voices:AddHuman("Human", "Die", "Die!", "vo/episode_1/npc/male01/cit_kill14.wav" , "vo/episode_1/npc/female01/cit_kill14.wav");
PLUGIN.voices:AddHuman("Human", "Take that", "Take that!", "vo/episode_1/npc/male01/cit_kill09.wav" , "vo/episode_1/npc/female01/cit_kill09.wav");
PLUGIN.voices:AddHuman("Human", "Soldiers", "Soldiers!", "vo/episode_1/npc/male01/cit_raidsoldiers.wav" , "vo/episode_1/npc/female01/cit_raidsoldiers.wav");
PLUGIN.voices:AddHuman("Human", "Better", "Somehow I thought things will be better by now.", "vo/episode_1/npc/male01/cit_remarks05.wav" , "vvo/episode_1/npc/male01/cit_remarks05.wav");
PLUGIN.voices:AddHuman("Human", "Babies", "I heard they put babies in those striders.", "vo/episode_1/npc/male01/cit_remarks10.wav" , "vo/episode_1/npc/female01/cit_remarks10.wav");
PLUGIN.voices:AddHuman("Human", "Not going", "I'm not going nowhere... no sir.", "vo/episode_1/npc/male01/cit_remarks15.wav" , "vo/episode_1/npc/female01/cit_remarks15.wav");
PLUGIN.voices:AddHuman("Human", "Every doctor", "Sometimes I think everyone is a doctor but me.", "vo/episode_1/npc/male01/cit_remarks21.wav" , "vo/episode_1/npc/female01/cit_remarks21.wav");
PLUGIN.voices:AddHuman("Human", "Vortigaunts", "Between you and me: I don't trust those vortigaunts.", "vo/episode_1/npc/male01/cit_remarks17.wav" , "vo/episode_1/npc/female01/cit_remarks17.wav");
PLUGIN.voices:AddHuman("Human", "Everybody", "Is that everybody?", "vo/episode_1/npc/male01/cit_thateverybody.wav" , "vo/episode_1/npc/female01/cit_thateverybody.wav");
PLUGIN.voices:AddHuman("Human", "This way", "This way.", "vo/episode_1/npc/male01/cit_thisway.wav" , "vo/episode_1/npc/female01/cit_thisway.wav");
PLUGIN.voices:AddHuman("Human", "Found us", "They found us!", "vo/episode_1/npc/male01/cit_theyfoundus.wav" , "vo/episode_1/npc/female01/cit_theyfoundus.wav");
PLUGIN.voices:AddHuman("Human", "Run for it", "Run for it!", "vo/episode_1/npc/male01/cit_runforit.wav" , "vo/episode_1/npc/female01/cit_runforit.wav");
PLUGIN.voices:AddHuman("Human", "You trough", "Okay we let you trough.", "vo/episode_1/npc/male01/cit_letyouthru.wav" , "vo/episode_1/npc/female01/cit_letyouthru.wav");
PLUGIN.voices:AddHuman("Human", "Kill it", "Kill it!", "vo/episode_1/npc/male01/cit_alert_zombie04.wav" , "vo/episode_1/npc/female01/cit_alert_zombie04.wav");

if (CLIENT) then
	table.sort(PLUGIN.voices.stored.humanVoices, function(a, b) return a.command < b.command; end);
	
	for k, v in pairs(PLUGIN.voices.stored.humanVoices) do
		Clockwork.directory:AddCode("Human", [[
			<div class="auraInfoTitle">]]..string.upper(v.command)..[[</div>
			<div class="auraInfoText">]]..v.phrase..[[</div>
		]], true);
	end;
end;