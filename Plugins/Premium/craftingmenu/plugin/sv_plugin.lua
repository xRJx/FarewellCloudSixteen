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
		if (string.len(v[1]) <= 1) then
			player:GiveItem(Clockwork.item:CreateInstance(v));
		else
			timer.Create("GiveItems", 0.1, v[2], function() player:GiveItem(Clockwork.item:CreateInstance(v[1])); end);
		end;
	end;
end;

function PLUGIN:TakeItems(player, item)
	for k, v in pairs(item) do
		if (string.len(v[1]) <= 1) then
			player:TakeItem(player:FindItemByID(v));
		else
			timer.Create("TakeItems", 0.1, v[2], function() player:TakeItem(player:FindItemByID(v[1])); end);
		end;
	end;
end;

function PLUGIN:HasItems(player, item)
	for k, v in pairs(item) do
		if (string.len(v[1]) <= 1 and player:HasItemByID(v)) then
			return true;
		elseif (string.len(v[1]) > 1 and player:HasItemByID(v[1]) and table.Count(player:GetItemsByID(v[1])) >= v[2]) then
			return true;
		else
			return false;
		end;
	end;
end;