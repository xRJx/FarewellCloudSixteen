local PLUGIN = PLUGIN;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	PLUGIN:LoadStashes()
end;

-- Called just after data should be saved.
function PLUGIN:PostSaveData()
	PLUGIN:SaveStashes();
end;

--[[function PLUGIN:GetStashID(entity)
	return tostring(Clockwork.entity:QueryProperty(entity, "uniqueID"))
end;]]--

-- Called to check if a player does have an item.
function PLUGIN:PlayerDoesHaveItem(player, itemTable)
	for k, v in pairs (ents.FindByClass("cw_stash")) do
		local stash = player:GetCharacterData("stashItems"..v:EntIndex());
		
		if ( stash and stash[itemTable.uniqueID] ) then
			return stash[itemTable.uniqueID];
		end;
	end;
end;

-- Called when a player's character data should be restored.
function PLUGIN:PlayerRestoreCharacterData(player, data)
	
	for k, v in pairs (ents.FindByClass("cw_stash")) do
		
		data["stashItems"..v:EntIndex()] = data["stashItems"..v:EntIndex()] or {};
		data["stashCash"..v:EntIndex()] = data["stashCash"..v:EntIndex()] or 0;
	end;
	
	for k, v in pairs( data["stashItems"] ) do
		local itemTable = Clockwork.item:GetAll(k);
		
		if (!itemTable) then
			hook.Call("PlayerHasUnknownInventoryItem", Clockwork, player, data["stashItems"], k, v);
			
			data["stashItems"..v:EntIndex()][k] = nil;
		end;
	end;
end;

-- Called when an entity's menu option should be handled.
function PLUGIN:EntityHandleMenuOption(player, entity, option, arguments)
	local class = entity:GetClass();
	
	if (class == "cw_stash" and arguments == "cwContainerOpen") then
		PLUGIN:OpenContainer(player, entity);
	end;
end;