local PLUGIN = PLUGIN;

Clockwork.config:Add("max_safebox_weight", 30);

-- A function to save the personal storage.
function PLUGIN:SavePersonalStorage()
	local personalStorageData = Clockwork.kernel:RestoreSchemaData( "plugins/personal/"..game.GetMap() );
	local personalStorage = {};
	
	for k, v in pairs( ents.FindByClass("cw_safebox") ) do
		personalStorage[#personalStorage + 1] = {
			position = v:GetPos(),
			angles = v:GetAngles(),
			uniqueID = v:GetID(),
			assigned = v:IsAssigned()
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/personal/"..game.GetMap(), personalStorage);
end;

-- A function to load the personal storage.
function PLUGIN:LoadPersonalStorage()
	local personalStorage = Clockwork.kernel:RestoreSchemaData( "plugins/personal/"..game.GetMap() );
	
	for k, v in pairs(personalStorage) do
		
		
		local entity = ents.Create("cw_safebox");
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:Spawn();
		
		entity:GetPhysicsObject():EnableMotion(false);
		
		if (v.assigned) then
			entity.ID = v.uniqueID;
			entity.Assigned = true;
		end;
		
		entity:AssignID();
	end;
end;

-- A function to open a container for a player.
function PLUGIN:OpenStash(player, entity, weight)
	if (entity:GetClass() == "cw_safebox") then
		Clockwork.storage:Open(player, {
			name = "Safebox",
			cash = player:GetCharacterData(entity.ID.."safeboxcash"),
			weight = Clockwork.config:Get("max_safebox_weight"):Get(),
			entity = entity,
			distance = 192,
			inventory = Clockwork.inventory:ToLoadable(player:GetCharacterData(entity.ID.."safeboxitems")),
			
			OnGiveItem = function(player, storageTable, itemTable)
				player:SetCharacterData(entity.ID.."safeboxitems", storageTable.inventory);
			end,
			OnTakeItem = function(player, storageTable, itemTable)
				player:SetCharacterData(entity.ID.."safeboxitems", storageTable.inventory);
			end,
			
			OnGiveCash = function(player, storageTable, cash)
				player:SetCharacterData(entity.ID.."safeboxcash", storageTable.cash);
			end,
			OnTakeCash = function(player, storageTable, cash)
				player:SetCharacterData(entity.ID.."safeboxcash", storageTable.cash);
			end,
			
			OnClose = function(player, storageTable, entity)
				player:SetCharacterData(entity.ID.."safeboxcash", storageTable.cash);
				player:SetCharacterData(entity.ID.."safeboxitems", storageTable.inventory);
			end;
		} );
	end;
end;