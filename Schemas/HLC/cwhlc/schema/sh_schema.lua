Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_schema.lua");
Clockwork.kernel:IncludePrefixed("cl_theme.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_schema.lua");

Clockwork.option:SetKey("default_date", {month = 1, year = 2023, day = 1});
Clockwork.option:SetKey("default_time", {minute = 0, hour = 0, day = 1});
Clockwork.option:SetKey("format_singular_cash", "%a");
Clockwork.option:SetKey("model_shipment", "models/props_junk/cardboard_box002a.mdl");
Clockwork.option:SetKey("intro_image", "hlc/hlc");
Clockwork.option:SetKey("schema_logo", "hlc/hlc_logo");
Clockwork.option:SetKey("format_cash", "%a %n");

Clockwork.option:SetKey("menu_music", "music/hl1_song3.mp3");
Clockwork.option:SetKey("name_cash", "Tokens");
Clockwork.option:SetKey("model_cash", "models/props_lab/box01a.mdl");
Clockwork.option:SetKey("gradient", "hlc/bg_gradient");

Clockwork.config:ShareKey("intro_text_small");
Clockwork.config:ShareKey("intro_text_big");

Clockwork.quiz:SetEnabled(true);

Clockwork.quiz:AddQuestion("Do you have enough common sense to distinguish between correct and incorrect roleplaying?", 1, "Yes.", "No.");
Clockwork.quiz:AddQuestion("You don't need items to roleplay, but having them enhances roleplay.", 2, "Can I have an RPG now?", "Okay.");
Clockwork.quiz:AddQuestion("Can you maintain a mature and calm composure when things don't go your way?", 1, "Yes.", "No.");
Clockwork.quiz:AddQuestion("Will you report rule breakers instead of intervening yourself?", 1, "Yes. I can do this by using the /report command.", "No.");
Clockwork.quiz:AddQuestion("Can you read?", 1, "Yes.", "AwhguaguhaeeaHBNGGS qwfe");
Clockwork.quiz:AddQuestion("Did you know our website is http://Precinct-Thirteen.com?", 2, "I can't read.", "Yes.");
Clockwork.quiz:AddQuestion("What is most important to character development?", 3, "Items.", "What other people do.", "The character.", "Finding one's self.");

-- Default quiz questions:
Clockwork.quiz:AddQuestion("Do you understand that roleplaying is slow paced and relaxed?", 1, "Yes.", "No.");
Clockwork.quiz:AddQuestion("Can you type properly, using capital letters and full-stops?", 2, "yes i can", "Yes, I can.");
Clockwork.quiz:AddQuestion("You do not need weapons to roleplay, do you understand?", 1, "Yes.", "No.");
Clockwork.quiz:AddQuestion("You do not need items to roleplay, do you understand?", 1, "Yes.", "No.");
Clockwork.quiz:AddQuestion("What do you think serious roleplaying is about?", 2, "Collecting items and upgrades.", "Developing your character.");
Clockwork.quiz:AddQuestion("What universe is this roleplaying game set in?", 2, "Real Life.", "Half-Life.");

Clockwork.flag:Add("v", "Light Blackmarket", "Access to light blackmarket goods.");
Clockwork.flag:Add("V", "Heavy Blackmarket", "Access to heavy blackmarket goods.");

-- A function to check if a string is a Combine rank.
function Schema:IsStringCombineRank(text, rank)
	if (type(rank) == "table") then
		for k, v in ipairs(rank) do
			if (self:IsStringCombineRank(text, v)) then
				return true;
			end;
		end;
	else
		return string.find(text, "%p"..rank.."%p");
	end;
end;

-- A function to check if a player is a Combine rank.
function Schema:IsPlayerCombineRank(player, rank, realRank)
	local name = player:Name();
	local faction = player:GetFaction();
	
	if (self:IsCombineFaction(faction)) then
		if (type(rank) == "table") then
			for k, v in ipairs(rank) do
				if (self:IsPlayerCombineRank(player, v, realRank)) then
					return true;
				end;
			end;
		else
			return string.find(name, "%p"..rank.."%p");
		end;
	end;
end;

-- A function to get a player's Combine rank.
function Schema:GetPlayerCombineRank(player)
	local faction = player:GetFaction();
	
	if (faction == FACTION_OTA) then
		if (self:IsPlayerCombineRank(player, "OWS")) then
			return 1;
		elseif (self:IsPlayerCombineRank(player, "EOW")) then
			return 2;
		elseif (self:IsPlayerCombineRank(player, "CmD")) then
			return 3;
		else
			return 4;
		end;
	elseif (faction == FACTION_SYNTH) then
		return 0;
	end;
end;

-- A function to check if a string is a Combine rank.
function Schema:IsStringGmcRank(text, rank)
	if (type(rank) == "table") then
		for k, v in ipairs(rank) do
			if (self:IsStringGmcRank(text, v)) then
				return true;
			end;
		end;
	else
		return string.find(text, rank.."%p");
	end;
end;

-- A function to check if a player is a Combine rank.
function Schema:IsPlayerGmcRank(player, rank, realRank)
	local name = player:Name();
	local faction = player:GetFaction();
	
	if (self:IsHumanFaction(faction)) then
		if (type(rank) == "table") then
			for k, v in ipairs(rank) do
				if (self:IsPlayerGmcRank(player, v, realRank)) then
					return true;
				end;
			end;
		else
			return string.find(name, rank.."%p");
		end;
	end;
end;

-- A function to get a player's Combine rank.
function Schema:GetPlayerGmcRank(player)
	local faction = player:GetFaction();
	
	if (faction == FACTION_GMC) then
		if (self:IsPlayerGmcRank(player, "Pvt")) then
			return 0;
		elseif (self:IsPlayerGmcRank(player, "Cpl")) then
			return 1;
		elseif (self:IsPlayerGmcRank(player, "Sgt")) then
			return 2;
		elseif (self:IsPlayerGmcRank(player, "Lt")) then
			return 3;
		elseif (self:IsPlayerGmcRank(player, "Cpt")) then
			return 4;
		elseif (self:IsPlayerGmcRank(player, "Maj")) then
			return 5;
		elseif (self:IsPlayerGmcRank(player, "Col")) then
			return 6;
		elseif (self:IsPlayerGmcRank(player, "Gen")) then
			return 7;
		else
			return 8;
		end;
	end;
end;

-- A function to get if a faction is Combine.
function Schema:IsCombineFaction(faction)
	return (faction == FACTION_OTA or faction == FACTION_SYNTH);
end;

-- A function to get if a faction is Human.
function Schema:IsHumanFaction(faction)
	return (faction == FACTION_GMC or faction == FACTION_SURVIVOR);
end;

-- A function to get if a faction is Vortigaunt.
function Schema:IsVortigauntFaction(faction)
	return (faction == FACTION_VORT);
end;