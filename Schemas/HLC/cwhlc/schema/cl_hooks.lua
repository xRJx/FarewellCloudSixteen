-- Called when the client initializes.
function Schema:Initialize()
	Clockwork.Client:SetNWBool("initiallySpawned", false);
end;

-- Called when screen space effects should be rendered.
function Schema:RenderScreenspaceEffects()
	if (!Clockwork.kernel:IsScreenFadedBlack()) then
		if (self:PlayerIsCombine(Clockwork.Client)) then
			render.UpdateScreenEffectTexture();
			
			self.combineOverlay:SetFloat("$refractamount", 0.3);
			self.combineOverlay:SetFloat("$envmaptint", 0);
			self.combineOverlay:SetFloat("$envmap", 0);
			self.combineOverlay:SetFloat("$alpha", 0.5);
			self.combineOverlay:SetInt("$ignorez", 1);
			
			render.SetMaterial(self.combineOverlay);
			render.DrawScreenQuad();
		end;
	end;
end;

-- Called when an entity's menu options are needed.
function Schema:GetEntityMenuOptions(entity, options)
	if (entity:GetClass() == "cw_breach") then
		options["Charge"] = "cw_breachCharge";
	end;
end;

-- Called when the cinematic intro info is needed.
function Schema:GetCinematicIntroInfo()
	return {
		credits = "DESIGNED AND DEVELOPED BY "..self:GetAuthor()..".",
		title = Clockwork.config:Get("intro_text_big"):Get(),
		text = Clockwork.config:Get("intro_text_small"):Get()
	};
end;

-- Called when the scoreboard's class players should be sorted.
function Schema:ScoreboardSortClassPlayers(class, a, b)
	if (class == "Overwatch" or class == "Overwatch (Admin View)") then
		local rankA = self:GetPlayerCombineRank(a);
		local rankB = self:GetPlayerCombineRank(b);
		
		if (rankA == rankB) then
			return a:Name() < b:Name();
		else
			return rankA > rankB;
		end;
	end;
	
	if (class == "Global Military Coalition") then
		local rankC = self:GetPlayerGmcRank(a);
		local rankD = self:GetPlayerGmcRank(b);
		
		if (rankC == rankD) then
			return a:Name() < b:Name();
		else
			return rankC > rankD;
		end;
	end;
end;

-- Called when a player's scoreboard class is needed.
function Schema:GetPlayerScoreboardClass(player)
	local faction = player:GetFaction();
	
	if (faction == FACTION_GMC) then
		return "Global Military Coalition";
	elseif (faction == FACTION_OTA or faction == FACTION_SYNTH) then
		if (Schema:PlayerIsCombine(Clockwork.Client)) then
			return "Overwatch";
		elseif (Clockwork.Client:IsAdmin() and !Schema:PlayerIsCombine(Clockwork.Client)) then
			return "Overwatch (Admin View)";
		else
			return false;
		end;
	elseif (faction == FACTION_SURVIVOR) then
		return "Survivor";
	elseif (faction == FACTION_VORT) then
		return "Vortigaunt";
	end;
end;

-- Called when the local player attempts to zoom.
function Schema:PlayerCanZoom()
	if (!self:PlayerIsCombine(Clockwork.Client)) then
		return false;
	end;
end;

-- Called when the local player's default color modify should be set.
function Schema:PlayerSetDefaultColorModify(colorModify)
	colorModify["$pp_colour_brightness"] = -0.03;
	colorModify["$pp_colour_contrast"] = 1.1;
	colorModify["$pp_colour_colour"] = 0.4;
end;

-- Called when the local player attempts to see a class.
function Schema:PlayerCanSeeClass(class)
	if (class.index == CLASS_CMD and !self:IsPlayerCombineRank(Clockwork.Client, "CmD")) then
		return false;
	elseif (class.index == CLASS_OWS and !self:IsPlayerCombineRank(Clockwork.Client, "OWS")) then
		return false;
	elseif (class.index == CLASS_EOW and !self:IsPlayerCombineRank(Clockwork.Client, "EOW")) then
		return false;
	
	-- GMC Classes
	elseif (class.index == CLASS_RECRUIT and !self:IsPlayerGmcRank(Clockwork.Client, "Pvt")) then
			return false;
	elseif (class.index == CLASS_ENLISTED and !self:IsPlayerGmcRank(Clockwork.Client, {"Cpl", "Sgt"})) then
			return false;
	elseif (class.index == CLASS_OFFICER and !self:IsPlayerGmcRank(Clockwork.Client, {"Lt", "Cpt", "Maj", "Col"})) then
			return false;
	elseif (class.index == CLASS_GENERAL and !self:IsPlayerGmcRank(Clockwork.Client, "Gen")) then
		return false;
	end;
end;

-- Called when a player's footstep sound should be played.
function Schema:PlayerFootstep(player, position, foot, sound, volume, recipientFilter)
	if (player:Crouching() == false) then
		return true;
	end;
end;

-- Called when the player info text is needed.
function Schema:GetPlayerInfoText(playerInfoText)
	local citizenID = Clockwork.Client:GetSharedVar("citizenID");
	
	if (citizenID) then
		if (Clockwork.Client:GetFaction() == FACTION_SURVIVOR) then
			playerInfoText:Add("CITIZEN_ID", "Citizen ID: #"..citizenID);
		end;
	end;
end;

-- Called to check if a player does recognise another player.
function Schema:PlayerDoesRecognisePlayer(player, status, isAccurate, realValue)
	if (self:PlayerIsCombine(player)) then
		return true;
	end;
end;