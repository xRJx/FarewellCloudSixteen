local PLUGIN = PLUGIN;

-- Called when a player switches their flashlight on or off.
function Schema:PlayerSwitchFlashlight(player, on)
	if (on and player:GetSharedVar("tied") != 0) then
		return false;
	end;
end;

-- Called when a player's storage should close.
function PLUGIN:PlayerStorageShouldClose(player, storage)
	local entity = player:GetStorageEntity();
	
	if (player.searching and entity:IsPlayer() and entity:GetSharedVar("tied") == 0) then
		return true;
	end;
end;

-- Called when a player attempts to spray their tag.
function PLUGIN:PlayerSpray(player)
	if (player:GetSharedVar("tied") != 0) then
		return true;
	end;
end;

-- Called when a player presses F3.
function PLUGIN:ShowSpare1(player)
	local itemTable = player:FindItemByID("zip_tie");
	
	if (!itemTable) then
		Clockwork.player:Notify(player, "You do not own a zip tie!");
		
		return;
	end;

	Clockwork.player:RunClockworkCommand(player, "InvAction", "use", itemTable("uniqueID"), tostring(itemTable("itemID")));
end;

-- Called when a player presses F4.
function PLUGIN:ShowSpare2(player)
	Clockwork.player:RunClockworkCommand(player, "CharSearch");
end;

-- Called when a player spawns an object.
function PLUGIN:PlayerSpawnObject(player)
	if (player:GetSharedVar("tied") != 0) then
		Clockwork.player:Notify(player, "You don't have permission to do this right now!");
		
		return false;
	end;
end;

-- Called when a player presses a key.
function PLUGIN:KeyPress(player, key)
	if (key == IN_USE) then
		local untieTime = PLUGIN:GetDexterityTime(player);
		local target = player:GetEyeTraceNoCursor().Entity;
		local entity = target;
		
		if (IsValid(target)) then
			target = Clockwork.entity:GetPlayer(target);
			
			if (target and player:GetSharedVar("tied") == 0) then
				if (target:GetShootPos():Distance( player:GetShootPos() ) <= 192) then
					if (target:GetSharedVar("tied") != 0) then
						Clockwork.player:SetAction(player, "untie", untieTime);
						
						Clockwork.player:EntityConditionTimer(player, target, entity, untieTime, 192, function()
							return player:Alive() and !player:IsRagdolled() and player:GetSharedVar("tied") == 0;
						end, function(success)
							if (success) then
								PLUGIN:TiePlayer(target, false);
								
								player:ProgressAttribute(ATB_DEXTERITY, 15, true);
							end;
							
							Clockwork.player:SetAction(player, "untie", false);
						end);
					end;
				end;
			end;
		end;
	end;
end;

-- Called when a player attempts to switch to a character.
function PLUGIN:PlayerCanSwitchCharacter(player, character)
	if (player:GetSharedVar("tied") != 0) then
		return false, "You cannot switch to this character while tied!";
	end;
end;

-- Called when attempts to use a command.
function PLUGIN:PlayerCanUseCommand(player, commandTable, arguments)
	if (player:GetSharedVar("tied") != 0) then
		local blacklisted = {
			"OrderShipment",
			"Broadcast",
			"Dispatch",
			"Request",
			"Radio"
		};
		
		if (table.HasValue(blacklisted, commandTable.name)) then
			Clockwork.player:Notify(player, "You cannot use this command when you are tied!");
			
			return false;
		end;
	end;
end;

-- Called when a player attempts to use a door.
function PLUGIN:PlayerCanUseDoor(player, door)
	if (player:GetSharedVar("tied") != 0) then
		return false;
	end;
end;

-- Called when a player attempts to change class.
function PLUGIN:PlayerCanChangeClass(player, class)
	if (player:GetSharedVar("tied") != 0) then
		Clockwork.player:Notify(player, "You cannot change classes when you are tied!");
		
		return false;
	end;
end;

-- Called when a player attempts to use an entity.
function PLUGIN:PlayerUse(player, entity)
	local overlayText = entity:GetNetworkedString("GModOverlayText");
	local curTime = CurTime();
	local faction = player:GetFaction();
	
	if (player:GetSharedVar("tied") != 0) then
		if (entity:IsVehicle()) then
			if (Clockwork.entity:IsChairEntity(entity) or Clockwork.entity:IsPodEntity(entity)) then
				return;
			end;
		end;
		
		if (!player.nextTieNotify or player.nextTieNotify < CurTime()) then
			Clockwork.player:Notify(player, "You cannot use that when you are tied!");
			
			player.nextTieNotify = CurTime() + 2;
		end;
		
		return false;
	end;
end;

-- Called when a player attempts to destroy an item.
function PLUGIN:PlayerCanDestroyItem(player, itemTable, noMessage)
	if (player:GetSharedVar("tied") != 0) then
		if (!noMessage) then
			Clockwork.player:Notify(player, "You cannot destroy items when you are tied!");
		end;
		
		return false;
	end;
end;

-- Called when a player attempts to drop an item.
function PLUGIN:PlayerCanDropItem(player, itemTable, noMessage)
	if (player:GetSharedVar("tied") != 0) then
		if (!noMessage) then
			Clockwork.player:Notify(player, "You cannot drop items when you are tied!");
		end;
		
		return false;
	end;
end;

-- Called when a player attempts to use an item.
function PLUGIN:PlayerCanUseItem(player, itemTable, noMessage)
	if (player:GetSharedVar("tied") != 0) then
		if (!noMessage) then
			Clockwork.player:Notify(player, "You cannot use items when you are tied!");
		end;
		
		return false;
	end;
end;

-- Called just before a player dies.
function PLUGIN:DoPlayerDeath(player, attacker, damageInfo)
	player.beingSearched = nil;
	player.searching = nil;
	
	PLUGIN:TiePlayer(player, false, true);
end;

-- Called when a player's character has loaded.
function PLUGIN:PlayerCharacterLoaded(player)
	player:SetSharedVar("tied", 0);
end;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (!lightSpawn) then
		player.beingSearched = nil;
		player.searching = nil;
	end;
	
	if (player:GetSharedVar("tied") != 0) then
		PLUGIN:TiePlayer(player, true);
	end;
end;