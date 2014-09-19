local Clockwork = Clockwork;

-- Called when Clockwork has loaded all of the entities.
function Schema:ClockworkInitPostEntity()
	
end;

-- Called just after data should be saved.
function Schema:PostSaveData()
	
end;

-- Called when an entity has been breached.
function Schema:EntityBreached(entity, activator)
	if (Clockwork.entity:IsDoor(entity)) then
		if (!IsValid(entity.combineLock)) then
			if (!IsValid(activator) or string.lower( entity:GetClass() ) != "prop_door_rotating") then
				Clockwork.entity:OpenDoor(entity, 0, true, true);
			else
				self:BustDownDoor(activator, entity);
			end;
		elseif (IsValid(activator) and activator:IsPlayer() and self:PlayerIsCombine(activator)) then
			if (string.lower( entity:GetClass() ) == "prop_door_rotating") then
				entity.combineLock:ActivateSmokeCharge( (entity:GetPos() - activator:GetPos() ):GetNormal() * 10000 );
			else
				entity.combineLock:SetFlashDuration(2);
			end;
		else
			entity.combineLock:SetFlashDuration(2);
		end;
	end;
end;

-- Called when a player's default inventory is needed.
function Schema:GetPlayerDefaultInventory(player, character, inventory)
	if (character.faction == FACTION_GMC) then
		--[[Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("masked_uniform")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("handheld_radio")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("weapon_pistol")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("ammo_pistol")
		);]]--
	elseif (character.faction == FACTION_OTA) then
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("handheld_radio")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("weapon_pistol")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("ammo_pistol")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("weapon_ar2")
		);
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("ammo_ar2")
		);
	elseif (character.faction == FACTION_SURVIVOR) then
		Clockwork.inventory:AddInstance(
			inventory, Clockwork.item:CreateInstance("suitcase")
		);
	end;
end;

-- Called when an entity's menu option should be handled.
function Schema:EntityHandleMenuOption(player, entity, option, arguments)
	if (entity:GetClass() == "cw_breach") then
		entity:CreateDummyBreach();
		entity:BreachEntity(player);
	end;
end;

-- Called when a player attempts to breach an entity.
function Schema:PlayerCanBreachEntity(player, entity)
	if (string.lower( entity:GetClass() ) == "func_door_rotating") then
		return false;
	end;
	
	if (Clockwork.entity:IsDoor(entity)) then
		if (!Clockwork.entity:IsDoorFalse(entity)) then
			return true;
		end;
	end;
end;

-- Called when a player's typing display has started.
function Schema:PlayerStartTypingDisplay(player, code)
	if (Schema:PlayerIsCombine(player) and !player:IsNoClipping()) then
		if (code == "n" or code == "y" or code == "w" or code == "r") then
			if (!player.typingBeep) then
				player.typingBeep = true;
				
				player:EmitSound("npc/metropolice/vo/on2.wav");
			end;
		end;
	end;
end;

-- Called when a player's typing display has finished.
function Schema:PlayerFinishTypingDisplay(player, textTyped)
	if (Schema:PlayerIsCombine(player) and textTyped) then
		if (player.typingBeep) then
			player:EmitSound("npc/overwatch/radiovoice/off4.wav");
		end;
	end;
	
	player.typingBeep = nil;
end;

-- Called when a player's weapons should be given.
function Schema:PlayerGiveWeapons(player)
	if (player:GetFaction() == FACTION_VORT) then
		Clockwork.player:GiveSpawnWeapon(player, "cw_vortibeam");
	end;
end;

