local PLUGIN = PLUGIN;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	self:LoadPersonalStorage();
end;

-- Called just after data should be saved.
function PLUGIN:PostSaveData()
	self:SavePersonalStorage();
end;

--[[ Called when an entity's menu option should be handled.
function PLUGIN:EntityHandleMenuOption(player, entity, option, arguments)
	local class = entity:GetClass();
	
	if (class == "cw_safebox" and arguments == "cwContainerOpen") then
		PLUGIN:OpenContainer(player, entity);
	end;
end;]]--

-- Called when a player's character data should be restored.
function PLUGIN:PlayerRestoreCharacterData(player, data)
	local personalStorage = Clockwork.kernel:RestoreSchemaData( "plugins/personal/"..game.GetMap() );
	
	for k, v in pairs(personalStorage) do
		if (!data[v.uniqueID.."safeboxitems"]) then
			data[v.uniqueID.."safeboxitems"] = {};
		--else
			--data["safeboxitems"] = data["safeboxitems"];
		end;
		
		if (!data[v.uniqueID.."safeboxcash"]) then
			data[v.uniqueID.."safeboxcash"] =  0;
		--else
			--data["safeboxcash"] = data["safeboxcash"];
		end;
	end;
end;