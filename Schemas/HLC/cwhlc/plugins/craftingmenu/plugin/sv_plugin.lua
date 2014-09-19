local PLUGIN = PLUGIN;

Clockwork.config:Add("crafting_cost", 160, true);
Clockwork.config:Add("craftingMenu", true, true);

function PLUGIN:PlayerCraftItem(player, itemTable, entity) end;

function PLUGIN:PlayerCanCraftItem(player, itemTable)
	local curTime = CurTime();

	if (player.cwNextCraftTime and curTime < player.cwNextCraftTime) then
		return false;
	end;
	
	return true;
end;

function PLUGIN:PlayerAdjustCraftItemTable(player, itemTable) end;

function PLUGIN:GiveItems(player, item)
	for k, v in pairs(item) do
		local itemID = string.lower(string.gsub(item[k][1], "%s", "_"));
		local required = item[k][2];
		
		timer.Create("GiveItems"..k, 0.1, required, function() player:GiveItem(Clockwork.item:CreateInstance(itemID)); end);
	end;
end;

function PLUGIN:TakeItems(player, item)
	for k, v in pairs(item) do
		local itemID = string.lower(string.gsub(item[k][1], "%s", "_"));
		local required = item[k][2];
		
		timer.Create("TakeItems"..k, 0.1, required, function() player:TakeItem(player:FindItemByID(itemID)); end);
	end;
end;

function PLUGIN:HasItems(player, item)
	local itemChecks = 0;
	
	for k, v in pairs(item) do
		local itemID = string.lower(string.gsub(item[k][1], "%s", "_"));
		local required = item[k][2];
		
		if (player:HasItemByID(itemID) and table.Count(player:GetItemsByID(itemID)) >= required) then
			itemChecks = itemChecks + 1;
		end;
	end;
	
	if (itemChecks >= table.Count(item)) then
		return true;
	else
		return false;
	end;
end;