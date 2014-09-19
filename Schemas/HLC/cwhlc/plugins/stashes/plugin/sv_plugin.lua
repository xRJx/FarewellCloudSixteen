local PLUGIN = PLUGIN;

Clockwork.config:Add("max_stash_space", 30);

-- A function to load the stash items.
function PLUGIN:LoadStashes()
	local stashes = Clockwork.kernel:RestoreSchemaData("plugins/stashes/"..game.GetMap());
	self.stashes = {};
	
	for k, v in pairs(stashes) do
		local entity = ents.Create("cw_stash");
		
		entity:SetPos(v.position);
		entity:Spawn();
		
		if ( IsValid(entity) ) then
			entity:SetAngles(v.angles);
		end;
	end;
	
end;

-- A function to save the stash items.
function PLUGIN:SaveStashes()
	local stashes = {};
	
	for k, v in pairs(ents.FindByClass("cw_stash")) do
		stashes[#stashes + 1] = {
			angles = v:GetAngles(),
			position = v:GetPos(),
			uniqueID = Clockwork.entity:QueryProperty(v, "uniqueID")
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/stashes/"..game.GetMap(), stashes);
end;

-- A function to open a container for a player.
function PLUGIN:OpenContainer(player, entity, weight)
	--local inventory = nil;
	--local cash = 0;
	--local stashID = Clockwork.entity:QueryProperty(entity, "uniqueID");
	
	local stashCashID = "stashCash"..tostring(entity:EntIndex());
	local stashItemsID = "stashItems"..tostring(entity:EntIndex());
	
	--[[if (!entity.stashInventory) then
		self.stashes[entity] = entity;
		
		entity.stashInventory = {};
	end;]]--
	
	if (entity:GetClass() == "cw_stash") then
		name = "Stash";
		cash = player:GetCharacterData(stashCashID);
		weight = Clockwork.config:Get("max_stash_space"):Get();
		inventory = player:GetCharacterData(stashItemsID);
	end;
	
	Clockwork.storage:Open( player, {
		name = name,
		cash = cash,
		weight = weight,
		entity = entity,
		distance = 192,
		inventory = inventory,
		
		OnGive = function(player, storageTable, item)
			if (storageTable.entity:GetClass() == "cw_stash") then
				player:SetCharacterData(stashItemsID, storageTable.item);
			end;
		end,
		OnTake = function(player, storageTable, item)
			if (storageTable.entity:GetClass() == "cw_stash") then
				player:SetCharacterData(stashItemsID, storageTable.item);
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