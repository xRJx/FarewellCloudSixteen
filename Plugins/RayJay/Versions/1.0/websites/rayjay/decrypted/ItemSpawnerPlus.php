<?php
/*
local PLUGIN = PLUGIN;

function PLUGIN:ClockworkInitPostEntity()
	PLUGIN.Items = {};
	PLUGIN.selectedItems = {};
	
	for k, v in pairs( Clockwork.item:GetAll() ) do
		if (!v.isBaseItem and (v.value != nil) ) then
			PLUGIN.Items[#PLUGIN.Items + 1] = v;
		end;
	end;
	
	PLUGIN:LoadItemSpawns();
	PLUGIN:LoadItemSpawnMarkers()
end;

function PLUGIN:PostSaveData()
	PLUGIN:SaveItemSpawns();
end;

function PLUGIN:Tick()
	local curTime = CurTime();
	local maximumSpawns = #PLUGIN.itemSpawns;
	
	if (!self.nextItemSpawn) then
		
		-- This is the amount (in seconds) between random item spawns.
		self.nextItemSpawn = curTime + math.random(1800, 3600);
	end;
	
	if (curTime >= self.nextItemSpawn and #PLUGIN.itemSpawns > 0) then
		self.nextItemSpawn = nil;
		PLUGIN.selectedItems = {};
		
		local Item = PLUGIN:GetRandomItem();
		local position = PLUGIN:GetRandomItemSpawn();
		Clockwork.entity:CreateItem(nil, Item.uniqueID, position);
	end;
end;


function PLUGIN:LoadItemSpawns()
	self.itemSpawns = Clockwork.kernel:RestoreSchemaData( "plugins/itemspawns/"..game.GetMap() );
	
	if (!self.itemSpawns) then
		self.itemSpawns = {};
	end;
end;

function PLUGIN:SaveItemSpawns()
	Clockwork.kernel:SaveSchemaData("plugins/itemspawns/"..game.GetMap(), self.itemSpawns);
end;

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

function PLUGIN:GetRandomItemSpawn()
	local position = PLUGIN.itemSpawns[ math.random(1, #PLUGIN.itemSpawns) ];
	local entities = ents.GetAll();
	local players = player.GetAll();
	
	for k, v in pairs(players) do
		if (v:HasInitialized() and (v:GetPos():Distance(position) <= 256 and !v:IsNoClipping()) ) then
			return PLUGIN:GetRandomItemSpawn();
		end;
	end;
	
	for k, v in pairs(entities) do
		if (v:GetClass() == "cw_item") then
			if (v:GetPos():Distance(position) <= 50) then
				v:Remove();
			end;
		end;
	end;
	
	return position;
end;

function PLUGIN:GetRandomItem()
	local randomNumber = math.random(os.time());
	
	for k, v in pairs( PLUGIN.Items ) do
		local value = v("value");
		
		if (value == "Abundant") then
			v.value = 0; -- 100% chance to be included.
		elseif (value == "Common") then
			v.value = 0.25; -- 75% chance to be included.
		elseif (value == "Uncommon") then
			v.value = 0.5; -- 50% chance to be included.
		elseif (value == "Valuable") then
			v.value = 0.75; -- 25% chance to be included.
		elseif (value == "Rare") then
			v.value = 0.9; -- 10% chance to be included.
		elseif (value == "Legendary") then
			v.value = 0.99; -- 1% chance to be included.
		end;
		
		if (v.value <= randomNumber) then -- Value is the % chance of being included in the list.
			PLUGIN.selectedItems[#PLUGIN.selectedItems + 1] = v;
		end;
	end;
	
	local Item = PLUGIN.selectedItems[ math.random(1, #PLUGIN.selectedItems) ];
	
	return Item;
end;
*/
?>