-- Called when a player's footstep sound should be played.
function Schema:PlayerFootstep(player, position, foot, sound, volume, recipientFilter)
	if (player:Crouching() == false) then
		local running = nil;
		local clothes = player:GetCharacterData("clothes");
		local model = string.lower( player:GetModel() );
		
		if (clothes) then
			local itemTable = Clockwork.item:FindByID(clothes);
			
			if (itemTable) then
				if (player:IsRunning() or player:IsJogging()) then
					if (itemTable.runSound) then
						if (type(itemTable.runSound) == "table") then
							sound = itemTable.runSound[ math.random(1, #itemTable.runSound) ];
						else
							sound = itemTable.runSound;
						end;
					end;
				elseif (itemTable.walkSound) then
					if (type(itemTable.walkSound) == "table") then
						sound = itemTable.walkSound[ math.random(1, #itemTable.walkSound) ];
					else
						sound = itemTable.walkSound;
					end;
				end;
			end;
		end;
		
		if (player:IsRunning() or player:IsJogging()) then
			running = true;
		end;
		
		if (running) then
			if (string.find(model, "combine")) then
				if (foot == 0) then
					local randomSounds = {1, 3, 5};
					local randomNumber = math.random(1, 3);
					
					sound = "npc/combine_soldier/gear"..randomSounds[randomNumber]..".wav";
				else
					local randomSounds = {2, 4, 6};
					local randomNumber = math.random(1, 3);
					
					sound = "npc/combine_soldier/gear"..randomSounds[randomNumber]..".wav";
				end;
			end;
		end;
		
		player:EmitSound(sound);
		
		return true;
	end;
end;

-- Called when a player's character data should be restored.
function Schema:PlayerRestoreCharacterData(player, data)
	if (player:GetFaction() == FACTION_SURVIVOR) then
		if (!data["citizenid"] or string.len( tostring( data["citizenid"] ) ) == 4) then
			data["citizenid"] = Clockwork.kernel:ZeroNumberToDigits(math.random(1, 99999), 5);
		end;
	end;
end;

-- Called when a player attempts to restore a recognised name.
function Schema:PlayerCanRestoreRecognisedName(player, target)
	if (self:PlayerIsCombine(target)) then
		return false;
	end;
end;

-- Called when a player attempts to save a recognised name.
function Schema:PlayerCanSaveRecognisedName(player, target)
	if (self:PlayerIsCombine(target)) then
		return false;
	end;
end;

-- Called when a player's character has initialized.
function Schema:PlayerCharacterInitialized(player)
	local faction = player:GetFaction();
	
	if (self:PlayerIsCombine(player)) then
		for k, v in pairs(Clockwork.class.stored) do
			if (v.factions and table.HasValue(v.factions, faction)) then
				if (#_team.GetPlayers(v.index) < Clockwork.class:GetLimit(v.name)) then
					if (v.index == CLASS_CMD and self:IsPlayerCombineRank(player, "CmD")) then
						Clockwork.class:Set(player, v.index); break;
					elseif (v.index == CLASS_EOW and self:IsPlayerCombineRank(player, "EOW")) then
						Clockwork.class:Set(player, v.index); break;
					elseif (v.index == CLASS_OWS and self:IsPlayerCombineRank(player, "OWS")) then
						Clockwork.class:Set(player, v.index); break;
					end;
				end;
			end;
		end;
	elseif (faction == FACTION_GMC) then
		for k, v in pairs(Clockwork.class.stored) do
			if (v.factions and table.HasValue(v.factions, faction)) then
				if (#_team.GetPlayers(v.index) < Clockwork.class:GetLimit(v.name)) then
					if (v.index == CLASS_RECRUIT and self:IsPlayerGmcRank(player, "Pvt")) then
							Clockwork.class:Set(player, v.index); break;
					elseif (v.index == CLASS_ENLISTED and self:IsPlayerGmcRank(player, {"Cpl", "Sgt"})) then
							Clockwork.class:Set(player, v.index); break;
					elseif (v.index == CLASS_OFFICER and self:IsPlayerGmcRank(player, {"Lt", "Cpt", "Maj", "Col"})) then
							Clockwork.class:Set(player, v.index); break;
					elseif (v.index == CLASS_GENERAL and self:IsPlayerGmcRank(player, "Gen")) then
						Clockwork.class:Set(player, v.index); break;
					end;
				end;
			end;
		end;
	else
		self:AddCombineDisplayLine( "Parsing neoteric biosignal anomaly...", Color(255, 100, 255, 255) );
	end;
end;

-- Called when a player's name has changed.
function Schema:PlayerNameChanged(player, previousName, newName)
	local faction = player:GetFaction();
	
	if (self:PlayerIsCombine(player)) then
		if (faction == FACTION_OTA) then
			if (!self:IsStringCombineRank(previousName, "OWS") and self:IsStringCombineRank(newName, "OWS")) then
				Clockwork.class:Set(player, CLASS_OWS);
			elseif (!self:IsStringCombineRank(previousName, "EOW") and self:IsStringCombineRank(newName, "EOW")) then
				Clockwork.class:Set(player, CLASS_EOW);
			elseif (!self:IsStringCombineRank(previousName, "CmD") and self:IsStringCombineRank(newName, "CmD")) then
				Clockwork.class:Set(player, CLASS_CMD);
			end;
		elseif (faction == FACTION_SYNTH) then
			if (!self:IsStringCombineRank(previousName, "HnT") and self:IsStringCombineRank(newName, "HnT")) then
				Clockwork.class:Set(player, CLASS_HUNTER);
			end;
		end;
	end;
	
	if (self:PlayerIsHuman(player)) then
		if (faction == FACTION_GMC) then
			if (!self:IsStringGmcRank(previousName, "Pvt") and self:IsStringGmcRank(newName, "Pvt")) then
					Clockwork.class:Set(player, CLASS_RECRUIT);
			elseif (!self:IsStringGmcRank(previousName, {"Cpl", "Sgt"}) and self:IsStringGmcRank(newName, {"Cpl", "Sgt"})) then
					Clockwork.class:Set(player, CLASS_ENLISTED);
			elseif (!self:IsStringGmcRank(previousName, {"Lt", "Cpt", "Maj", "Col"}) and self:IsStringGmcRank(newName, {"Lt", "Cpt", "Maj", "Col"})) then
					Clockwork.class:Set(player, CLASS_OFFICER);
			elseif (!self:IsStringGmcRank(previousName, "Gen") and self:IsStringGmcRank(newName, "Gen")) then
				Clockwork.class:Set(player, CLASS_GENERAL);
			end;
		end;
	end;
end;

-- Called when a player's character screen info should be adjusted.
function Schema:PlayerAdjustCharacterScreenInfo(player, character, info)
	if (character.data["permakilled"]) then
		info.details = "This character is permanently killed.";
	end;
	
	if (info.faction == FACTION_OTA) then
		if (self:IsStringCombineRank(info.name, {"CmD", "EOW"})) then
			info.model = "models/combine_super_soldier.mdl";
		end;
	end;
	
	if (character.data["customclass"]) then
		info.customClass = character.data["customclass"];
	end;
end;

-- Called when a player's shared variables should be set.
function Schema:PlayerSetSharedVars(player, curTime)
	player:SetSharedVar( "customClass", player:GetCharacterData("customclass", "") );
	player:SetSharedVar( "citizenID", player:GetCharacterData("citizenid", "") );
end;

-- Called to check if a player does recognise another player.
function Schema:PlayerDoesRecognisePlayer(player, target, status, isAccurate, realValue)
	if (self:PlayerIsCombine(target)) then
		return true;
	end;
end;

-- Called when a player attempts to change class.
function Schema:PlayerCanChangeClass(player, class)
	if (player:GetSharedVar("tied") != 0) then
		Clockwork.player:Notify(player, "You cannot change classes when you are tied!");
		
		return false;
	elseif (self:PlayerIsCombine(player)) then
		if (class == CLASS_OWS and !self:IsPlayerCombineRank(player, "OWS")) then
			Clockwork.player:Notify(player, "You are not ranked high enough for this class!");
			
			return false;
		elseif (class == CLASS_EOW and !self:IsPlayerCombineRank(player, "EOW")) then
			Clockwork.player:Notify(player, "You are not ranked high enough for this class!");
			
			return false;
		elseif (class == CLASS_CMD and !self:IsPlayerCombineRank(player, "CmD")) then
			Clockwork.player:Notify(player, "You are not ranked high enough for this class!");
			
			return false;
		end;
	elseif (self:PlayerIsHuman(player)) then
		if (class == CLASS_RECRUIT and !self:IsPlayerGmcRank(Clockwork.Client, "Pvt")) then
				Clockwork.player:Notify(player, "You are not ranked high enough for this class!");
				
				return false;
		elseif (class == CLASS_ENLISTED and !self:IsPlayerGmcRank(Clockwork.Client, {"Cpl", "Sgt"})) then
				Clockwork.player:Notify(player, "You are not ranked high enough for this class!");
				
				return false;
		elseif (class == CLASS_OFFICER and !self:IsPlayerGmcRank(Clockwork.Client, {"Lt", "Cpt", "Maj", "Col"})) then
				Clockwork.player:Notify(player, "You are not ranked high enough for this class!");
				
				return false;
		elseif (class == CLASS_GENERAL and !self:IsPlayerGmcRank(player, "Gen")) then
			Clockwork.player:Notify(player, "You are not ranked high enough for this class!");
			
			return false;
		end;
	end;
end;

-- Called when a player attempts to earn generator cash.
function Schema:PlayerCanEarnGeneratorCash(player, info, cash)
	if (self:PlayerIsCombine(player)) then
		return false;
	end;
end;

-- Called when a player's death sound should be played.
function Schema:PlayerPlayDeathSound(player, gender)
	if (self:PlayerIsCombine(player)) then
		local sound = "npc/combine_soldier/die"..math.random(1, 3)..".wav";
		
		for k, v in ipairs( _player.GetAll() ) do
			if (v:HasInitialized()) then
				if (self:PlayerIsCombine(v)) then
					v:EmitSound(sound);
				end;
			end;
		end;
		
		return sound;
	end;
end;

-- Called when a player's pain sound should be played.
function Schema:PlayerPlayPainSound(player, gender, damageInfo, hitGroup)
	if (self:PlayerIsCombine(player)) then
		return "npc/combine_soldier/pain"..math.random(1, 3)..".wav";
	end;
end;

-- Called just before a player dies.
function Schema:DoPlayerDeath(player, attacker, damageInfo)
	local clothes = player:GetCharacterData("clothes");
	
	if (clothes) then
		player:GiveItem(Clockwork.item:CreateInstance(clothes));
		player:SetCharacterData("clothes", nil);
	end;
end;

-- Called when a player dies.
function Schema:PlayerDeath(player, inflictor, attacker, damageInfo)
	if (self:PlayerIsCombine(player)) then
		local location = self:PlayerGetLocation(player);
		
		self:AddCombineDisplayLine("Downloading lost biosignal...", Color(255, 255, 255, 255), nil, player);
		self:AddCombineDisplayLine("WARNING! Biosignal lost for overwatch unit at "..location.."...", Color(255, 0, 0, 255), nil, player);
	end;
end;

-- Called just after a player spawns.
function Schema:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	-- Start secret fun.
	if (player:GetNWBool("initiallySpawned") == false) then
		local randomNum = math.random(0, 100);
		player:SetNWBool("initiallySpawned", true);
		
		if (randomNum >= 99) then
			Clockwork.datastream:Start(player, "FirstSpawnIntro");
			
			player:SetDSP(132, false);
			timer.Simple(9.05, function()
				player:SetDSP(0, false);
			end);
		end;
	end;
	-- End secret fun.
	
	local team = player:Team();
	local skin = Clockwork.class:Query(team, "skin", "");
	
	if (skin != "") then
		player:SetSkin(skin);
	end;
	
	if (!lightSpawn) then
		if (self:PlayerIsCombine(player)) then
			if (player:GetFaction() == FACTION_OTA) then
				player:SetMaxHealth(150);
				player:SetMaxArmor(150);
				player:SetHealth(150);
				player:SetArmor(150);
			else
				player:SetArmor(100);
			end;
		end;
	end;
end;