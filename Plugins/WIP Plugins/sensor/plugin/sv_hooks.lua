local PLUGIN = PLUGIN;

-- Called when a player's inventory item has been updated.
function openAura.schema:PlayerInventoryItemUpdated(player, itemTable, amount, force)
	local clothes = player:GetCharacterData("clothes");
	
	if (itemTable.uniqueID == "heartbeat_implant") then
		if ( player:GetSharedVar("implant") ) then
			if ( !player:HasItem(itemTable.uniqueID) ) then
				itemTable:OnPlayerUnequipped(player);
			end;
		end;
	end;
end;