local PLUGIN = PLUGIN;

-- Called when chat box info should be adjusted.
function PLUGIN:ChatBoxAdjustInfo(info)
	if (info.class == "ic" or info.class == "yell" or info.class == "radio" or info.class == "whisper") then
		if (IsValid(info.speaker) and info.speaker:HasInitialized()) then
			local playerIsHuman = Schema:PlayerIsHuman(info.speaker);
			
			if (playerIsHuman) then
				for k, v in pairs(PLUGIN.voices.stored.humanVoices) do
					if (string.lower(info.text) == string.lower(v.command)) then
						local voice = {
							global = false,
							volume = 80,
							sound = v.sound
						};
						
						if (v.female and info.speaker:QueryCharacter("gender") == GENDER_FEMALE) then
							voice.sound = string.Replace(voice.sound, "/male", "/female");
						end;
						
						if (info.class == "radio") then
							voice.global = true;
						elseif (info.class == "whisper") then
							voice.volume = 60;
						elseif (info.class == "yell") then
							voice.volume = 100;
						end;
						
						info.text = v.phrase;
						
						info.voice = voice;
						
						return true;
					end;
				end;
			end;
		end;
	end;
end;