-- Called when Clockwork has loaded all of the entities.
function Schema:ClockworkInitPostEntity()
end;

-- Called just after data should be saved.
function Schema:PostSaveData()
end;

-- Called when a player's default inventory is needed.
function Schema:GetPlayerDefaultInventory(player, character, inventory)
	if (character.faction == FACTION_CLONE) then
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("weapon_dc_15")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("weapon_dc_15s")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("infantry_armor")
		);
	elseif (character.faction == FACTION_DROIDS) then
		
	elseif (character.faction == FACTION_JEDI) then
		
	elseif (character.faction == FACTION_SITH) then
		
	end;
end;

-- Called just after a player spawns.
function Schema:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	if (!lightSpawn) then
		if (player:GetFaction() == FACTION_CLONE) then
			if (self:IsPlayerCloneDivision(player, "CMD")) then
				
				-- Untested
				local entity = ents.Create("sent_jetpack");
				entity:SetPos( client:LocalToWorld( client:OBBCenter() ) );
				entity:SetOwner(client);
				entity:SetCollisionGroup(COLLISION_GROUP_DEBRIS);
				entity:Spawn();
				entity:Activate();
			end;
		end;
	end;
end;