local PLUGIN = PLUGIN;

Clockwork.config:Add("max_stash_space", 30);

-- A function to load the stash items.
function PLUGIN:LoadStashes()
	local stashes = Clockwork.kernel:RestoreSchemaData("plugins/stashes/"..game.GetMap());
	self.stashes = {};
	
	for k, v in pairs(stashes) do
		--[[for k2, v2 in pairs(v.inventory) do
			local itemTable = Clockwork.item:Get(k2);
			
			if (!itemTable) then
				v.inventory[k2] = nil;
			end;
		end;]]--
		
		local entity = ents.Create("cw_stash");
		
		entity:SetPos(v.position);
		entity:Spawn();
		
		if ( IsValid(entity) ) then
			entity:SetAngles(v.angles);
		end;
		
		entity.cash = v.cash;
		entity.inventory = v.inventory;
	end;
end;

-- A function to save the stash items.
function PLUGIN:SaveStashes()
	local stashes = {};
	
	for k, v in pairs(ents.FindByClass("cw_stash")) do
		stashes[#stashes + 1] = {
			angles = v:GetAngles(),
			position = v:GetPos(),
			uniqueID = Clockwork.entity:QueryProperty(v, "uniqueID"),
			cash = v.cash,
			inventory = v.inventory
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/stashes/"..game.GetMap(), stashes);
end;

-- A function to open a container for a player.
function PLUGIN:OpenContainer(player, entity, weight)
	local stashCashID = "stashCash"..entity:GetCreationID();
	local stashItemsID = "stashItems"..entity:GetCreationID();
	
	if (entity:GetClass() == "cw_stash") then
		name = "Stash";
		cash = player:GetCharacterData(stashCashID);
		inventory = player:GetCharacterData(stashItemsID);
		weight = Clockwork.config:Get("max_stash_space"):Get();
	end;
	
	Clockwork.storage:Open( player, {
		name = name,
		cash = cash,
		weight = weight,
		entity = entity,
		distance = 192,
		inventory = inventory,
		
		OnGiveItem = function(player, storageTable, itemTable)
			if (storageTable.entity:GetClass() == "cw_stash") then
				player:SetCharacterData(stashItemsID, storageTable.itemTable.index);
			end;
		end,
		OnTakeItem = function(player, storageTable, itemTable)
			if (storageTable.entity:GetClass() == "cw_stash") then
				player:SetCharacterData(stashItemsID, storageTable.index);
			end;
		end,
		
		OnGiveCash = function(player, storageTable, cash)
			if (storageTable.entity:GetClass() == "cw_stash") then
				player:SetCharacterData(stashCashID, storageTable.cash);
			end;
		end,
		OnTakeCash = function(player, storageTable, cash)
			if (storageTable.entity:GetClass() == "cw_stash") then
				player:SetCharacterData(stashCashID, storageTable.cash);
			end;
		end
	} );
end;