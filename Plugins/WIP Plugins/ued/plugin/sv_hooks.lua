local PLUGIN = PLUGIN;

-- BEGIN RADIO JAMMER STUFF --
-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	Clockwork.kernel:SetSharedVar("jammingDistance", 300);
end;

-- A function to load the item spawns.
function PLUGIN:EmitRandomSound(player)
	local randomSounds = {
		"ambient/energy/spark1.wav",
		"ambient/energy/spark2.wav",
		"ambient/energy/spark3.wav",
		"ambient/energy/spark4.wav",
		"ambient/energy/spark5.wav",
		"ambient/energy/spark6.wav"
	};
	
	local randomSound = randomSounds[ math.random(1, #randomSounds) ];
	player:EmitSound( randomSound, 45)
end;

-- Called each tick.
function PLUGIN:Tick()
	for k, v in pairs(player.GetAll()) do
		if (v:GetSharedVar("jammerActive") == 1) then
			local curTime = CurTime();
			
			if (!self.nextSoundEmit) then
				self.nextSoundEmit = curTime + math.random(1, 5);
			end;
			
			if ( (curTime >= self.nextSoundEmit) ) then
				self.nextSoundEmit = nil;
				
				PLUGIN:EmitRandomSound(v);
			end;
		end;
		
		local jammerPos;
		local jammedPos;
		
		if (v:GetSharedVar("jammerActive") == 0) then
			jammedPos = v:GetPos();
		end;
		
		for k2, v2 in pairs(player.GetAll()) do
			if (v2:GetSharedVar("jammerActive") == 1) then
				jammerPos = v2:GetPos();
			end;
		end;
		
		if (v:GetSharedVar("jammerActive") == 0) then
			if ((jammerPos != nil) and (jammedPos != nil)) then
				if (jammerPos:Distance(jammedPos) < Clockwork.kernel:GetSharedVar("jammingDistance")) then
					if (v:GetSharedVar("jammed") != 1) then
						v:SetSharedVar("jammed", 1);
						print(v:Name() .. " was jammed.");
					end;
				else
					if (v:GetSharedVar("jammed") != 0) then
						v:SetSharedVar("jammed", 0);
						print(v:Name() .. " was unjammed.");
					end;
				end;
			end;
		end;
	end;
end;

-- Called when attempts to use a command.
function PLUGIN:PlayerCanUseCommand(player, commandTable, arguments)
	if (player:GetSharedVar("jammed") == 1) then
		local blacklisted = {
			"Broadcast",
			"Dispatch",
			"Request",
			"Radio"
		};
		
		if (table.HasValue(blacklisted, commandTable.name)) then
			Clockwork.player:Notify(player, "A gurggling static sound comes out of your device.");
			return false;
		end;
	end;
end;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	player:SetSharedVar("jammed", 0);
	player:SetSharedVar("jammerActive", 0);
end;
-- END RADIO JAMMER STUFF --

-- BEGIN UED ORGNIZATION STUFF --
-- Called when a player's default model is needed.
function PLUGIN:GetPlayerDefaultModel(player)
	local faction = player:GetFaction();
	
	if (Schema:IsCombineFaction(faction)) then
		if (Schema:IsPlayerCombineRank(player, "UED")) then
			return "models/eliteshockcp.mdl";
		end;
	end;
end;

-- Called when a player's character has initialized.
function PLUGIN:PlayerCharacterInitialized(player)
	if (Schema:PlayerIsCombine(player)) then
		for k, v in pairs(Clockwork.class.stored) do
			if (v.factions and table.HasValue(v.factions, player:GetFaction())) then
				if (#_team.GetPlayers(v.index) < Clockwork.class:GetLimit(v.name)) then
					if (v.index == CLASS_EMP and Schema:IsPlayerCombineRank(player, "UED")) then
						Clockwork.class:Set(player, v.index); break;
					end;
				end;
			end;
		end;
	end;
end;

-- Called when a player's name has changed.
function PLUGIN:PlayerNameChanged(player, previousName, newName)
	if (Schema:PlayerIsCombine(player)) then
		if (player:GetFaction() == FACTION_MPF) then
			if (!Schema:IsStringCombineRank(previousName, "UED") and Schema:IsStringCombineRank(newName, "UED")) then
				Clockwork.class:Set(player, CLASS_EMP);
			end;
		end;
	end;
end;

-- Called when a player's character screen info should be adjusted.
function PLUGIN:PlayerAdjustCharacterScreenInfo(player, character, info)
	if (Schema:IsCombineFaction(info.faction)) then
		if (Schema:IsStringCombineRank(info.name, "UED")) then
			info.model = "models/eliteshockcp.mdl";
		end;
	end;
end;

-- Called when a player attempts to change class.
function PLUGIN:PlayerCanChangeClass(player, class)
	if (Schema:PlayerIsCombine(player)) then
		if (class == CLASS_EMP and !Schema:IsPlayerCombineRank(player, "UED")) then
			Clockwork.player:Notify(player, "You are not ranked high enough for this class!");
			
			return false;
		end;
	end;
end;
-- END UED ORGANIZATION STUFF --