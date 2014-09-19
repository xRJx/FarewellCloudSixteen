Clockwork.kernel:IncludePrefixed("cl_schema.lua");
Clockwork.kernel:IncludePrefixed("sv_schema.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_theme.lua");

Clockwork.option:SetKey("default_date", {month = 1, year = 2023, day = 1});
Clockwork.option:SetKey("default_time", {minute = 0, hour = 0, day = 1});
Clockwork.option:SetKey("format_singular_cash", "%a");
Clockwork.option:SetKey("model_shipment", "models/items/item_item_crate.mdl");
Clockwork.option:SetKey("intro_image", "swrp/swrp");
Clockwork.option:SetKey("schema_logo", "swrp/swrp_logo");
Clockwork.option:SetKey("format_cash", "%a %n");

Clockwork.option:SetKey("menu_music", "music/hl1_song3.mp3");
Clockwork.option:SetKey("name_cash", "Credits");
Clockwork.option:SetKey("model_cash", "models/props_lab/box01a.mdl");
Clockwork.option:SetKey("gradient", "swrp/bg_gradient");

Clockwork.config:ShareKey("intro_text_small");
Clockwork.config:ShareKey("intro_text_big");

Clockwork.quiz:SetEnabled(true);
Clockwork.quiz:AddQuestion("Do you understand that roleplaying is slow paced and relaxed?", 1, "Yes.", "No.");
Clockwork.quiz:AddQuestion("Can you type properly, using capital letters and full-stops?", 2, "yes i can", "Yes, I can.");
Clockwork.quiz:AddQuestion("You do not need weapons to roleplay, do you understand?", 1, "Yes.", "No.");
Clockwork.quiz:AddQuestion("You do not need items to roleplay, do you understand?", 1, "Yes.", "No.");
Clockwork.quiz:AddQuestion("What do you think serious roleplaying is about?", 2, "Collecting items and upgrades.", "Developing your character.");
Clockwork.quiz:AddQuestion("What universe is this roleplaying game set in?", 2, "Real Life.", "Half-Life.", "Star Wars.");

Clockwork.flag:Add("v", "Light Blackmarket", "Access to light blackmarket goods.");
Clockwork.flag:Add("V", "Heavy Blackmarket", "Access to heavy blackmarket goods.");

-- A function to check if a string is a Combine division.
function Schema:IsStringCloneDivision(text, division)
	if (type(division) == "table") then
		for k, v in ipairs(division) do
			if (self:IsStringCloneDivision(text, v)) then
				return true;
			end;
		end;
	else
		return string.find(text, "%p"..division.."%p");
	end;
end;

-- A function to check if a player is a Combine division.
function Schema:IsPlayerCloneDivision(player, division, realDivision)
	local name = player:Name();
	local faction = player:GetFaction();
	
	if (self:IsCloneFaction(faction)) then
		if (type(division) == "table") then
			for k, v in ipairs(division) do
				if (self:IsPlayerCloneDivision(player, v, realDivision)) then
					return true;
				end;
			end;
		else
			return string.find(name, "%p"..division.."%p");
		end;
	end;
end;

-- A function to check if a string is a Combine rank.
function Schema:IsStringCloneRank(text, rank)
	if (type(rank) == "table") then
		for k, v in ipairs(rank) do
			if (self:IsStringCloneRank(text, v)) then
				return true;
			end;
		end;
	else
		return string.find(text, "%p"..rank.."%p");
	end;
end;

-- A function to check if a player is a Combine rank.
function Schema:IsPlayerCloneRank(player, rank, realRank)
	local name = player:Name();
	local faction = player:GetFaction();
	
	if (self:IsCloneFaction(faction)) then
		if (type(rank) == "table") then
			for k, v in ipairs(rank) do
				if (self:IsPlayerCloneRank(player, v, realRank)) then
					return true;
				end;
			end;
		else
			return string.find(name, "%p"..rank.."%p");
		end;
	end;
end;

-- A function to get a player's Combine rank.
function Schema:GetPlayerCloneRank(player)
	local faction = player:GetFaction();
	
	if (faction == FACTION_CLONE) then
		if (self:IsPlayerCloneRank(player, "PVT")) then
			return 0;
		elseif (self:IsPlayerCloneRank(player, "TRP")) then
			return 1;
		elseif (self:IsPlayerCloneRank(player, "SGT")) then
			return 2;
		elseif (self:IsPlayerCloneRank(player, "LT")) then
			return 3;
		elseif (self:IsPlayerCloneRank(player, "MAJ")) then
			return 4;
		elseif (self:IsPlayerCloneRank(player, "CPT")) then
			return 5;
		elseif (self:IsPlayerCloneRank(player, "CMD")) then
			return 6;
		else
			return 7;
		end;
	end;
end;

-- A function to get if a faction is Human.
function Schema:IsCloneFaction(faction)
	return (faction == FACTION_CLONE);
end;