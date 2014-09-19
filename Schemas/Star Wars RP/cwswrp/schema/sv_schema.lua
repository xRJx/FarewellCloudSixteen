--Clockwork.kernel:AddFile("resource/fonts/FontName.ttf");

Clockwork.kernel:AddDirectory("materials/swrp/");

Clockwork.config:Add("intro_text_small", "Welcome to the front.", true);
Clockwork.config:Add("intro_text_big", "Star Wars Roleplay", true);

-- A function to add a human hint.
function Clockwork.hint:AddHumanHint(name, text, combine)
	Clockwork.hint:Add(name, text);
end;

Clockwork.hint:AddHumanHint("Life", "Your character is only human, refrain from jumping off high ledges.", false);
Clockwork.hint:AddHumanHint("Sleep", "Don't forget to sleep, your character does get tired.", false);
Clockwork.hint:AddHumanHint("Eating", "Just because you don't have to eat, it doesn't mean your character isn't hungry.", false);

Clockwork.hint:Add("Admins", "The admins are here to help you, please respect them.");
Clockwork.hint:Add("Action", "Action. Stop looking for it, wait until it comes to you.");
Clockwork.hint:Add("Grammar", "Try to speak correctly in-character, and don't use emoticons.");
Clockwork.hint:Add("Running", "Got somewhere to go? Fancy a run? Well don't, it's uncivilized.");
Clockwork.hint:Add("Healing", "You can heal players by using the Give command in your inventory.");
Clockwork.hint:Add("F3 Hotkey", "Press F3 while looking at a character to use a zip tie.");
Clockwork.hint:Add("F4 Hotkey", "Press F3 while looking at a tied character to search them.");
Clockwork.hint:Add("Attributes", "Whoring *(name_attributes)* is a permanant ban, we don't recommend it.");
Clockwork.hint:Add("Firefights", "When engaged in a firefight, shoot to miss to make it enjoyable.");
Clockwork.hint:Add("Metagaming", "Metagaming is when you use OOC information in-character.");
Clockwork.hint:Add("Passive RP", "If you're bored and there's no action, try some passive roleplay.");
Clockwork.hint:Add("Development", "Develop your character, give them a story to tell.");
Clockwork.hint:Add("Powergaming", "Powergaming is when you force your actions on others.");