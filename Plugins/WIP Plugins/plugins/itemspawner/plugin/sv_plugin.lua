local PLUGIN = PLUGIN;

-- A function to load the item spawns.
function PLUGIN:LoadItemSpawns()
	self.itemSpawns = Clockwork.kernel:RestoreSchemaData( "plugins/itemspawns/"..game.GetMap() );
	
	if (!self.itemSpawns) then
		self.itemSpawns = {};
	end;
end;

-- A function to save the item spawns.
function PLUGIN:SaveItemSpawns()
	Clockwork.kernel:SaveSchemaData("plugins/itemspawns/"..game.GetMap(), self.itemSpawns);
end;

-- A function to load the markers.
function PLUGIN:LoadItemSpawnMarkers()
	local markers = Clockwork.kernel:RestoreSchemaData( "plugins/markers/"..game.GetMap() );
	
	for k, v in pairs(markers) do
		local entity = ents.Create("cw_spawnmarker");
		
		entity:SetPos(v.position);
		entity:Spawn();
		
		if (!v.moveable) then
			local physicsObject = entity:GetPhysicsObject();
			
			if (IsValid(physicsObject)) then
				physicsObject:EnableMotion(false);
			end;
		end;
	end;
end;

-- A function to save the markers.
function PLUGIN:SaveItemSpawnMarkers()
	local markers = {};
	
	for k, v in pairs( ents.FindByClass("cw_spawnmarker") ) do
		local physicsObject = v:GetPhysicsObject();
		local moveable;
		
		if (IsValid(physicsObject)) then
			moveable = physicsObject:IsMoveable();
		end;
		
		markers[#markers + 1] = {
			moveable = moveable,
			position = v:GetPos()
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/markers/"..game.GetMap(), markers);
end;

-- A function to get a random item spawn.
function PLUGIN:GetRandomItemSpawn()
	local position = PLUGIN.itemSpawns[ math.random(1, #PLUGIN.itemSpawns) ];
	local entities = ents.GetAll();
	local players = _player.GetAll();
	
	-- If a player is too close to the item spawn, it will select a different item spawn.
	for k, v in pairs(players) do
		if (v:HasInitialized() and (v:GetPos():Distance(position) <= 256 and !v:IsNoClipping()) ) then
			return PLUGIN:GetRandomItemSpawn();
		end;
	end;
	
	-- If an item is already at the item spawn, it is deleted and a new item takes its place.
	for k, v in pairs(entities) do
		if (v:GetClass() == "cw_item") then
			if (v:GetPos():Distance(position) <= 50) then
				v:Remove();
			end;
		end;
	end;
	
	return position;
end;

-- A function to get a random item.
function PLUGIN:GetRandomItem()
	
	-- 0: Always included.
	-- +1: Never included.
	-- Everything else is self explanatory.
	
	local randomNumber = math.random(os.time());
	
	for k, v in pairs( PLUGIN.Items ) do
		local value = v("value");
		
		if (value == "Abundant") then
			v.value = 0;
		elseif (value == "Common") then
			v.value = 0.25;
		elseif (value == "Uncommon") then
			v.value = 0.5;
		elseif (value == "Valuable") then
			v.value = 0.75;
		elseif (value == "Rare") then
			v.value = 0.9;
		elseif (value == "Legendary") then
			v.value = 0.01;
		end;
		
		if (v.value <= randomNumber) then -- Value is the % chance of being included in the list.
			PLUGIN.selectedItems[#PLUGIN.selectedItems + 1] = v;
		end;
	end;
	
	local Item = PLUGIN.selectedItems[ math.random(1, #PLUGIN.selectedItems) ];
	
	return Item;
end;