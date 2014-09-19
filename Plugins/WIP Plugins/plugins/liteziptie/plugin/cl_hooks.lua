local PLUGIN = PLUGIN;

-- Called when the target's status should be drawn.
function PLUGIN:DrawTargetPlayerStatus(target, alpha, x, y)
	local informationColor = Clockwork.option:GetColor("information");
	local thirdPerson = "him";
	local mainStatus;
	local untieText;
	local gender = "He";
	local action = Clockwork.player:GetAction(target);
	
	if (target:GetGender() == GENDER_FEMALE) then
		thirdPerson = "her";
		gender = "She";
	end;
	
	if (target:Alive()) then
		if (target:GetSharedVar("tied") != 0) then
			if (Clockwork.player:GetAction(Clockwork.Client) == "untie") then
				mainStatus = gender.. " is being untied.";
			else
				local untieText;
				
				if (target:GetShootPos():Distance( Clockwork.Client:GetShootPos() ) <= 192) then
					if (Clockwork.Client:GetSharedVar("tied") == 0) then
						mainStatus = "Press :+use: to untie "..thirdPerson..".";
						
						untieText = true;
					end;
				end;
				
				if (!untieText) then
					mainStatus = gender.." has been tied up.";
				end;
			end;
		elseif (Clockwork.player:GetAction(Clockwork.Client) == "tie") then
			mainStatus = gender.." is being tied up.";
		end;
		
		if (mainStatus) then
			y = Clockwork.kernel:DrawInfo(Clockwork.kernel:ParseData(mainStatus), x, y, informationColor, alpha);
		end;
		
		return y;
	end;
end;

-- Called to get the screen text info.
function PLUGIN:GetScreenTextInfo()
	local blackFadeAlpha = Clockwork.kernel:GetBlackFadeAlpha();
	
	if (Clockwork.Client:GetSharedVar("beingTied")) then
		return {
			alpha = 255 - blackFadeAlpha,
			title = "YOU ARE BEING TIED UP"
		};
	elseif (Clockwork.Client:GetSharedVar("tied") != 0) then
		return {
			alpha = 255 - blackFadeAlpha,
			title = "YOU HAVE BEEN TIED UP"
		};
	end;
end;