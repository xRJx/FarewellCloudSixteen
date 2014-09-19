local PLUGIN = PLUGIN;

-- A function to say a message as an overwatch dispatch.
function PLUGIN:SayOverwatch(player, text)
	local listeners = { overwatch = {}, eavesdrop = {} };
	
	for k, v in ipairs( _player.GetAll() ) do
		if (v:HasInitialized()) then
			local isCombine = (v:GetFaction() == FACTION_OTA);
			
			if (isCombine) then
				listeners.overwatch[v] = v;
			end;
		end;
	end;
	
	local info = Clockwork.chatBox:Add(listeners.overwatch, player, "overwatch", text);
	
	if (info and IsValid(info.speaker)) then
		Clockwork.chatBox:Add(listeners.eavesdrop, info.speaker, "overwatch_eavesdrop", info.text);
	end;
end;