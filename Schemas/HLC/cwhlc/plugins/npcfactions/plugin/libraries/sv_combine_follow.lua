local PLUGIN = PLUGIN;
local Schema = Schema;

function PLUGIN:NpcFollow(entity, player)
	PLUGIN:NpcHalt(entity);
	entity.m_tbDisp = entity.m_tbDisp or {};
	local hk = entity:EntIndex() .. player:EntIndex();
	entity.m_tbDisp[entity] = entity.m_tbDisp[entity] or {};
	entity.m_tbDisp[entity][player] = entity:Disposition(player);
	
	if (player:IsNPC()) then
		entity.m_tbDisp[player] = entity.m_tbDisp[player] or {};
		entity.m_tbDisp[player][entity] = player:Disposition(entity);
		player:AddEntityRelationship(entity,D_LI,100);
	end
	
	if (player:IsNPC() or player:IsPlayer()) then
		entity:AddEntityRelationship(player,D_LI,100);
	end
	
	
	if (entity.bScripted) then
		entity.fFollowDistance = 300;
		entity:SetBehavior(1,player); 
		return
	end
	
	local nextUpdate = CurTime();
	local last;
	
	hook.Add("Think", hk, function()
		if (!player:IsValid() or !entity:IsValid()) then
			hook.Remove("Think", hk);
		elseif (Schema:PlayerIsCombine(player)) then
			if (CurTime() >= nextUpdate) then
				nextUpdate = CurTime() + 0.5;
				local playerPos = player:GetPos();
				local entityPos = entity:GetPos();
				
				if (!last or !entity:IsCurrentSchedule(SCHED_FORCED_GO_RUN) or playerPos:Distance(last) > 300) then
					last = playerPos;
					local d = math.max(entityPos:Distance(playerPos) -(entity:OBBMaxs().x +player:OBBMaxs().x),0);
					local runSchedule = SCHED_FORCED_GO_RUN;
					local walkSchedule = SCHED_FORCED_GO;
					
					if( d > 300 ) then
						entity:SetLastPosition(playerPos);
						entity:SetSchedule(runSchedule);
					elseif (entity:IsCurrentSchedule(runSchedule)) then
						entity:ClearSchedule();
						entity:StopMoving();
					end;
				end;
			end;
		else
			hook.Remove("Think", hk);
		end;
	end)
end;

function PLUGIN:NpcHalt(entity)
	if (!entity.m_tbDisp) then return end;
	if (!entity.m_tbDisp[entity]) then return end;
	
	for player,disp in pairs(entity.m_tbDisp[entity]) do
		if (player:IsValid()) then
			hook.Remove("Think", entity:EntIndex() .. player:EntIndex());
			entity:AddEntityRelationship(player, disp, 100);
			entity.m_tbDisp[entity][player] = nil;
			if (!player:IsPlayer()) then
				if (entity.m_tbDisp[player] and entity.m_tbDisp[player][entity]) then
					player:AddEntityRelationship(entity,entity.m_tbDisp[player][entity],100);
					entity.m_tbDisp[player][entity] = nil;
				else
					player:AddEntityRelationship(entity, disp, 100);
				end;
			end;
		end;
	end;
end;

function PLUGIN:CombineCopySound(entity)
	local randomSounds = {
		"npc/combine_soldier/vo/copy.wav",
		"npc/combine_soldier/vo/copythat.wav",
		"npc/metropolice/vo/ten4.wav"
	}
	local randomSound = randomSounds[ math.random(1, #randomSounds) ];
	
	entity:EmitSound(randomSound);
end;