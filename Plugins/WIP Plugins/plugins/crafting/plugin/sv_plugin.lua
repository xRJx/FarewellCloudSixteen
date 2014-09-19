local PLUGIN = PLUGIN;

Clockwork.config:Add("crafting_cost", 160, true);
Clockwork.config:Add("schemes", true, true);

-- Called when a player crafts an item.
function PLUGIN:PlayerCraftItem(player, itemTable, entity) end;

-- Called when a player attempts to craft an item.
function PLUGIN:PlayerCanCraftItem(player, itemTable)
	local curTime = CurTime();

	if (player.cwNextCraftTime and curTime < player.cwNextCraftTime) then
		return false;
	end;
	
	return true;
end;

-- Called when a player's crafted item should be adjusted.
function PLUGIN:PlayerAdjustCraftItemTable(player, itemTable) end;