local PLUGIN = PLUGIN;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	self:LoadRadios();
end;

-- Called just after data should be saved.
function PLUGIN:PostSaveData()
	self:SaveRadios();
end;

-- Called when an entity's menu option should be handled.
function PLUGIN:EntityHandleMenuOption(player, entity, option, arguments)
	if (entity:GetClass() == "cw_radio") then
		if (option == "Set Frequency" and type(arguments) == "string") then
			if (string.find(arguments, "^%d%d%d%.%d$")) then
				local start, finish, decimal = string.match(arguments, "(%d)%d(%d)%.(%d)");
				
				start = tonumber(start);
				finish = tonumber(finish);
				decimal = tonumber(decimal);
				
				if (start == 1 and finish > 0 and finish < 10 and decimal > 0 and decimal < 10) then
					entity:SetFrequency(arguments);
					
					Clockwork.player:Notify(player, "You have set this stationary radio's arguments to "..arguments..".");
				else
					Clockwork.player:Notify(player, "The radio arguments must be between 101.1 and 199.9!");
				end;
			else
				Clockwork.player:Notify(player, "The radio arguments must look like xxx.x!");
			end;
		elseif (arguments == "cw_radioToggle") then
			entity:Toggle();
		elseif (arguments == "cw_radioTake") then
			local bSuccess, fault = player:GiveItem(Clockwork.item:CreateInstance("stationary_radio"));
			
			if (!bSuccess) then
				Clockwork.player:Notify(player, fault);
			else
				entity:Remove();
			end;
		end;
	end;
end;

-- Called when a player has an unknown inventory item.
function PLUGIN:PlayerHasUnknownInventoryItem(player, inventory, item, amount)
	if (item == "radio") then
		inventory["handheld_radio"] = amount;
	end;
end;

-- Called when a player attempts to use the radio.
function PLUGIN:PlayerCanRadio(player, text, listeners, eavesdroppers)
	if (player:HasItemByID("handheld_radio")) then
		if (!player:GetCharacterData("frequency")) then
			Clockwork.player:Notify(player, "You need to set the radio frequency first!");
			
			return false;
		end;
	else
		Clockwork.player:Notify(player, "You do not own a radio!");
		
		return false;
	end;
end;

-- Called when a chat box message has been added.
function PLUGIN:ChatBoxMessageAdded(info)
	if (info.class == "ic") then
		local eavesdroppers = {};
		local talkRadius = Clockwork.config:Get("talk_radius"):Get();
		local listeners = {};
		local players = _player.GetAll();
		local radios = ents.FindByClass("cw_radio");
		local data = {};
		
		for k, v in ipairs(radios) do
			if (!v:IsOff() and info.speaker:GetPos():Distance( v:GetPos() ) <= 80) then
				local frequency = v:GetFrequency();
				
				if (frequency != 0) then
					info.shouldSend = false;
					info.listeners = {};
					data.frequency = frequency;
					data.position = v:GetPos();
					data.entity = v;
					
					break;
				end;
			end;
		end;
		
		if (IsValid(data.entity) and data.frequency != "") then
			for k, v in ipairs(players) do
				if (v:HasInitialized() and v:Alive() and !v:IsRagdolled(RAGDOLL_FALLENOVER)) then
					if (( v:GetCharacterData("frequency") == data.frequency and v:GetSharedVar("tied") == 0
					and v:HasItemByID("handheld_radio") ) or info.speaker == v) then
						listeners[v] = v;
					elseif (v:GetPos():Distance(data.position) <= talkRadius) then
						eavesdroppers[v] = v;
					end;
				end;
			end;
			
			for k, v in ipairs(radios) do
				local radioPosition = v:GetPos();
				local radioFrequency = v:GetFrequency();
				
				if (!v:IsOff() and radioFrequency == data.frequency) then
					for k2, v2 in ipairs(players) do
						if (v2:HasInitialized() and !listeners[v2] and !eavesdroppers[v2]) then
							if (v2:GetPos():Distance(radioPosition) <= (talkRadius * 2)) then
								eavesdroppers[v2] = v2;
							end;
						end;
						
						break;
					end;
				end;
			end;
			
			if (table.Count(listeners) > 0) then
				Clockwork.chatBox:Add(listeners, info.speaker, "radio", info.text);
			end;
			
			if (table.Count(eavesdroppers) > 0) then
				Clockwork.chatBox:Add(eavesdroppers, info.speaker, "radio_eavesdrop", info.text);
			end;
			
			table.Merge(info.listeners, listeners);
			table.Merge(info.listeners, eavesdroppers);
		end;
	end;
	
	if (info.voice) then
		if (IsValid(info.speaker) and info.speaker:HasInitialized()) then
			info.speaker:EmitSound(info.voice.sound, info.voice.volume);
		end;
		
		if (info.voice.global) then
			for k, v in pairs(info.listeners) do
				if (v != info.speaker) then
					Clockwork.player:PlaySound(v, info.voice.sound);
				end;
			end;
		end;
	end;
end;

-- Called when a player has used their radio.
function PLUGIN:PlayerRadioUsed(player, text, listeners, eavesdroppers)
	local newEavesdroppers = {};
	local talkRadius = Clockwork.config:Get("talk_radius"):Get() * 2;
	local frequency = player:GetCharacterData("frequency");
	
	for k, v in ipairs( ents.FindByClass("cw_radio") ) do
		local radioPosition = v:GetPos();
		local radioFrequency = v:GetFrequency();
		
		if (!v:IsOff() and radioFrequency == frequency) then
			for k2, v2 in ipairs( _player.GetAll() ) do
				if (v2:HasInitialized() and !listeners[v2] and !eavesdroppers[v2]) then
					if (v2:GetPos():Distance(radioPosition) <= talkRadius) then
						newEavesdroppers[v2] = v2;
					end;
				end;
				
				break;
			end;
		end;
	end;
	
	if (table.Count(newEavesdroppers) > 0) then
		Clockwork.chatBox:Add(newEavesdroppers, player, "radio_eavesdrop", text);
	end;
end;

-- Called when a player's radio info should be adjusted.
function PLUGIN:PlayerAdjustRadioInfo(player, info)
	for k, v in ipairs( _player.GetAll() ) do
		if (v:HasInitialized() and v:HasItemByID("handheld_radio")) then
			if (v:GetCharacterData("frequency") == player:GetCharacterData("frequency")) then
				if (v:GetSharedVar("tied") == 0) then
					info.listeners[v] = v;
				end;
			end;
		end;
	end;
end;

-- Called when chat box info should be adjusted.
function PLUGIN:ChatBoxAdjustInfo(info)
	if (info.class == "radio") then
		if (IsValid(info.speaker) and info.speaker:HasInitialized()) then
			
			for k, v in pairs(Schema.voices.stored.humanVoices) do
				if (v.faction == "Human") then
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
						end;
						
						info.voice = voice;
						
						return true;
					end;
				end;
			end;
		end;
	end;
end;