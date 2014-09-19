local PLUGIN = PLUGIN;

-- Called when an entity's menu options are needed.
function PLUGIN:GetEntityMenuOptions(entity, options)
	if (entity:GetClass() == "cw_radio") then
		if (!entity:IsOff()) then
			options["Turn Off"] = "cw_radioToggle";
		else
			options["Turn On"] = "cw_radioToggle";
		end;
		
		options["Set Frequency"] = function()
			Derma_StringRequest("Frequency", "What would you like to set the frequency to?", frequency, function(text)
				if (IsValid(entity)) then
					Clockwork.entity:ForceMenuOption(entity, "Set Frequency", text);
				end;
			end);
		end;
		
		options["Take"] = "cw_radioTake";
	end;
end;

