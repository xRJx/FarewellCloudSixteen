local PLUGIN = PLUGIN;

-- A function to load the item spawns.
function PLUGIN:LoadItemSpawns()
	itemSpawns = Clockwork.kernel:RestoreSchemaData( "plugins/itemspawns/"..game.GetMap() );
	
	if (!itemSpawns) then
		itemSpawns = {};
	end;
	
	for k, v in pairs(itemSpawns) do
		local entity = ents.Create("cw_spawnmarker");
		
		entity:SetPos(v);
		entity:Spawn();
		entity:SetColor(Color(255, 255, 255, 100));
		
		local physicsObject = entity:GetPhysicsObject();
		
		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false);
		end;
	end;
end;

-- A function to save the item spawns.
function PLUGIN:SaveItemSpawns()
	Clockwork.kernel:SaveSchemaData("plugins/itemspawns/"..game.GetMap(), itemSpawns);
end;

-- A function to get a random item spawn.
function PLUGIN:GetRandomItemSpawn()
	local position = itemSpawns[ math.random(1, #itemSpawns) ];
	local entities = ents.GetAll();
	local players = player.GetAll();
	
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
	PLUGIN.selectedItems = {};
	
	local randomNumber = math.random(0, 100);
	
	for k, v in pairs(PLUGIN.Items) do
		local value = v("value");
		
		if (value == "Abundant") then
			v.value = 0; -- 100% chance to be included.
		elseif (value == "Common") then
			v.value = 25; -- 75% chance to be included.
		elseif (value == "Uncommon") then
			v.value = 50; -- 50% chance to be included.
		elseif (value == "Valuable") then
			v.value = 75; -- 25% chance to be included.
		elseif (value == "Rare") then
			v.value = 90; -- 10% chance to be included.
		elseif (value == "Legendary") then
			v.value = 99; -- 1% chance to be included.
		end;
		
		if (randomNumber >= v.value) then -- Value is the % chance of being included in the list.
			PLUGIN.selectedItems[#PLUGIN.selectedItems + 1] = v;
		end;
	end;
	
	if (table.Count(PLUGIN.selectedItems) <= 0) then
		return PLUGIN:GetRandomItem();
	end;
	
	local Item = PLUGIN.selectedItems[ math.random(1, #PLUGIN.selectedItems) ];
	
	return Item;
end;