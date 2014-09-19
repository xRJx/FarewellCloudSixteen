local PLUGIN = PLUGIN;

-- Called when attempts to use a command.
function PLUGIN:PlayerCanUseCommand(player, commandTable, arguments)
	if (player:GetSharedVar("tied") != 0) then
		local blacklisted = {
			"Overwatch"
		};
		
		if (table.HasValue(blacklisted, commandTable.name)) then
			Clockwork.player:Notify(player, "You cannot use this command when you are tied!");
			
			return false;
		end;
	end;
end;

-- Called when chat box info should be adjusted.
function PLUGIN:ChatBoxAdjustInfo(info)

	if (info.class == "overwatch") then
		if (IsValid(info.speaker) and info.speaker:HasInitialized()) then
			local playerIsCombine = Schema:PlayerIsCombine(info.speaker);
			
			if (playerIsCombine) then
				for k, v in pairs(PLUGIN.voices.stored.overwatchVoices) do
					if (string.lower(info.text) == string.lower(v.command)) then
						local voice = {
							global = false,
							volume = 90,
							sound = v.sound
						};
						
						if (info.class == "overwatch") then
							voice.global = true;
						end;
						
						info.text = "<:: "..v.phrase;
						info.voice = voice;
						
						return true;
					end;
				end;
			end;
		end;
	end;
end;