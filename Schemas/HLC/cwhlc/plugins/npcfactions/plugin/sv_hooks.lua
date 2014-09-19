local PLUGIN = PLUGIN;

-- Called when a player presses a key.
function PLUGIN:KeyPress(player, key)
	if (key == IN_USE) then
		local curTime = CurTime();
		local target = player:GetEyeTraceNoCursor().Entity;
		local entity = target;
		local class = entity:GetClass();
		
		if (class == "npc_combine_s" or class == "npc_metropolice") then
			if (!entity.Following or entity.Following == false) then
				PLUGIN:NpcFollow(entity, player);
				entity.Following = true;
				PLUGIN:CombineCopySound(entity)
			elseif (entity.Following == true) then
				PLUGIN:NpcHalt(entity, player);
				entity.Following = false;
				PLUGIN:CombineCopySound(entity)
			end;
		end;
	end;
end;

-- Called just after a player spawns.
function PLUGIN:PostPlayerSpawn(player, lightSpawn, changeClass, firstSpawn)
	player:SetVar("faction", nil);
	
	if (player:GetVar("faction") == nil) then
		model = string.sub(player:GetModel(), 15, -5);
		local factionName = "";
		
		if ( Schema:PlayerIsCombine(player) ) then
			factionName = "f_combine"
		elseif ( Schema:PlayerIsHuman(player) ) then
			factionName = "f_human"
		elseif model == "corpse1" || model == "charple01" || model == "classic" then
			factionName = "f_zombie"
		end;
		player:SetVar("faction", factionName)
		player:SetName(factionName)
		
		for k, v in pairs( ents.FindByClass("npc_*") ) do
			SetNpcFaction(player, v);
		end;
	end;
end;