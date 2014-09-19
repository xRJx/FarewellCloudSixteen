Schema.combineOverlay = Material("effects/combine_binocoverlay");

Schema.randomDisplayLines = {
	"Hashing priorities...",
	"Connection to Universal Union database has failed...",
	"Failed to parse sociostability status...",
	"Recovering lost data packet...",
	"DASH, MIDNIGHT, SACRIFICE, SHIELD...",
	"Physical aptitude degrading...",
	"Registering compromised structural integrity...",
	"Retrieving fragmented directives..."
};

Clockwork.config:AddToSystem("Small intro text", "intro_text_small", "The small text displayed for the introduction.");
Clockwork.config:AddToSystem("Big intro text", "intro_text_big", "The big text displayed for the introduction.");

Clockwork.datastream:Hook("FirstSpawnIntro", function()
	local player = LocalPlayer();
	startSound = CreateSound(player, "ambient/materials/metal5.wav");
	ashes = CreateSound(player, "vo/gman_misc/gman_04.wav");
	ashes:Play();
	ashes:ChangeVolume(0, 0);
	startSound:Play();
	startSound:ChangeVolume(0.6, 0);
	
	timer.Simple(3.05, function()
		ashes:ChangeVolume(0.6, 0);
		
		timer.Simple(5, function()
			endSound = CreateSound(player, "ambient/materials/metal4.wav");
			endSound:Play();
			endSound:ChangeVolume(0.6, 0);
			
			timer.Simple(3, function()
				startSound:Stop();
				ashes:Stop();
				endSound:Stop();
			end);
		end);
	end);
end);

Clockwork.datastream:Hook("CombineDisplayLine", function(data)
	Schema:AddCombineDisplayLine(data[1], data[2]);
end);

-- A function to add a Combine display line.
function Schema:AddCombineDisplayLine(text, color)
	if (self:PlayerIsCombine(Clockwork.Client)) then
		if (!self.combineDisplayLines) then
			self.combineDisplayLines = {};
		end;
		
		table.insert(self.combineDisplayLines, {"<:: "..text, CurTime() + 8, 5, color});
	end;
end;

-- A function to get whether a player is Combine.
function Schema:PlayerIsCombine(player, bHuman)
	if (!IsValid(player)) then
		return;
	end;

	local faction = player:GetFaction();
	
	if (self:IsCombineFaction(faction)) then
		if (!bHuman or bHuman == true) then
			return true;
		end;
	end;
end;

-- A function to get whether a player is Combine.
function Schema:PlayerIsHuman(player, bHuman)
	if (!IsValid(player)) then
		return;
	end;

	local faction = player:GetFaction();
	
	if (self:IsHumanFaction(faction)) then
		if (faction == FACTION_SURVIVOR) then
			return true;
		else
			return false;
		end;
	end;
end;

-- A function to get whether a player is Vortigaunt.
function Schema:PlayerIsVortigaunt(player)
	if (!IsValid(player)) then
		return;
	end;

	local faction = player:GetFaction();
	
	if (Schema:IsVortigauntFaction(faction)) then
		if (faction == FACTION_VORT) then
			return true;
		else
			return false;
		end;
	end;
end;